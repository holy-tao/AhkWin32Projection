#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IXMLElement2.ahk" { IXMLElement2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDocument2 extends IDispatch {
    /**
     * The interface identifier for IXMLDocument2
     * @type {Guid}
     */
    static IID := Guid("{2b8de2fe-8d2d-11d1-b2fc-00c04fd915a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDocument2 interfaces
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
        get_async            : IntPtr
        put_async            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDocument2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXMLElement2} 
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
     * @type {VARIANT_BOOL} 
     */
    async {
        get => this.get_async()
        set => this.put_async(value)
    }

    /**
     * 
     * @returns {IXMLElement2} 
     */
    get_root() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IXMLElement2(p)
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
     * @returns {IXMLElement2} 
     */
    createElement(vType, var1) {
        result := ComCall(20, this, VARIANT, vType, VARIANT, var1, "ptr*", &ppElem := 0, "HRESULT")
        return IXMLElement2(ppElem)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_async() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &pf := 0, "HRESULT")
        return pf
    }

    /**
     * 
     * @param {VARIANT_BOOL} f 
     * @returns {HRESULT} 
     */
    put_async(f) {
        result := ComCall(22, this, VARIANT_BOOL, f, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDocument2.IID.Equals(iid)) {
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
        this.vtbl.get_async := CallbackCreate(GetMethod(implObj, "get_async"), flags, 2)
        this.vtbl.put_async := CallbackCreate(GetMethod(implObj, "put_async"), flags, 2)
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
        CallbackFree(this.vtbl.get_async)
        CallbackFree(this.vtbl.put_async)
    }
}
