#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IElementNamespace.ahk" { IElementNamespace }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IElementNamespaceFactory.ahk" { IElementNamespaceFactory }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementNamespaceFactory2 extends IElementNamespaceFactory {
    /**
     * The interface identifier for IElementNamespaceFactory2
     * @type {Guid}
     */
    static IID := Guid("{3050f805-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementNamespaceFactory2 interfaces
    */
    struct Vtbl extends IElementNamespaceFactory.Vtbl {
        CreateWithImplementation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementNamespaceFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IElementNamespace} pNamespace 
     * @param {BSTR} bstrImplementation 
     * @returns {HRESULT} 
     */
    CreateWithImplementation(pNamespace, bstrImplementation) {
        bstrImplementation := bstrImplementation is String ? BSTR.Alloc(bstrImplementation).Value : bstrImplementation

        result := ComCall(4, this, "ptr", pNamespace, BSTR, bstrImplementation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementNamespaceFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateWithImplementation := CallbackCreate(GetMethod(implObj, "CreateWithImplementation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateWithImplementation)
    }
}
