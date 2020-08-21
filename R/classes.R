setClass("gtab",
         slots = list(bvals = "numeric",
                        qvals = "numeric",
                        bvecs = "matrix",
                        b0_ind = "logical",
                        bval_uni = "integer",
                        bval_n = "integer"
        ))

setClass("qmm",
         slots = list(
                 signal = "array"),
         contains = ("gtab")
         )


# Functions for creating classes

#' Create a gradient table Object
#' @param bvec the gradient directions matrix file
#' @param bval the b-values file
#' @return A gradient table object
#' @author R.C.S
#' @export

gradient <- function (bvec, bval) {

        bvec = as.matrix(read.delim2(bvec, header = F))
        bval = as.numeric(read.table(bval, header = F))
        b0_ind = bval == 0
        bval_uni = unique(bval[!b0_ind])
        bval_n = length(unique(bval[!b0_ind]))


        gtab <- new("gtab",
                    bvals = bval,
                    qvals = sqrt(bval),
                    bvecs = bvec,
                    b0_ind = b0_ind,
                    bval_uni = as.integer(bval_uni),
                    bval_n = bval_n
            )

        return(gtab)

        }

#' Create a qmm object
#' @param nifti A nifti object with dwi data
#' @param gradient A gtab object created with \codegradient()
#' @return A qmm object
#' @author R.C.S
#' @export

qmm <- function (nifti, gtab){

        # Checks
        if (!is.nifti(nifti)) {
                message("nifti should be a nifti object")
                return(NULL)
        }

        signal <- nifti

        new("qmm",
            signal = signal,
            bvals = gtab@bvals,
            qvals = gtab@qvals,
            bvecs = gtab@bvecs,
            b0_ind = gtab@b0_ind,
            bval_uni = gtab@bval_uni,
            bval_n = gtab@bval_n )

}
