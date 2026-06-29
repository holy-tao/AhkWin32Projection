#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IXMLElement.ahk" { IXMLElement }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDocument extends IDispatch {
    /**
     * The interface identifier for IXMLDocument
     * @type {Guid}
     */
    static IID := Guid("{f52e2b61-18a1-11d1-b105-00805f49916b}")

    /**
     * The class identifier for XMLDocument
     * @type {Guid}
     */
    static CLSID := Guid("{cfc399af-d876-11d0-9c10-00c04fc99c8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDocument interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_root             : IntPtr
        get_fileSize         : IntPtr
        get_fileModifiedDate : IntPtr
        get_fileUpdatedDate  : IntPtr
        get_URL              : IntPtr
        put_URL              : IntPtr
        get_mimeType         : IntPtr
        get_readyState       : IntPtr
        get_charset          : IntPtr
        put_charset          : IntPtr
        get_version          : IntPtr
        get_doctype          : IntPtr
        get_dtdURL           : IntPtr
        createElement        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDocument.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXMLElement} 
     */
    root {
        get => this.get_root()
    }

    /**
     * @type {BSTR} 
     */
    fileSize {
        get => this.get_fileSize()
    }

    /**
     * @type {BSTR} 
     */
    fileModifiedDate {
        get => this.get_fileModifiedDate()
    }

    /**
     * @type {BSTR} 
     */
    fileUpdatedDate {
        get => this.get_fileUpdatedDate()
    }

    /**
     * @type {BSTR} 
     */
    URL {
        get => this.get_URL()
        set => this.put_URL(value)
    }

    /**
     * @type {BSTR} 
     */
    mimeType {
        get => this.get_mimeType()
    }

    /**
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {BSTR} 
     */
    charset {
        get => this.get_charset()
        set => this.put_charset(value)
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
    }

    /**
     * @type {BSTR} 
     */
    doctype {
        get => this.get_doctype()
    }

    /**
     * @type {BSTR} 
     */
    dtdURL {
        get => this.get_dtdURL()
    }

    /**
     * 
     * @returns {IXMLElement} 
     */
    get_root() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IXMLElement(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileSize() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileModifiedDate() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileUpdatedDate() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_URL(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(12, this, BSTR, p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(14, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_charset(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(16, this, BSTR, p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_doctype() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dtdURL() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} vType 
     * @param {VARIANT} var1 
     * @returns {IXMLElement} 
     */
    createElement(vType, var1) {
        result := ComCall(20, this, VARIANT, vType, VARIANT, var1, "ptr*", &ppElem := 0, "HRESULT")
        return IXMLElement(ppElem)
    }

    Query(iid) {
        if (IXMLDocument.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_root := CallbackCreate(GetMethod(implObj, "get_root"), flags, 2)
        this.vtbl.get_fileSize := CallbackCreate(GetMethod(implObj, "get_fileSize"), flags, 2)
        this.vtbl.get_fileModifiedDate := CallbackCreate(GetMethod(implObj, "get_fileModifiedDate"), flags, 2)
        this.vtbl.get_fileUpdatedDate := CallbackCreate(GetMethod(implObj, "get_fileUpdatedDate"), flags, 2)
        this.vtbl.get_URL := CallbackCreate(GetMethod(implObj, "get_URL"), flags, 2)
        this.vtbl.put_URL := CallbackCreate(GetMethod(implObj, "put_URL"), flags, 2)
        this.vtbl.get_mimeType := CallbackCreate(GetMethod(implObj, "get_mimeType"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.get_charset := CallbackCreate(GetMethod(implObj, "get_charset"), flags, 2)
        this.vtbl.put_charset := CallbackCreate(GetMethod(implObj, "put_charset"), flags, 2)
        this.vtbl.get_version := CallbackCreate(GetMethod(implObj, "get_version"), flags, 2)
        this.vtbl.get_doctype := CallbackCreate(GetMethod(implObj, "get_doctype"), flags, 2)
        this.vtbl.get_dtdURL := CallbackCreate(GetMethod(implObj, "get_dtdURL"), flags, 2)
        this.vtbl.createElement := CallbackCreate(GetMethod(implObj, "createElement"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_root)
        CallbackFree(this.vtbl.get_fileSize)
        CallbackFree(this.vtbl.get_fileModifiedDate)
        CallbackFree(this.vtbl.get_fileUpdatedDate)
        CallbackFree(this.vtbl.get_URL)
        CallbackFree(this.vtbl.put_URL)
        CallbackFree(this.vtbl.get_mimeType)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.get_charset)
        CallbackFree(this.vtbl.put_charset)
        CallbackFree(this.vtbl.get_version)
        CallbackFree(this.vtbl.get_doctype)
        CallbackFree(this.vtbl.get_dtdURL)
        CallbackFree(this.vtbl.createElement)
    }
}
