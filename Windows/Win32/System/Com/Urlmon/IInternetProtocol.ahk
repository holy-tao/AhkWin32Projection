#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInternetProtocolRoot.ahk" { IInternetProtocolRoot }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetProtocol extends IInternetProtocolRoot {
    /**
     * The interface identifier for IInternetProtocol
     * @type {Guid}
     */
    static IID := Guid("{79eac9e4-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetProtocol interfaces
    */
    struct Vtbl extends IInternetProtocolRoot.Vtbl {
        Read          : IntPtr
        Seek          : IntPtr
        LockRequest   : IntPtr
        UnlockRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetProtocol.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    Read(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pvMarshal, pv, "uint", cb, "uint*", &pcbRead := 0, "HRESULT")
        return pcbRead
    }

    /**
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @returns {Integer} 
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(10, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    LockRequest(dwOptions) {
        result := ComCall(11, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockRequest() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetProtocol.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 4)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 4)
        this.vtbl.LockRequest := CallbackCreate(GetMethod(implObj, "LockRequest"), flags, 2)
        this.vtbl.UnlockRequest := CallbackCreate(GetMethod(implObj, "UnlockRequest"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Seek)
        CallbackFree(this.vtbl.LockRequest)
        CallbackFree(this.vtbl.UnlockRequest)
    }
}
