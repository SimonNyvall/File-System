#Moves files.
function MoveFile ($souse, $newLocation){
    try {
        Move-Item -Path $souse -Destination $newLocation;
    }
    catch {
        Write-Host 'Computing file...';
    }
}
function ABCFolderSort{
    #Creats the directorys.
    foreach ($char in $folderAlphabet){
        New-Item -Path ($newSort + "\" + $char) -ItemType Directory;
    }
    #Sorts the file by alphanetic order.
    foreach ($file in Get-ChildItem -Path $orgSort){
        foreach ($startChar in $compareAlphabet){
            if ($startChar -eq $file.Name.ToString()[0]){
                MoveFile -souse $file -newLocation ($newSort + "\" + $startChar.ToUpper());
            }
        }
    }
}
function tagFolderSort{
    #Creat the directorys.
    foreach ($tag in $tagArray){
        New-Item -Path ($newSort + "\" + $tag) -ItemType Directory;
    }
    #Sort the files by tag type.
    foreach ($file in Get-ChildItem -Path $orgSort){
        foreach ($tag in $tagArray){
            $comapreTag = $file.ToString().Split(".")[1];
            if ($comapreTag -eq $tag){
                MoveFile -souse $file -newLocation ($newSort + "\" + $tag);
            }
        }
    }
}
#Check if extentionh exitis.
function checkForFileTag {
    $tagArray =@();
    foreach ($file in Get-ChildItem $orgSort -Name){
        $tagArray += $file.split(".")[1];
    }
    tagFolderSort;
}

#Gets the probibilitis of the diritory.
Get-ChildItem -Path $orgSort

#Asks the user.
Write-Host '[y / N]';
$awnser = Read-Host;
if ($awnser -eq 'y'){
    $newSort = Read-Host 'Enter new location';

    $SortAwnser = Read-Host 'ABC sort or tag sort?';
    if ($SortAwnser -eq "ABC"){
        ABCFolderSort;
    } else{
        checkForFileTag;
    }
} elseif ($awnser -eq 'N') {
    Write-Host 'Program Termination...';
}

#vars.
$tagArray =@();
$orgSort = Read-Host 'What folder do you like to sort?';
$newSort;
$compareAlphabet = "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Å","Ä","Ö","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","å","ä","ö";
$folderAlphabet = "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Å","Ä","Ö";