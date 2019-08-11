function setIt(){
    document.getElementById("addOb").style.display="none";
    document.getElementById("removeOb").style.display="none";
    document.getElementById("changePassword").style.display = "none";
    document.getElementById("addEvent").style.display = "none";
    document.getElementById("removeEvent").style.display = "none";
    document.getElementById("viewOb").style.display="none";
    document.getElementById("viewMembers").style.display = "none";
    
    var type = document.getElementById("displaySubmenu");
    type = type.value;
    var adminSubMenu = document.getElementsByClassName("adminSubMenu");
    var obSubMenu = document.getElementsByClassName("obSubMenu");
    document.getElementById("intro").style.display = "block";
    if(type=='admin')
    {
        for(var i=0;i<adminSubMenu.length;i++){
            adminSubMenu[i].style.display = "block";
        }
        for(var i=0;i<obSubMenu.length;i++){
            obSubMenu[i].style.display = "none";
        }
    }
    if(type=='ob')
    {
        for(var i=0;i<obSubMenu.length;i++)
            obSubMenu[i].style.display = "block";
        
        for(var i=0;i<adminSubMenu.length;i++)
            adminSubMenu[i].style.display = "none";
    }
}
function displayAddOb(){
    document.getElementById("addOb").style.display="block";
    document.getElementById("removeOb").style.display="none";
    
    document.getElementById("intro").style.display = "none";
    document.getElementById("changePassword").style.display = "none";
    document.getElementById("viewOb").style.display="none";
}
function displayRemoveOb(){
    document.getElementById("removeOb").style.display="block";
    document.getElementById("addOb").style.display="none";

    document.getElementById("intro").style.display = "none";
    document.getElementById("changePassword").style.display = "none";
    document.getElementById("viewOb").style.display="none";
}

function displayChangePassword(){
    document.getElementById("changePassword").style.display = "block";
    document.getElementById("removeOb").style.display="none";

    document.getElementById("addOb").style.display="none";
    document.getElementById("intro").style.display = "none";
    
    document.getElementById("addEvent").style.display = "none";
    document.getElementById("removeEvent").style.display = "none";
    
    
    document.getElementById("viewOb").style.display="none";
    
    document.getElementById("viewMembers").style.display = "none";
    
}


function displayAddEvent(){
    document.getElementById("addEvent").style.display = "block";
    
    document.getElementById("changePassword").style.display = "none";
    document.getElementById("intro").style.display = "none";
    document.getElementById("removeEvent").style.display = "none";
    document.getElementById("viewMembers").style.display = "none";
}

function displayRemoveEvent(){
    document.getElementById("removeEvent").style.display = "block";
    document.getElementById("viewMembers").style.display = "none";
    document.getElementById("addEvent").style.display = "none";
    document.getElementById("changePassword").style.display = "none";
    document.getElementById("intro").style.display = "none";
    document.getElementById("viewMembers").style.display = "none";
}

function displayViewMembers(){
    document.getElementById("viewMembers").style.display = "block";
    
    document.getElementById("removeEvent").style.display = "none";
    document.getElementById("addEvent").style.display = "none";
    document.getElementById("changePassword").style.display = "none";
    document.getElementById("intro").style.display = "none";
    document.getElementById("clubMembers").style.display = "none";
}

function displayViewOb(){
    document.getElementById("viewOb").style.display="block";
    document.getElementById("removeOb").style.display="none";
    document.getElementById("addOb").style.display="none";

    document.getElementById("intro").style.display = "none";
    document.getElementById("changePassword").style.display = "none";
}

