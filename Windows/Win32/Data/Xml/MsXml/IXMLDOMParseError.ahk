#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMParseError extends IDispatch {
    /**
     * The interface identifier for IXMLDOMParseError
     * @type {Guid}
     */
    static IID := Guid("{3efaa426-272f-11d2-836f-0000f87a7782}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMParseError interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_errorCode : IntPtr
        get_url       : IntPtr
        get_reason    : IntPtr
        get_srcText   : IntPtr
        get_line      : IntPtr
        get_linepos   : IntPtr
        get_filepos   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMParseError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    errorCode {
        get => this.get_errorCode()
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
    }

    /**
     * @type {BSTR} 
     */
    reason {
        get => this.get_reason()
    }

    /**
     * @type {BSTR} 
     */
    srcText {
        get => this.get_srcText()
    }

    /**
     * @type {Integer} 
     */
    line {
        get => this.get_line()
    }

    /**
     * @type {Integer} 
     */
    linepos {
        get => this.get_linepos()
    }

    /**
     * @type {Integer} 
     */
    filepos {
        get => this.get_filepos()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorCode() {
        result := ComCall(7, this, "int*", &errorCode := 0, "HRESULT")
        return errorCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        urlString := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, urlString, "HRESULT")
        return urlString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_reason() {
        reasonString := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, reasonString, "HRESULT")
        return reasonString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_srcText() {
        sourceString := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, sourceString, "HRESULT")
        return sourceString
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_line() {
        result := ComCall(11, this, "int*", &lineNumber := 0, "HRESULT")
        return lineNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_linepos() {
        result := ComCall(12, this, "int*", &linePosition := 0, "HRESULT")
        return linePosition
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_filepos() {
        result := ComCall(13, this, "int*", &filePosition := 0, "HRESULT")
        return filePosition
    }

    Query(iid) {
        if (IXMLDOMParseError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_errorCode := CallbackCreate(GetMethod(implObj, "get_errorCode"), flags, 2)
        this.vtbl.get_url := CallbackCreate(GetMethod(implObj, "get_url"), flags, 2)
        this.vtbl.get_reason := CallbackCreate(GetMethod(implObj, "get_reason"), flags, 2)
        this.vtbl.get_srcText := CallbackCreate(GetMethod(implObj, "get_srcText"), flags, 2)
        this.vtbl.get_line := CallbackCreate(GetMethod(implObj, "get_line"), flags, 2)
        this.vtbl.get_linepos := CallbackCreate(GetMethod(implObj, "get_linepos"), flags, 2)
        this.vtbl.get_filepos := CallbackCreate(GetMethod(implObj, "get_filepos"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_errorCode)
        CallbackFree(this.vtbl.get_url)
        CallbackFree(this.vtbl.get_reason)
        CallbackFree(this.vtbl.get_srcText)
        CallbackFree(this.vtbl.get_line)
        CallbackFree(this.vtbl.get_linepos)
        CallbackFree(this.vtbl.get_filepos)
    }
}
