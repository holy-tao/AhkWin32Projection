#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMImplementation extends IDispatch {
    /**
     * The interface identifier for IXMLDOMImplementation
     * @type {Guid}
     */
    static IID := Guid("{2933bf8f-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMImplementation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        hasFeature : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMImplementation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} feature 
     * @param {BSTR} _version 
     * @returns {VARIANT_BOOL} 
     */
    hasFeature(feature, _version) {
        feature := feature is String ? BSTR.Alloc(feature).Value : feature
        _version := _version is String ? BSTR.Alloc(_version).Value : _version

        result := ComCall(7, this, BSTR, feature, BSTR, _version, VARIANT_BOOL.Ptr, &hasFeature := 0, "HRESULT")
        return hasFeature
    }

    Query(iid) {
        if (IXMLDOMImplementation.IID.Equals(iid)) {
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
