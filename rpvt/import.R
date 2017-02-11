#####################################
# import files
#####################################
data.folder<-'data'
rda.folder<-'./rda'
dir.create(rda.folder)

all.files = data.frame(filename=list.files(path=data.folder,pattern="*",recursive = F))

head(all.files)
all.files$ext<-tolower(tools::file_ext(all.files$filename))
all.files$nm<-sapply(1:nrow(all.files),function(x){
  paste(make.names(gsub(paste(".",all.files$ext[x],sep=""), "", all.files$filename[x])),all.files$ext[x],sep="_")
})
all.files$fullname<-paste(data.folder,all.files$filename,sep="/")         
all.files$rdafullname<-paste(rda.folder,'/',all.files$nm,".rda",sep="")
str(all.files)



######################################
#process csv
######################################
csv.files<-all.files[all.files$ext=="csv",]

head(csv.files)

list2env(
  lapply(setNames(csv.files$fullname, csv.files$nm)
         ,read.csv)
  , envir = .GlobalEnv)

str(csv.files)
lapply(1:nrow(csv.files),function(x){
  print(x)
  saveRDS(file=csv.files$rdafullname[x],get(csv.files$nm[1]))
})



######################################
#process csv
######################################
csv.files<-all.files[all.files$ext=="csv",]

head(csv.files)

list2env(
  lapply(setNames(csv.files$fullname, csv.files$nm)
         ,read.csv)
  , envir = .GlobalEnv)

str(csv.files)
lapply(1:nrow(csv.files),function(x){
  print(x)
  saveRDS(file=csv.files$rdafullname[x],get(csv.files$nm[1]))
})


rdafiles = list.files(pattern="*.rda",recursive = T)
