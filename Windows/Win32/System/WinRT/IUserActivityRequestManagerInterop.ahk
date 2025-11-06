#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UserActivityRequestManager](/uwp/api/windows.applicationmodel.useractivities.useractivityrequestmanager) object.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//useractivityinterop/nn-useractivityinterop-iuseractivityrequestmanagerinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IUserActivityRequestManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityRequestManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{dd69f876-9699-4715-9095-e37ea30dfa1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} window 
     * @param {Pointer<Guid>} iid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/useractivityinterop/nf-useractivityinterop-iuseractivityrequestmanagerinterop-getforwindow
     */
    GetForWindow(window, iid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", iid, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
