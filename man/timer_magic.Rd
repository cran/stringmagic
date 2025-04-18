% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/string_magic_main.R
\name{timer_magic}
\alias{timer_magic}
\title{Sets up a timer that can be used within \verb{_magic} functions}
\usage{
timer_magic()
}
\value{
This function does not return anything and is only intended to be used in
conjunction with future calls of \code{\link[=string_magic]{string_magic()}}.
}
\description{
Sets up a timer which can later be summoned by \code{\link[=string_magic]{string_magic()}} functions via
the \code{.timer}, \code{.timer_lap} and \code{.timer_total} variables. Useful to report
timings within functions with the function \code{\link[=cat_magic]{cat_magic()}} or \code{\link[=message_magic]{message_magic()}}.
}
\details{
This functions sets up a timer with \code{\link[base:Sys.time]{base::Sys.time()}}. This timer can then be tracked
and modified with the \code{.timer}, \code{.timer_lap} and \code{.timer_total} variables within
\code{\link[=cat_magic]{cat_magic()}} or \code{\link[=message_magic]{message_magic()}}.

Note that the timer is precise at +/- 1ms, hence it should \strong{not} be used to time
algorithms with very short execution times.

It works by saving the current system time in R options (\code{stringmagic_timer} and \code{stringmagic_timer_origin}).
Hence, since it uses options, it should not be used in parallel processes.
}
\examples{

# simple example where we time the execution of some elements in a function
# we trigger the message conditionally on the value of the argument `debug`.
rnorm_crossprod = function(n, mean = 0, sd = 1, debug = FALSE){
  # we set the timer
  timer_magic()
  # we compute some stuff
  x = rnorm(n, mean, sd)
  # we can report the time with .timer
  message_magic("{15 align ! Generation}: {.timer}", .trigger = debug)
  
  res = x \%*\% x
  message_magic("{15 align ! Product}: {.timer}",
                "{15 align ! Total}: {.timer_total}", 
                .sep = "\n", .trigger = debug)
  res
}

rnorm_crossprod(1e5, TRUE)


}
\seealso{
Other tools with aliases: 
\code{\link{string_clean_alias}()},
\code{\link{string_magic}()},
\code{\link{string_magic_alias}()},
\code{\link{string_ops_alias}()},
\code{\link{string_vec_alias}()}
}
\author{
Laurent Berge
}
