#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the stages of the photo import process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstage
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportStage extends Win32Enum{

    /**
     * The photo import process has not started.
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * Items are currently being found.
     * @type {Integer (Int32)}
     */
    static FindingItems => 1

    /**
     * Items are currently being imported
     * @type {Integer (Int32)}
     */
    static ImportingItems => 2

    /**
     * Imported items are currently being deleted from the source.
     * @type {Integer (Int32)}
     */
    static DeletingImportedItemsFromSource => 3
}
