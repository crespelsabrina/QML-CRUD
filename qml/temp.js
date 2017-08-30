
var aOfTablo= [];
aOfTablo[0]= [];
aOfTablo[0]["nom"]= "Pagan";
aOfTablo[0]["prenom"]= "JiJou";
aOfTablo[0]["age"]= "28";

aOfTablo[1]= [];
aOfTablo[1]["nom"]= "Mas";
aOfTablo[1]["prenom"]= "Dominique";
aOfTablo[1]["age"]= "25";

aOfTablo[2]= [];
aOfTablo[2]["nom"]= "Bachri";
aOfTablo[2]["prenom"]= "Amine";
aOfTablo[2]["age"]= "27";

function buildTableau()	{
    var sHTML= "";
    sHTML+= "<tr>";
    sHTML+= "<td>Nom</td>";
    sHTML+= "<td>Prénom</td>";
    sHTML+= "<td>Age</td>";
    sHTML+= "</tr>";

    for (var i=0; i<aOfTablo.length; i++)	{
        sHTML+= "<tr onClick=\"editUser(" + i + ")\">";
        sHTML+= "<td>" + aOfTablo[i]["nom"] + "</td>";
        sHTML+= "<td>" + aOfTablo[i]["prenom"] + "</td>";
        sHTML+= "<td>" + aOfTablo[i]["age"] + "</td>";
        sHTML+= "</tr>";
    }

    document.getElementById('mon_tableau').innerHTML= sHTML;
}

function emptyTableau()	{
    document.getElementById('mon_tableau').innerHTML= "";
}

function editUser(iIncideTablo)	{
    document.getElementById('nom').value= aOfTablo[iIncideTablo]["nom"];
    document.getElementById('prenom').value= aOfTablo[iIncideTablo]["prenom"];
    document.getElementById('age').value= aOfTablo[iIncideTablo]["age"];
}

function addUser()	{
    var iNewIndice= aOfTablo.length;
    aOfTablo[iNewIndice]= [];
    aOfTablo[iNewIndice]["nom"]= document.getElementById('nom').value;
    aOfTablo[iNewIndice]["prenom"]= document.getElementById('prenom').value;
    aOfTablo[iNewIndice]["age"]= document.getElementById('age').value;
    buildTableau();
}
