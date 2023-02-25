## Deving out posible functions for a faceoff (4D tic tac toe) app.

cube.dotline <- function(
    p = 4,
    n = 3
) {
  require(geozoo)
  n <- n - 2 #exclude corners
  stopifnot(n >= 0)
  cube_verts <- geozoo:::cube_vertices(p)
  cube_wire <- geozoo:::cube_wires(p)
  dot_lines <- NULL
  for (j in 1:(nrow(cube_wire))) {
    x <- cube_wire[j, 2]
    y <- cube_wire[j, 1]
    d1 <- (cube_verts[x, ] - cube_verts[y, ])
    d3 <- sum(d1^2)
    if (d3 == 1) {
      d2 <- sum(abs(d1))
      if (d2 == 1) {
        for (k in 1:p) {
          if (d1[k] == 1 & n > 0) {
            tmp <- matrix(rep(cube_verts[y, ], n + 1), 
                          ncol = p, byrow = TRUE)
            tmp[2:(n + 1), k] <- seq(
              length = n, from = 1/(n + 1), by = 1/(n + 1))
            dot_lines <- rbind(dot_lines, tmp[2:(n + 1), ])
          }
        }
      }
    }
  }
  vert <- rbind(cube_verts, dot_lines)
  structure(list(points = vert, edges = cube_wire), class = c("geozooNoScale", 
                                                              "geozoo"))
}

cube.dotline(p = 4, n=2)
