#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITuner.ahk" { ITuner }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\IGraphBuilder.ahk" { IGraphBuilder }

/**
 * This feature is expected to be available on a future version of the Windows operating system.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IRegisterTuner)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iregistertuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IRegisterTuner extends IUnknown {
    /**
     * The interface identifier for IRegisterTuner
     * @type {Guid}
     */
    static IID := Guid("{359b3901-572c-4854-bb49-cdef66606a25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegisterTuner interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Register   : IntPtr
        Unregister : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegisterTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This feature is expected to be available on a future version of the Windows operating system.
     * @param {ITuner} pTuner Pointer to a variable that specifies the tuner.
     * @param {IGraphBuilder} pGraph Pointer to a variable that specifies the graph filter provider.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iregistertuner-register
     */
    Register(pTuner, pGraph) {
        result := ComCall(3, this, "ptr", pTuner, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * This feature is expected to be available on a future version of the Windows operating system.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iregistertuner-unregister
     */
    Unregister() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRegisterTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 3)
        this.vtbl.Unregister := CallbackCreate(GetMethod(implObj, "Unregister"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.Unregister)
    }
}
