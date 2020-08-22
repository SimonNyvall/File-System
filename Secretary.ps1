#region Form
# x
    [void] [reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

    $Form1 = New-Object System.Windows.Forms.Form
    
    #region path
    #Path buttoms and textbox.
    $pathButtonOrg = New-Object System.Windows.Forms.Button
    $pathButtonDest = New-Object System.Windows.Forms.Button

    $pathTextBoxOrg = New-Object System.Windows.Forms.TextBox
    $pathTextBoxDest = New-Object System.Windows.Forms.TextBox

    $pathGroup = New-Object System.Windows.Forms.GroupBox

    #region Buttons size, location
    #Buttons
    $pathButtonOrg.Location = New-Object "System.Drawing.Point" -ArgumentList 308,61
    $pathButtonOrg.Size = New-Object "System.Drawing.Size" -ArgumentList 75,26

    $pathButtonDest.Location = New-Object "System.Drawing.Point" -ArgumentList 308,113
    $pathButtonDest.Size = New-Object "System.Drawing.Size" -ArgumentList 75,26

    #TextBox
    $pathTextBoxOrg.Location = New-Object "System.Drawing.Point" -ArgumentList 6,61
    $pathTextBoxOrg.Size = New-Object "System.Drawing.Size" -ArgumentList 296,26

    $pathTextBoxDest.Location = New-Object "System.Drawing.Point" -ArgumentList 6,113
    $pathTextBoxDest.Size = New-Object "System.Drawing.Size" -ArgumentList 296,26

    $pathGroup.Location = New-Object "System.Drawing.Point" -ArgumentList 12, 36
    $pathGroup.Size = New-Object "System.Drawing.Size" -ArgumentList 399,168
    $pathGroup.Text = 'Location Input'
    #endregion

    $Form1.Controls.add($pathButtonOrg)
    $Form1.Controls.add($pathButtonDest)
    $Form1.Controls.add($pathTextBoxOrg)
    $Form1.Controls.add($pathTextBoxDest)

    $Form1.Controls.add($pathGroup)
    #endregion

    #region sort
    $sortGroup = New-Object System.Windows.Forms.GroupBox
    
    #endregion

    $Form1.ShowDialog()
#endregion

#region File transport
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

$orgSort = Read-Host 'What folder do you like to sort?';
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
$newSort;
$compareAlphabet = "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Å","Ä","Ö","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z";
$folderAlphabet = "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z";
#endregion
