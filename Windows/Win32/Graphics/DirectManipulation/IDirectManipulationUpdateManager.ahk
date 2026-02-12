#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages how compositor updates are sent to Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager
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
     * Registers a callback that is triggered by a handle.
     * @param {HANDLE} handle_ The event handle that triggers the callback.
     * @param {IDirectManipulationUpdateHandler} eventHandler The event handler to call when the event is fired.
     * @returns {Integer} The unique ID of the event callback instance.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-registerwaithandlecallback
     */
    RegisterWaitHandleCallback(handle_, eventHandler) {
        handle_ := handle_ is Win32Handle ? NumGet(handle_, "ptr") : handle_

        result := ComCall(3, this, "ptr", handle_, "ptr", eventHandler, "uint*", &cookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * Deregisters a callback.
     * @param {Integer} cookie The unique ID of the event callback instance.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-unregisterwaithandlecallback
     */
    UnregisterWaitHandleCallback(cookie) {
        result := ComCall(4, this, "uint", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates Direct Manipulation at the current time.
     * @remarks
     * If the application provides its own implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a>, this implementation should call <b>Update</b> whenever there is a compositor update. Frame timing information can be provided to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider">IDirectManipulationFrameInfoProvider</a> interface.
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider used to predict the position of the content and compensate for latency during composition.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update
     */
    Update(frameInfo) {
        result := ComCall(5, this, "ptr", frameInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
