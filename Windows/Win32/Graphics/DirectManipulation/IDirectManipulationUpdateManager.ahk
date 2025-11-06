#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages how compositor updates are sent to Direct Manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationUpdateManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationUpdateManager
     * @type {Guid}
     */
    static IID => Guid("{b0ae62fd-be34-46e7-9caa-d361facbb9cc}")

    /**
     * The class identifier for DirectManipulationUpdateManager
     * @type {Guid}
     */
    static CLSID => Guid("{9fc1bfd5-1835-441a-b3b1-b6cc74b727d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterWaitHandleCallback", "UnregisterWaitHandleCallback", "Update"]

    /**
     * 
     * @param {HANDLE} handle 
     * @param {IDirectManipulationUpdateHandler} eventHandler 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-registerwaithandlecallback
     */
    RegisterWaitHandleCallback(handle, eventHandler) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(3, this, "ptr", handle, "ptr", eventHandler, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-unregisterwaithandlecallback
     */
    UnregisterWaitHandleCallback(cookie) {
        result := ComCall(4, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectManipulationFrameInfoProvider} frameInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update
     */
    Update(frameInfo) {
        result := ComCall(5, this, "ptr", frameInfo, "HRESULT")
        return result
    }
}
