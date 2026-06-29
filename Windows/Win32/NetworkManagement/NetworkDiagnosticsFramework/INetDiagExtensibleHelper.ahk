#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HELPER_ATTRIBUTE.ahk" { HELPER_ATTRIBUTE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct INetDiagExtensibleHelper extends IUnknown {
    /**
     * The interface identifier for INetDiagExtensibleHelper
     * @type {Guid}
     */
    static IID := Guid("{c0b35748-ebf5-11d8-bbe9-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetDiagExtensibleHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResolveAttributes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetDiagExtensibleHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<HELPER_ATTRIBUTE>} rgKeyAttributes 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HELPER_ATTRIBUTE>>} prgMatchValues 
     * @returns {HRESULT} 
     */
    ResolveAttributes(celt, rgKeyAttributes, pcelt, prgMatchValues) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"
        prgMatchValuesMarshal := prgMatchValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", celt, HELPER_ATTRIBUTE.Ptr, rgKeyAttributes, pceltMarshal, pcelt, prgMatchValuesMarshal, prgMatchValues, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetDiagExtensibleHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResolveAttributes := CallbackCreate(GetMethod(implObj, "ResolveAttributes"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResolveAttributes)
    }
}
