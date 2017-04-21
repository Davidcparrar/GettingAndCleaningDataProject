code_book <- function(x, name = "CodeBook.md"){
  #Create File
  if(!file.exists(name))
    file.create(name)
  
  #Set the text sections of Codebook file
  description <- "The data was obtained from the Human Activity Recognition Using Smartphones Dataset and corresponds to the mean value of 66 variables from an experiment of  30 volunteers (subjetcs) within an age bracket of 19-48 years. Each person performed six activities (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Originaly the experiment performed measurments (signals) on the 30 subjects with an accelerometer and a gyroscope. The raw data was tidied up and processed for this dataset"
  source <- "The variables for this data set come from the the coursera link [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), for more information on the raw dataset please refer to [UCI machine learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), or the authors of the study:"
  authors <- "> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012"
  usage <- "to obtain the data set run the following command:\n\n  source(\"run_analysis.R\")\n\n The data set will be store in the data set tidy_df\n"
  
  
  #Determine values of table
  vectnames <- names(x)
  vectnRows <- nrow(x)
  vectseq <- 1:length(vectnames)
  type <- unname(sapply(x,class))
  format <- paste("A data frame with ",vectnRows," observations on ",length(vectnames), " variables    ")
  
  #Open file and write info
  sink(name)
    cat("tidy_df dataset {datasets}")
    cat("\n")
    cat("# Mean Values of the Human Activity Recognition Using Smartphones Dataset")
    cat("\n")
    cat("## Description")
    cat("\n")
    cat(description)
    cat("\n")
    cat("## Usage")
    cat("\n")
    cat(usage)
    cat("\n")
    cat("## Format")
    cat("\n")
    cat(format)
    cat("\n")
    cat("\n")
    
    #Table header in html
    cat("<table>",sep ="\n")
    cat("<thead>",sep ="\n")
    cat("<tr>",sep ="\n")
    cat("<th> </th>",sep ="\n")
    cat("<th>Variable</th>",sep ="\n")
    cat("<th>Type</th>",sep ="\n")
    cat("<th>Range</th>",sep ="\n")
    cat("</tr>",sep ="\n")
    cat("</thead>",sep ="\n")
    cat("<tbody>",sep ="\n")
    
    #Table contents
    for(i in 1:length(vectnames)){
    cat("<tr>",sep ="\n")
    cat(paste0("<td>[,",i,"]</td>"),sep ="\n")
    cat(paste0("<td>",vectnames[i],"</td>"),sep ="\n")
    cat(paste0("<td>",type[i],"</td>"),sep ="\n")
    if(identical(type[i],"factor")){
      leng <- nrow(unique(x[,i]))
      cat(paste0("<td>",leng," factors</td>"),sep ="\n")
    }
    else if(identical(type[i],"numeric")|| identical(type[i],"integer")){
      cat(paste0("<td>(",round(min(x[,i]),4),",",round(max(x[,i]),3),")</td>"),sep ="\n")
    }
    cat("</tr>",sep ="\n")
    }
    #Finish table
    cat("</tbody></table>",sep ="\n")
    cat("\n")
    
    #Write subsequent section
    cat("## Source")
    cat("\n")
    cat(source)
    cat("\n")
    cat(authors)
    
  #Close file
  sink()
}