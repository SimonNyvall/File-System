#region Form
[void] [reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

$Form1 = New-Object System.Windows.Forms.Form
    
#region Path Form
#Path buttoms and textbox.
$pathButtonOrg = New-Object System.Windows.Forms.Button
$pathButtonDest = New-Object System.Windows.Forms.Button

$pathTextBoxOrg = New-Object System.Windows.Forms.TextBox
$pathTextBoxDest = New-Object System.Windows.Forms.TextBox

$pathGroup = New-Object System.Windows.Forms.GroupBox

#region Buttons size, location
#Buttons
$pathButtonOrg.Location = New-Object "System.Drawing.Point" -ArgumentList 308, 61
$pathButtonOrg.Size = New-Object "System.Drawing.Size" -ArgumentList 75, 26

$pathButtonDest.Location = New-Object "System.Drawing.Point" -ArgumentList 308, 113
$pathButtonDest.Size = New-Object "System.Drawing.Size" -ArgumentList 75, 26

#TextBox
$pathTextBoxOrg.Location = New-Object "System.Drawing.Point" -ArgumentList 6, 61
$pathTextBoxOrg.Size = New-Object "System.Drawing.Size" -ArgumentList 296, 26

$pathTextBoxDest.Location = New-Object "System.Drawing.Point" -ArgumentList 6, 113
$pathTextBoxDest.Size = New-Object "System.Drawing.Size" -ArgumentList 296, 26

$pathGroup.Location = New-Object "System.Drawing.Point" -ArgumentList 12, 36
$pathGroup.Size = New-Object "System.Drawing.Size" -ArgumentList 399, 168
$pathGroup.Text = 'Location Input'
#endregion

$Form1.Controls.add($pathButtonOrg)
$Form1.Controls.add($pathButtonDest)
$Form1.Controls.add($pathTextBoxOrg)
$Form1.Controls.add($pathTextBoxDest)

$Form1.Controls.add($pathGroup)
#endregion Path Form

#region Form Sorting
$sortGroup = New-Object System.Windows.Forms.GroupBox

#Check box.
$sortCheckBox_ABC = New-Object System.Windows.Forms.CheckBox
$sortCheckBox_Tag = New-Object System.Windows.Forms.CheckBox
$sortCheckBox_Date = New-Object System.Windows.Forms.CheckBox
$sortCheckBox_Sort = New-Object System.Windows.Forms.CheckBox

#Sets the location and sezes of the sorting GUI
$sortGroup.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortGroup.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortCheckBox_ABC.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortCheckBox_ABC.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortCheckBox_Tag.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortCheckBox_Tag.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortCheckBox_Date.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortCheckBox_Date.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortCheckBox_Sort.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortCheckBox_Sort.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

#Adding to the control group
$Form1.Controls.add($sortGroup)
$Form1.Controls.add($sortCheckBox_ABC)
$Form1.Controls.add($sortCheckBox_Tag)
$Form1.Controls.add($sortCheckBox_Date)
$Form1.Controls.add($sortCheckBox_Sort)

#Sort Buttons and textbox for moving files.
$sortButtonSort = New-Object System.Windows.Forms.Button
$sortButtonReset = New-Object System.Windows.Forms.Button

$sortTextBoxMovinglist = New-Object System.Windows.Forms.TextBox

$sortProgressbar = New-Object System.Windows.Forms.ProgressBar

#Seze and location for sorting buttons, textbox and progressbar
$sortButtonSort.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortButtonSort.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortButtonReset.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortButtonSort.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortTextBoxMovinglist.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortTextBoxMovinglist.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

$sortProgressbar.Location = New-Object "System.Drawing.Point" -ArgumentList 1, 1
$sortProgressbar.Size = New-Object "System.Drawing.Size" -ArgumentList 1, 1

#Adding to form control
$Form1.Controls.Add($sortButtonSort)
$Form1.Controls.Add($sortButtonReset)
$Form1.Controls.Add($sortTextBoxMovinglist)
$Form1.Controls.Add($sortProgressbar)
#endregion Form Sorting

#region text and Info

#endregion Text and Info

$Form1.ShowDialog()
#endregion Form

#region File transport
#Moves files.
function MoveFile ($souse, $newLocation) {
    try {
        Move-Item -Path $souse -Destination $newLocation;
    }
    catch {
        Write-Host 'Computing file...';
    }
}
function ABCFolderSort {
    #Creats the directorys.
    foreach ($char in $folderAlphabet) {
        New-Item -Path ($newSort + "\" + $char) -ItemType Directory;
    }
    #Sorts the file by alphanetic order.
    foreach ($file in Get-ChildItem -Path $orgSort) {
        foreach ($startChar in $compareAlphabet) {
            if ($startChar -eq $file.Name.ToString()[0]) {
                MoveFile -souse $file -newLocation ($newSort + "\" + $startChar.ToUpper());
            }
        }
    }
}
function tagFolderSort {
    #Creat the directorys.
    foreach ($tag in $tagArray) {
        New-Item -Path ($newSort + "\" + $tag) -ItemType Directory;
    }
    #Sort the files by tag type.
    foreach ($file in Get-ChildItem -Path $orgSort) {
        foreach ($tag in $tagArray) {
            $comapreTag = $file.ToString().Split(".")[1];
            if ($comapreTag -eq $tag) {
                MoveFile -souse $file -newLocation ($newSort + "\" + $tag);
            }
        }
    }
}
#Check if extentionh exitis.
function checkForFileTag {
    $tagArray = @();
    foreach ($file in Get-ChildItem $orgSort -Name) {
        $tagArray += $file.split(".")[1];
    }
    tagFolderSort;
}
function main {
    $orgSort = Read-Host 'What folder do you like to sort?';
    #Gets the probibilitis of the diritory.
    Get-ChildItem -Path $orgSort

    #Asks the user.
    Write-Host '[y / N]';
    $awnser = Read-Host;
    if ($awnser -eq 'y') {
        $newSort = Read-Host 'Enter new location';

        $SortAwnser = Read-Host 'ABC sort or tag sort?';
        if ($SortAwnser -eq "ABC") {
            ABCFolderSort;
        }
        else {
            checkForFileTag;
        }
    }
    elseif ($awnser -eq 'N') {
        Write-Host 'Program Termination...';
    }
}
#vars.
$tagArray = @();
$newSort;
$compareAlphabet = "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Å", "Ä", "Ö", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z";
$folderAlphabet = "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z";
#endregion
