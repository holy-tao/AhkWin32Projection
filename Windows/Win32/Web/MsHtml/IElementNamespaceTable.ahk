#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementNamespaceTable extends IUnknown {
    /**
     * The interface identifier for IElementNamespaceTable
     * @type {Guid}
     */
    static IID := Guid("{3050f670-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementNamespaceTable interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddNamespace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementNamespaceTable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrUrn 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pvarFactory 
     * @returns {HRESULT} 
     */
    AddNamespace(bstrNamespace, bstrUrn, lFlags, pvarFactory) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace
        bstrUrn := bstrUrn is String ? BSTR.Alloc(bstrUrn).Value : bstrUrn

        result := ComCall(3, this, BSTR, bstrNamespace, BSTR, bstrUrn, "int", lFlags, VARIANT.Ptr, pvarFactory, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementNamespaceTable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddNamespace := CallbackCreate(GetMethod(implObj, "AddNamespace"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddNamespace)
    }
}
