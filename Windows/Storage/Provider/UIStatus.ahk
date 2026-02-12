#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the status of the file picker UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.uistatus
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class UIStatus extends Win32Enum{

    /**
     * The file picker is not showing UI and UI can't be requested.
     * 
     * If the app that provides updates requests UI by completing its response to a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event and setting the [FileUpdateRequest.Status](fileupdaterequest_status.md) to [FileUpdateStatus.UserInputNeeded](fileupdatestatus.md), the app will be closed immediately and the failure may be reported to the app that triggered the updates.
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * The file picker is not showing UI, but UI can be requested.
     * 
     * If the app that provides updates requests UI by completing its response to a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event and setting the [FileUpdateRequest.Status](fileupdaterequest_status.md) to [FileUpdateStatus.UserInputNeeded](fileupdatestatus.md), a [UIRequested](cachedfileupdaterui_uirequested.md) event will fire to indicate that UI will display immediately, and a new [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event will fire (for the same file) so that the app can get the user's input and complete the request successfully.
     * @type {Integer (Int32)}
     */
    static Hidden => 1

    /**
     * The file picker is currently showing UI because UI was requested by the app.
     * @type {Integer (Int32)}
     */
    static Visible => 2

    /**
     * The file picker is currently showing UI and all
     * 
     * This indicates that UI is presently being shown, and that the app has finished responding to all [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events.
     * @type {Integer (Int32)}
     */
    static Complete => 3
}
