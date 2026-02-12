#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the initial selection state for items that are discovered using [PhotoImportSession.FindItemsAsync](photoimportsession_finditemsasync_1686050162.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportitemselectionmode
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportItemSelectionMode extends Win32Enum{

    /**
     * All found items are initially selected.
     * @type {Integer (Int32)}
     */
    static SelectAll => 0

    /**
     * No found items are initially selected.
     * @type {Integer (Int32)}
     */
    static SelectNone => 1

    /**
     * New found items are initially selected.
     * @type {Integer (Int32)}
     */
    static SelectNew => 2
}
