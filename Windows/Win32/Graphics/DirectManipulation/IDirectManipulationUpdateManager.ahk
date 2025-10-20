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
     * 
     * @param {HANDLE} handle 
     * @param {Pointer<IDirectManipulationUpdateHandler>} eventHandler 
     * @param {Pointer<UInt32>} cookie 
     * @returns {HRESULT} 
     */
    RegisterWaitHandleCallback(handle, eventHandler, cookie) {
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := ComCall(3, this, "ptr", handle, "ptr", eventHandler, "uint*", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     */
    UnregisterWaitHandleCallback(cookie) {
        result := ComCall(4, this, "uint", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectManipulationFrameInfoProvider>} frameInfo 
     * @returns {HRESULT} 
     */
    Update(frameInfo) {
        result := ComCall(5, this, "ptr", frameInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
