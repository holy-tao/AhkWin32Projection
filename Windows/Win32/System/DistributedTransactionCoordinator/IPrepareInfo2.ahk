#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IPrepareInfo2 extends IUnknown {
    /**
     * The interface identifier for IPrepareInfo2
     * @type {Guid}
     */
    static IID := Guid("{5fab2547-9779-11d1-b886-00c04fb9618a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrepareInfo2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPrepareInfoSize : IntPtr
        GetPrepareInfo     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrepareInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPrepareInfoSize() {
        result := ComCall(3, this, "uint*", &pcbPrepInfo := 0, "HRESULT")
        return pcbPrepInfo
    }

    /**
     * 
     * @param {Integer} cbPrepareInfo 
     * @returns {Integer} 
     */
    GetPrepareInfo(cbPrepareInfo) {
        result := ComCall(4, this, "uint", cbPrepareInfo, "char*", &pPrepInfo := 0, "HRESULT")
        return pPrepInfo
    }

    Query(iid) {
        if (IPrepareInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrepareInfoSize := CallbackCreate(GetMethod(implObj, "GetPrepareInfoSize"), flags, 2)
        this.vtbl.GetPrepareInfo := CallbackCreate(GetMethod(implObj, "GetPrepareInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrepareInfoSize)
        CallbackFree(this.vtbl.GetPrepareInfo)
    }
}
