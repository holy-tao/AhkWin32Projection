#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXMLDOMParseErrorCollection.ahk" { IXMLDOMParseErrorCollection }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMParseError.ahk" { IXMLDOMParseError }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMParseError2 extends IXMLDOMParseError {
    /**
     * The interface identifier for IXMLDOMParseError2
     * @type {Guid}
     */
    static IID := Guid("{3efaa428-272f-11d2-836f-0000f87a7782}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMParseError2 interfaces
    */
    struct Vtbl extends IXMLDOMParseError.Vtbl {
        get_errorXPath           : IntPtr
        get_allErrors            : IntPtr
        errorParameters          : IntPtr
        get_errorParametersCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMParseError2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    errorXPath {
        get => this.get_errorXPath()
    }

    /**
     * @type {IXMLDOMParseErrorCollection} 
     */
    allErrors {
        get => this.get_allErrors()
    }

    /**
     * @type {Integer} 
     */
    errorParametersCount {
        get => this.get_errorParametersCount()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_errorXPath() {
        xpathexpr := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, xpathexpr, "HRESULT")
        return xpathexpr
    }

    /**
     * 
     * @returns {IXMLDOMParseErrorCollection} 
     */
    get_allErrors() {
        result := ComCall(15, this, "ptr*", &allErrors := 0, "HRESULT")
        return IXMLDOMParseErrorCollection(allErrors)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    errorParameters(index) {
        param1 := BSTR.Owned()
        result := ComCall(16, this, "int", index, BSTR.Ptr, param1, "HRESULT")
        return param1
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorParametersCount() {
        result := ComCall(17, this, "int*", &count := 0, "HRESULT")
        return count
    }

    Query(iid) {
        if (IXMLDOMParseError2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_errorXPath := CallbackCreate(GetMethod(implObj, "get_errorXPath"), flags, 2)
        this.vtbl.get_allErrors := CallbackCreate(GetMethod(implObj, "get_allErrors"), flags, 2)
        this.vtbl.errorParameters := CallbackCreate(GetMethod(implObj, "errorParameters"), flags, 3)
        this.vtbl.get_errorParametersCount := CallbackCreate(GetMethod(implObj, "get_errorParametersCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_errorXPath)
        CallbackFree(this.vtbl.get_allErrors)
        CallbackFree(this.vtbl.errorParameters)
        CallbackFree(this.vtbl.get_errorParametersCount)
    }
}
