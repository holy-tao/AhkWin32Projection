#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IElementNamespace.ahk" { IElementNamespace }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementNamespaceFactoryCallback extends IUnknown {
    /**
     * The interface identifier for IElementNamespaceFactoryCallback
     * @type {Guid}
     */
    static IID := Guid("{3050f7fd-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementNamespaceFactoryCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Resolve : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementNamespaceFactoryCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrTagName 
     * @param {BSTR} bstrAttrs 
     * @param {IElementNamespace} pNamespace 
     * @returns {HRESULT} 
     */
    Resolve(bstrNamespace, bstrTagName, bstrAttrs, pNamespace) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace
        bstrTagName := bstrTagName is String ? BSTR.Alloc(bstrTagName).Value : bstrTagName
        bstrAttrs := bstrAttrs is String ? BSTR.Alloc(bstrAttrs).Value : bstrAttrs

        result := ComCall(3, this, BSTR, bstrNamespace, BSTR, bstrTagName, BSTR, bstrAttrs, "ptr", pNamespace, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementNamespaceFactoryCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Resolve)
    }
}
