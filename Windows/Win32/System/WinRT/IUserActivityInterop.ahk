#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UserActivity](/uwp/api/windows.applicationmodel.useractivities.useractivity) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/useractivityinterop/nn-useractivityinterop-iuseractivityinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IUserActivityInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityInterop
     * @type {Guid}
     */
    static IID => Guid("{1ade314d-0e0a-40d9-824c-9a088a50059f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSessionForWindow"]

    /**
     * Creates a [UserActivitySession](/uwp/api/windows.applicationmodel.useractivities.useractivitysession) associated with the specified window.
     * @param {HWND} window Handle to the window of the active application.
     * @param {Pointer<Guid>} iid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(UserActivitySession)`
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [UserActivitySession](/uwp/api/windows.applicationmodel.useractivities.useractivitysession) object.
     * @see https://learn.microsoft.com/windows/win32/api//content/useractivityinterop/nf-useractivityinterop-iuseractivityinterop-createsessionforwindow
     */
    CreateSessionForWindow(window, iid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", iid, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
