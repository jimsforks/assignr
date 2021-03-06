% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignr.R
\name{assignr}
\alias{assignr}
\title{Create Homework and Assignment Materials}
\usage{
assignr(
  file,
  output_dir = NULL,
  output_format = c("html_document", "pdf_document"),
  assign_file = TRUE,
  soln_file = TRUE,
  zip_files = TRUE,
  render_files = TRUE
)
}
\arguments{
\item{file}{Input `.Rmd` file with `-main.Rmd` in the filename.}

\item{output_dir}{Output directory. Defaults to name of prefix of filename.}

\item{output_format}{Output file type.  Any [rmarkdown::render()] output
format should work.
Defaults to generating both an HTML and PDF output with
`c("html_document", "pdf_document")`.}

\item{assign_file}{Generate Student Assignment Material. Default is `TRUE`.}

\item{soln_file}{Generate Solution Material. Default is `TRUE`.}

\item{zip_files}{Create a zip file containing the relevant materials.
Default is `TRUE`.}

\item{render_files}{Create HTML and PDF output for each Rmd file.
Default is `TRUE`.}
}
\value{
The function will generate assignment files for students and
solution keys for instructors.
}
\description{
Transforms an RMarkdown file into two separate files: `filename-assign`
and `filename-solutions`
}
\details{
The `file` parameter _must_ have the suffix `-main.Rmd`. The reason for
requiring this naming scheme is all work should be done in the "main"
document. By enforcing the naming requirement, we are prevent work from
being overridden.
}
\section{Folder structure}{

If `output_dir` is specified, then it will be used as the parent
for two folders: `*-assign` and `*-sol`, where `*` is given by the part
preceeding `-main.Rmd`. Inside the folders, there will be `html`, `pdf`,
and `Rmd` documents alongside a `zip` a folder containing all of the
documents.
}

\examples{
# Obtain an example file
hw00_file = get_example_filepath("hw00-main.Rmd")

if(interactive()) {
    file.show(hw00_file)
}

# Generate both PDF and HTML outputs for assign and solution.
assignr(hw00_file, "test")

# Generate only the assignment
assignr(hw00_file, "assignment-set", soln_file = FALSE)

# Generate only the solution
assignr(hw00_file, "solution-set", assign_file = FALSE)

# Create only HTML documents for both assignment and solution files.
assignr(hw00_file, "test-html", output_format = "html_document")

\dontshow{
# Clean up generated directories
unlink("test", recursive = TRUE)
unlink("assignment-set", recursive = TRUE)
unlink("solution-set", recursive = TRUE)
unlink("test-html", recursive = TRUE)
}
}
