#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the result of a call to the [FileSavePickerUI.TrySetFileName](filesavepickerui_trysetfilename_1605308267.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.setfilenameresult
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class SetFileNameResult extends Win32Enum{

    /**
     * The file name and extension were updated successfully.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The file name and extension were not updated because the extension wasn't one of the [AllowedFileTypes](filesavepickerui_allowedfiletypes.md).
     * @type {Integer (Int32)}
     */
    static NotAllowed => 1

    /**
     * The file name and extension were not updated because the file picker UI wasn't available. The file picker UI is only available while the user is interacting with your app.
     * @type {Integer (Int32)}
     */
    static Unavailable => 2
}
