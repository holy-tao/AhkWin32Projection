#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the view mode that the file picker is using to present items.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.pickerviewmode
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class PickerViewMode extends Win32Enum{

    /**
     * A list of items.
     * @type {Integer (Int32)}
     */
    static List => 0

    /**
     * A set of thumbnail images.
     * @type {Integer (Int32)}
     */
    static Thumbnail => 1
}
