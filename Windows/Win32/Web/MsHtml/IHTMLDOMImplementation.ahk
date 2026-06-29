#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMImplementation extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMImplementation
     * @type {Guid}
     */
    static IID := Guid("{3050f80d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMImplementation
     * @type {Guid}
     */
    static CLSID := Guid("{3050f80e-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMImplementation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        hasFeature : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMImplementation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrfeature 
     * @param {VARIANT} _version 
     * @returns {VARIANT_BOOL} 
     */
    hasFeature(bstrfeature, _version) {
        bstrfeature := bstrfeature is String ? BSTR.Alloc(bstrfeature).Value : bstrfeature

        result := ComCall(7, this, BSTR, bstrfeature, VARIANT, _version, VARIANT_BOOL.Ptr, &pfHasFeature := 0, "HRESULT")
        return pfHasFeature
    }

    Query(iid) {
        if (IHTMLDOMImplementation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.hasFeature := CallbackCreate(GetMethod(implObj, "hasFeature"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.hasFeature)
    }
}
