#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides events related platform work queue.
 * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nn-rtworkq-irtwqplatformevents
 * @namespace Windows.Win32.System.Threading
 */
export default struct IRtwqPlatformEvents extends IUnknown {
    /**
     * The interface identifier for IRtwqPlatformEvents
     * @type {Guid}
     */
    static IID := Guid("{63d9255a-7ff1-4b61-8faf-ed6460dacf2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRtwqPlatformEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializationComplete : IntPtr
        ShutdownStart          : IntPtr
        ShutdownComplete       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRtwqPlatformEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called after the platform has been initialized.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqplatformevents-initializationcomplete
     */
    InitializationComplete() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Called before the platform is about to shutdown.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqplatformevents-shutdownstart
     */
    ShutdownStart() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called after the platform has shutdown.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqplatformevents-shutdowncomplete
     */
    ShutdownComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRtwqPlatformEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializationComplete := CallbackCreate(GetMethod(implObj, "InitializationComplete"), flags, 1)
        this.vtbl.ShutdownStart := CallbackCreate(GetMethod(implObj, "ShutdownStart"), flags, 1)
        this.vtbl.ShutdownComplete := CallbackCreate(GetMethod(implObj, "ShutdownComplete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializationComplete)
        CallbackFree(this.vtbl.ShutdownStart)
        CallbackFree(this.vtbl.ShutdownComplete)
    }
}
