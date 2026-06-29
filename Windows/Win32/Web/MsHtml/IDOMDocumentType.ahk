#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMDocumentType extends IDispatch {
    /**
     * The interface identifier for IDOMDocumentType
     * @type {Guid}
     */
    static IID := Guid("{30510738-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMDocumentType
     * @type {Guid}
     */
    static CLSID := Guid("{30510739-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMDocumentType interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_name           : IntPtr
        get_entities       : IntPtr
        get_notations      : IntPtr
        get_publicId       : IntPtr
        get_systemId       : IntPtr
        get_internalSubset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMDocumentType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {IDispatch} 
     */
    entities {
        get => this.get_entities()
    }

    /**
     * @type {IDispatch} 
     */
    notations {
        get => this.get_notations()
    }

    /**
     * @type {VARIANT} 
     */
    publicId {
        get => this.get_publicId()
    }

    /**
     * @type {VARIANT} 
     */
    systemId {
        get => this.get_systemId()
    }

    /**
     * @type {VARIANT} 
     */
    internalSubset {
        get => this.get_internalSubset()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_entities() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_notations() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_publicId() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_systemId() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_internalSubset() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMDocumentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_entities := CallbackCreate(GetMethod(implObj, "get_entities"), flags, 2)
        this.vtbl.get_notations := CallbackCreate(GetMethod(implObj, "get_notations"), flags, 2)
        this.vtbl.get_publicId := CallbackCreate(GetMethod(implObj, "get_publicId"), flags, 2)
        this.vtbl.get_systemId := CallbackCreate(GetMethod(implObj, "get_systemId"), flags, 2)
        this.vtbl.get_internalSubset := CallbackCreate(GetMethod(implObj, "get_internalSubset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_entities)
        CallbackFree(this.vtbl.get_notations)
        CallbackFree(this.vtbl.get_publicId)
        CallbackFree(this.vtbl.get_systemId)
        CallbackFree(this.vtbl.get_internalSubset)
    }
}
