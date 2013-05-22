# fonction pour Likert

toLikert<-function(data,q,maxq=8){
  p<-paste("data$",q,sep="")
  print(p[1])
  for(i in 1:length(data)){
    z<-0;
    z[1:maxq]<-0;
    z[as.integer(paste(p,"[",i,"]"))]<-1;
    a<-rbind(z)
  }
   Q<-apply(a,2,sum)
  return(Q)
}