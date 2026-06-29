#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpAudio.ahk" { ISpAudio }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpMMSysAudio extends ISpAudio {
    /**
     * The interface identifier for ISpMMSysAudio
     * @type {Guid}
     */
    static IID := Guid("{15806f6e-1d70-4b48-98e6-3b1a007509ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpMMSysAudio interfaces
    */
    struct Vtbl extends ISpAudio.Vtbl {
        GetDeviceId : IntPtr
        SetDeviceId : IntPtr
        GetMMHandle : IntPtr
        GetLineId   : IntPtr
        SetLineId   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpMMSysAudio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} puDeviceId 
     * @returns {HRESULT} 
     */
    GetDeviceId(puDeviceId) {
        puDeviceIdMarshal := puDeviceId is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, puDeviceIdMarshal, puDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uDeviceId 
     * @returns {HRESULT} 
     */
    SetDeviceId(uDeviceId) {
        result := ComCall(27, this, "uint", uDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} pHandle 
     * @returns {HRESULT} 
     */
    GetMMHandle(pHandle) {
        pHandleMarshal := pHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, pHandleMarshal, pHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puLineId 
     * @returns {HRESULT} 
     */
    GetLineId(puLineId) {
        puLineIdMarshal := puLineId is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, puLineIdMarshal, puLineId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uLineId 
     * @returns {HRESULT} 
     */
    SetLineId(uLineId) {
        result := ComCall(30, this, "uint", uLineId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpMMSysAudio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceId := CallbackCreate(GetMethod(implObj, "GetDeviceId"), flags, 2)
        this.vtbl.SetDeviceId := CallbackCreate(GetMethod(implObj, "SetDeviceId"), flags, 2)
        this.vtbl.GetMMHandle := CallbackCreate(GetMethod(implObj, "GetMMHandle"), flags, 2)
        this.vtbl.GetLineId := CallbackCreate(GetMethod(implObj, "GetLineId"), flags, 2)
        this.vtbl.SetLineId := CallbackCreate(GetMethod(implObj, "SetLineId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceId)
        CallbackFree(this.vtbl.SetDeviceId)
        CallbackFree(this.vtbl.GetMMHandle)
        CallbackFree(this.vtbl.GetLineId)
        CallbackFree(this.vtbl.SetLineId)
    }
}
