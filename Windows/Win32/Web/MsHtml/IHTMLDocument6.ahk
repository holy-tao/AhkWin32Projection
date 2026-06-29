#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDocumentCompatibleInfoCollection.ahk" { IHTMLDocumentCompatibleInfoCollection }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLElement2.ahk" { IHTMLElement2 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocument6 extends IDispatch {
    /**
     * The interface identifier for IHTMLDocument6
     * @type {Guid}
     */
    static IID := Guid("{30510417-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocument6 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_compatible      : IntPtr
        get_documentMode    : IntPtr
        put_onstorage       : IntPtr
        get_onstorage       : IntPtr
        put_onstoragecommit : IntPtr
        get_onstoragecommit : IntPtr
        getElementById      : IntPtr
        updateSettings      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocument6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLDocumentCompatibleInfoCollection} 
     */
    compatible {
        get => this.get_compatible()
    }

    /**
     * @type {VARIANT} 
     */
    documentMode {
        get => this.get_documentMode()
    }

    /**
     * @type {VARIANT} 
     */
    onstorage {
        get => this.get_onstorage()
        set => this.put_onstorage(value)
    }

    /**
     * @type {VARIANT} 
     */
    onstoragecommit {
        get => this.get_onstoragecommit()
        set => this.put_onstoragecommit(value)
    }

    /**
     * 
     * @returns {IHTMLDocumentCompatibleInfoCollection} 
     */
    get_compatible() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocumentCompatibleInfoCollection(p)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_documentMode() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstorage(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstorage() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstoragecommit(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstoragecommit() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrId 
     * @returns {IHTMLElement2} 
     */
    getElementById(bstrId) {
        bstrId := bstrId is String ? BSTR.Alloc(bstrId).Value : bstrId

        result := ComCall(13, this, BSTR, bstrId, "ptr*", &ppRetElement := 0, "HRESULT")
        return IHTMLElement2(ppRetElement)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    updateSettings() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLDocument6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_compatible := CallbackCreate(GetMethod(implObj, "get_compatible"), flags, 2)
        this.vtbl.get_documentMode := CallbackCreate(GetMethod(implObj, "get_documentMode"), flags, 2)
        this.vtbl.put_onstorage := CallbackCreate(GetMethod(implObj, "put_onstorage"), flags, 2)
        this.vtbl.get_onstorage := CallbackCreate(GetMethod(implObj, "get_onstorage"), flags, 2)
        this.vtbl.put_onstoragecommit := CallbackCreate(GetMethod(implObj, "put_onstoragecommit"), flags, 2)
        this.vtbl.get_onstoragecommit := CallbackCreate(GetMethod(implObj, "get_onstoragecommit"), flags, 2)
        this.vtbl.getElementById := CallbackCreate(GetMethod(implObj, "getElementById"), flags, 3)
        this.vtbl.updateSettings := CallbackCreate(GetMethod(implObj, "updateSettings"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_compatible)
        CallbackFree(this.vtbl.get_documentMode)
        CallbackFree(this.vtbl.put_onstorage)
        CallbackFree(this.vtbl.get_onstorage)
        CallbackFree(this.vtbl.put_onstoragecommit)
        CallbackFree(this.vtbl.get_onstoragecommit)
        CallbackFree(this.vtbl.getElementById)
        CallbackFree(this.vtbl.updateSettings)
    }
}
