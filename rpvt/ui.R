############################################
# UI - dashboardPage
############################################
dh<- dashboardHeader(title = "rpivotTable Demo")
dsb<-dashboardSidebar(
  sidebarMenu(id="mysidebar",
              menuItem("Create Pivot", tabName = "createpivot", icon = icon("dashboard"))
             ,selectInput("dataset","Dataset:"
                           ,choices=csvnames
                           ,selected = "births"
              )             
            )
          
  )

db<- dashboardBody(
  tabItems(
    # First tab content
    tabItem(tabName = "createpivot"
      ,fluidRow(box(h3("Create your own pivot table")))
       ,br()
       ,fluidRow(box(rpivotTableOutput("pivot", width = "100%", height = "100%")))
       ,br()
      )
    )
  )


dashboardPage(skin = "blue",dh,dsb,db)