#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IDirectManipulationFrameInfoProvider.ahk" { IDirectManipulationFrameInfoProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectManipulationUpdateHandler.ahk" { IDirectManipulationUpdateHandler }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages how compositor updates are sent to Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationUpdateManager extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationUpdateManager
     * @type {Guid}
     */
    static IID := Guid("{b0ae62fd-be34-46e7-9caa-d361facbb9cc}")

    /**
     * The class identifier for DirectManipulationUpdateManager
     * @type {Guid}
     */
    static CLSID := Guid("{9fc1bfd5-1835-441a-b3b1-b6cc74b727d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationUpdateManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterWaitHandleCallback   : IntPtr
        UnregisterWaitHandleCallback : IntPtr
        Update                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationUpdateManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a callback that is triggered by a handle.
     * @param {HANDLE} _handle The event handle that triggers the callback.
     * @param {IDirectManipulationUpdateHandler} eventHandler The event handler to call when the event is fired.
     * @returns {Integer} The unique ID of the event callback instance.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-registerwaithandlecallback
     */
    RegisterWaitHandleCallback(_handle, eventHandler) {
        result := ComCall(3, this, HANDLE, _handle, "ptr", eventHandler, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * Deregisters a callback.
     * @param {Integer} cookie The unique ID of the event callback instance.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-unregisterwaithandlecallback
     */
    UnregisterWaitHandleCallback(cookie) {
        result := ComCall(4, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Updates Direct Manipulation at the current time.
     * @remarks
     * If the application provides its own implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a>, this implementation should call <b>Update</b> whenever there is a compositor update. Frame timing information can be provided to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationframeinfoprovider">IDirectManipulationFrameInfoProvider</a> interface.
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider used to predict the position of the content and compensate for latency during composition.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update
     */
    Update(frameInfo) {
        result := ComCall(5, this, "ptr", frameInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationUpdateManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterWaitHandleCallback := CallbackCreate(GetMethod(implObj, "RegisterWaitHandleCallback"), flags, 4)
        this.vtbl.UnregisterWaitHandleCallback := CallbackCreate(GetMethod(implObj, "UnregisterWaitHandleCallback"), flags, 2)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterWaitHandleCallback)
        CallbackFree(this.vtbl.UnregisterWaitHandleCallback)
        CallbackFree(this.vtbl.Update)
    }
}
