param (
   $InstallPath,
   $ToolsPath,
   $Package,
   $Project
)

$rootnamespace = $Project.Properties.Item("RootNamespace").Value
$templateFileName = "template.nuspec"
$targetFileName = $rootnamespace + '.nuspec'

$templateFile = $Project.ProjectItems.Item($templateFileName)
$targetFile = $Project.ProjectItems.Item($targetFileName)

if ($targetFile) {
   # There already is a nuspec file in this project
   # delete the template
   $templateFile.Delete()
}
else {
   # Rename the template file to the destination file name
   $templateFile.Name = $targetFileName
	
   # Set files build action to "Content" - https://msdn.microsoft.com/en-us/library/aa983962(VS.71).aspx
   $settingsfile.Properties.Item("BuildAction").Value = [int]2
}

$Project.Save()