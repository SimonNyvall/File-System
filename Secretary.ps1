#region Creating Form
[void] [reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

$Form1 = New-Object System.Windows.Forms.Form
$Form1.Size = New-Object "System.Drawing.Size" -ArgumentList 420, 400
$Form1.MaximizeBox = $false
$Form1.Text = 'Sort Terminal'
$Form1.FormBorderStyle = "FixedDialog"

#region Menustrip
$menuStrip = New-Object System.Windows.Forms.MenuStrip

$fileToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$openToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$editionToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem

$menuStrip.Items.AddRange(@(
$fileToolStripMenuItem,
$editionToolStripMenuItem))
$menuStrip.Location = new-object System.Drawing.Point(0, 0)
$menuStrip.Name = "menuStrip"
$menuStrip.Size = new-object System.Drawing.Size(354, 24)
$menuStrip.TabIndex = 0
$menuStrip.Text = "menuStrip"

$fileToolStripMenuItem.DropDownItems.AddRange(@(
$openToolStripMenuItem))
$fileToolStripMenuItem.Name = "fileToolStripMenuItem"
$fileToolStripMenuItem.Size = new-object System.Drawing.Size(35, 20)
$fileToolStripMenuItem.Text = "&File"
#
# openToolStripMenuItem
#
$openToolStripMenuItem.Name = "openToolStripMenuItem"
$openToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$openToolStripMenuItem.Text = "&Open"
function OnClick_openToolStripMenuItem($Sender,$e){
    [void][System.Windows.Forms.MessageBox]::Show("Event openToolStripMenuItem.Add_Click is not implemented.")
}

$openToolStripMenuItem.Add_Click( { OnClick_openToolStripMenuItem $openToolStripMenuItem $EventArgs} )
#
# editionToolStripMenuItem
#
$editionToolStripMenuItem.Name = "editionToolStripMenuItem"
$editionToolStripMenuItem.Size = new-object System.Drawing.Size(51, 20)
$editionToolStripMenuItem.Text = "&Edition"
#
$MenuForm = new-object System.Windows.Forms.form
#
$MenuForm.ClientSize = new-object System.Drawing.Size(354, 141)
$MenuForm.Controls.Add($MS_Main)
$MenuForm.MainMenuStrip = $MS_Main
$MenuForm.Name = "MenuForm"
$MenuForm.Text = "I\'ve got a menu"
function OnFormClosing_MenuForm($Sender,$e){ 
    # $this represent sender (object)
    # $_ represent  e (eventarg)

    # Allow closing
    ($_).Cancel= $False
}

$Form1.Controls.Add($menuStrip)
$Form1.Controls.Add($fileToolStripMenuItem)
$Form1.Controls.Add($openToolStripMenuItem)
$Form1.Controls.Add($editionToolStripMenuItem)
#endregion Manustrip

#region Path Form
#Path buttoms and textbox.
$pathButtonOrg = New-Object System.Windows.Forms.Button
$pathButtonDest = New-Object System.Windows.Forms.Button

$pathTextBoxOrg = New-Object System.Windows.Forms.TextBox
$pathTextBoxDest = New-Object System.Windows.Forms.TextBox

$pathGroup = New-Object System.Windows.Forms.GroupBox

#region Buttons size, location
#Buttons
$pathButtonOrg.Location = New-Object "System.Drawing.Point" -ArgumentList 308, 60
$pathButtonOrg.Size = New-Object "System.Drawing.Size" -ArgumentList 75, 26

$pathButtonDest.Location = New-Object "System.Drawing.Point" -ArgumentList 308, 115
$pathButtonDest.Size = New-Object "System.Drawing.Size" -ArgumentList 75, 26

#TextBox
$pathTextBoxOrg.Location = New-Object "System.Drawing.Point" -ArgumentList 20, 60
$pathTextBoxOrg.Size = New-Object "System.Drawing.Size" -ArgumentList 275, 45

$pathTextBoxDest.Location = New-Object "System.Drawing.Point" -ArgumentList 20, 115
$pathTextBoxDest.Size = New-Object "System.Drawing.Size" -ArgumentList 275, 45

$pathGroup.Location = New-Object "System.Drawing.Point" -ArgumentList 10, 25
$pathGroup.Size = New-Object "System.Drawing.Size" -ArgumentList 385, 130
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
$sortCheckBox_ABC.Location = New-Object "System.Drawing.Point" -ArgumentList 10, 35
$sortCheckBox_ABC.Size = New-Object "System.Drawing.Size" -ArgumentList 68, 24

$sortCheckBox_Tag.Location = New-Object "System.Drawing.Point" -ArgumentList 112, 35
$sortCheckBox_Tag.Size = New-Object "System.Drawing.Size" -ArgumentList 62, 24

$sortCheckBox_Date.Location = New-Object "System.Drawing.Point" -ArgumentList 10, 76
$sortCheckBox_Date.Size = New-Object "System.Drawing.Size" -ArgumentList 70, 24

$sortCheckBox_Sort.Location = New-Object "System.Drawing.Point" -ArgumentList 112, 76
$sortCheckBox_Sort.Size = New-Object "System.Drawing.Size" -ArgumentList 65, 24

$sortGroup.Location = New-Object "System.Drawing.Point" -ArgumentList 10, 160
$sortGroup.Size = New-Object "System.Drawing.Size" -ArgumentList 192, 126

#Adding to the control group
$Form1.Controls.add($sortCheckBox_ABC)
$Form1.Controls.add($sortCheckBox_Tag)
$Form1.Controls.add($sortCheckBox_Date)
$Form1.Controls.add($sortCheckBox_Sort)
$Form1.Controls.add($sortGroup)

#Sort Buttons and textbox for moving files.
$sortButtonSort = New-Object System.Windows.Forms.Button
$sortButtonReset = New-Object System.Windows.Forms.Button

$sortTextBoxMovinglist = New-Object System.Windows.Forms.TextBox

$sortProgressbar = New-Object System.Windows.Forms.ProgressBar

#Seze and location for sorting buttons, textbox and progressbar
$sortButtonSort.Location = New-Object "System.Drawing.Point" -ArgumentList 10, 290
$sortButtonSort.Size = New-Object "System.Drawing.Size" -ArgumentList 95, 32

$sortButtonReset.Location = New-Object "System.Drawing.Point" -ArgumentList 109, 290
$sortButtonReset.Size = New-Object "System.Drawing.Size" -ArgumentList 95, 32

$sortTextBoxMovinglist.Multiline = $true
$sortTextBoxMovinglist.Location = New-Object "System.Drawing.Point" -ArgumentList 210, 167
$sortTextBoxMovinglist.Size = New-Object "System.Drawing.Size" -ArgumentList 185, 155

$sortProgressbar.Location = New-Object "System.Drawing.Point" -ArgumentList 10, 330
$sortProgressbar.Size = New-Object "System.Drawing.Size" -ArgumentList 385, 23

#Adding to form control
$Form1.Controls.Add($sortButtonSort)
$Form1.Controls.Add($sortButtonReset)
$Form1.Controls.Add($sortTextBoxMovinglist)
$Form1.Controls.Add($sortProgressbar)
#endregion Form Sorting

#region text and Info
$sortGroup.Text = 'Sort Stile'
$pathButtonOrg.Text = 'Folder...'
$pathButtonDest.Text = 'Folder...'
$sortButtonSort.Text = 'Sort'
$sortButtonReset.Text = 'Reset'

$sortCheckBox_ABC.Text = 'ABC'
$sortCheckBox_Tag.Text = 'Tag'
$sortCheckBox_Date.Text = 'Date'
$sortCheckBox_Sort.Text = 'Move'
#endregion Text and Info

#endregion Creating Form

#region File Transport
#Moves files.
function MoveFile ($souse, $newLocation) {
    try {
        Move-Item -Path $souse -Destination $newLocation;
        $sortTextBoxMovinglist.Text += 'Moving from ' + $souse + ' to ' + $newLocation + '\n'
    }
    catch {
        $sortTextBoxMovinglist.Text += 'Computing file...' + '\n'
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
            $comapreTag = $file.ToString().Split(".")[$file.Length];
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
        $tagArray += $file.split(".")[$file.Length];
    }
    tagFolderSort;
}
#Sort by date.
function folderDateSort {
    foreach ($fileDate in Get-Item $orgSort | foreach {$_.LastWriteTime}){
        New-Item -Path ($newSort + '\' + $fileDate) -ItemType Directory
    }
    foreach ($oldFile in Get-ChildItem -Path $orgSort){
        foreach ($newFile in Get-Childitem -Path $newSort){
            if ($oldFile.LastWriteTime -eq $newFile.LastWriteTime){
                MoveFile -souse $orgSort -newLocation $newSort;
            }
        }
    }
}
#vars.
$orgSort
$tagArray = @()
$newSort

$sortAwnser

$compareAlphabet = "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Å", "Ä", "Ö", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z";
$folderAlphabet = "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z";
#endregion File Transport

#region Form Event
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog

    $pathButtonOrg.Add_Click({
        $folderBrowser.ShowDialog()
        $pathTextBoxOrg.Text = $folderBrowser.SelectedPath
        $orgSort = $folderBrowser.SelectedPath
    })

    $pathButtonDest.Add_Click({
        $folderBrowser.ShowDialog()
        $pathTextBoxDest.Text = $folderBrowser.SelectedPath
        $newSort = $folderBrowser.SelectedPath
    })
    
    $sortButtonReset.Add_Click({
        $orgSort = $null
        $newSort = $null

        $pathTextBoxOrg.Text = $null
        $pathTextBoxDest.Text = $null
    })

    $sortButtonSort.Add_Click({
        if ($sortCheckBox_ABC.Checked){
            ABCFolderSort;
        } 
        elseif ($sortCheckBox_Tag.Checked){
            checkForFileTag;
        }
        elseif ($sortCheckBox_Date.Checked){
            folderDateSort;
        }
        elseif ($sortCheckBox_Sort){
            MoveFile -souse $orgSort -newLocation $newSort
        }
    })

    $Form1.ShowDialog()
#endregion Form Event