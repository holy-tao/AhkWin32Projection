#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the method used for naming subfolders within the destination folder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsubfoldercreationmode
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportSubfolderCreationMode extends Win32Enum{

    /**
     * No subfolders are created.
     * @type {Integer (Int32)}
     */
    static DoNotCreateSubfolders => 0

    /**
     * Subfolders are created based on the file date of the imported files.
     * @type {Integer (Int32)}
     */
    static CreateSubfoldersFromFileDate => 1

    /**
     * Subfolders are created based on the EXIF date of the imported files.
     * @type {Integer (Int32)}
     */
    static CreateSubfoldersFromExifDate => 2

    /**
     * Subfolders are created to match the folder structure of the import source.
     * @type {Integer (Int32)}
     */
    static KeepOriginalFolderStructure => 3
}
