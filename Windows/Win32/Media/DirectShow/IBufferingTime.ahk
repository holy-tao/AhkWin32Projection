#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBufferingTime extends IUnknown {
    /**
     * The interface identifier for IBufferingTime
     * @type {Guid}
     */
    static IID := Guid("{1e00486a-78dd-11d2-8dd3-006097c9a2b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBufferingTime interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBufferingTime : IntPtr
        SetBufferingTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBufferingTime.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMilliseconds 
     * @returns {HRESULT} 
     */
    GetBufferingTime(pdwMilliseconds) {
        pdwMillisecondsMarshal := pdwMilliseconds is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwMillisecondsMarshal, pdwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    SetBufferingTime(dwMilliseconds) {
        result := ComCall(4, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBufferingTime.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBufferingTime := CallbackCreate(GetMethod(implObj, "GetBufferingTime"), flags, 2)
        this.vtbl.SetBufferingTime := CallbackCreate(GetMethod(implObj, "SetBufferingTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBufferingTime)
        CallbackFree(this.vtbl.SetBufferingTime)
    }
}
