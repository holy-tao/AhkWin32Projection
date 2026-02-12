#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the result of a call to the [FileOpenPickerUI.AddFile](fileopenpickerui_addfile_887814693.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.addfileresult
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class AddFileResult extends Win32Enum{

    /**
     * The file was successfully added to the file picker UI.
     * @type {Integer (Int32)}
     */
    static Added => 0

    /**
     * The file was already in the file picker UI.
     * @type {Integer (Int32)}
     */
    static AlreadyAdded => 1

    /**
     * The file wasn't added because it is not one of the allowed file types.
     * @type {Integer (Int32)}
     */
    static NotAllowed => 2

    /**
     * The file wasn't added because the file picker UI is unavailable.  The file picker UI is only available while the user is interacting with your app.
     * @type {Integer (Int32)}
     */
    static Unavailable => 3
}
