add<-function(x){
  x+1
}
add(4)

add<-function(x=5){
  z<-x+1
  return(z)
}
add()
add(6)

add1<-function(x){
  z<-x+10
  return(c(z,x))
}
add1(5)

newfunc<-function(x,y){
  z<-2*x+y
  return(c(z,x,y))
}
a2b<-newfunc(2,4)