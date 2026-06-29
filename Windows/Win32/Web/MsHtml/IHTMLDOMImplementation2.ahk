#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLDocument7.ahk" { IHTMLDocument7 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IDOMDocumentType.ahk" { IDOMDocumentType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMImplementation2 extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMImplementation2
     * @type {Guid}
     */
    static IID := Guid("{3051073c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMImplementation2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createDocumentType : IntPtr
        createDocument     : IntPtr
        createHTMLDocument : IntPtr
        hasFeature         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMImplementation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrQualifiedName 
     * @param {Pointer<VARIANT>} pvarPublicId 
     * @param {Pointer<VARIANT>} pvarSystemId 
     * @returns {IDOMDocumentType} 
     */
    createDocumentType(bstrQualifiedName, pvarPublicId, pvarSystemId) {
        bstrQualifiedName := bstrQualifiedName is String ? BSTR.Alloc(bstrQualifiedName).Value : bstrQualifiedName

        result := ComCall(7, this, BSTR, bstrQualifiedName, VARIANT.Ptr, pvarPublicId, VARIANT.Ptr, pvarSystemId, "ptr*", &newDocumentType := 0, "HRESULT")
        return IDOMDocumentType(newDocumentType)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {Pointer<VARIANT>} pvarTagName 
     * @param {IDOMDocumentType} pDocumentType 
     * @returns {IHTMLDocument7} 
     */
    createDocument(pvarNS, pvarTagName, pDocumentType) {
        result := ComCall(8, this, VARIANT.Ptr, pvarNS, VARIANT.Ptr, pvarTagName, "ptr", pDocumentType, "ptr*", &ppnewDocument := 0, "HRESULT")
        return IHTMLDocument7(ppnewDocument)
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @returns {IHTMLDocument7} 
     */
    createHTMLDocument(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(9, this, BSTR, bstrTitle, "ptr*", &ppnewDocument := 0, "HRESULT")
        return IHTMLDocument7(ppnewDocument)
    }

    /**
     * 
     * @param {BSTR} bstrfeature 
     * @param {VARIANT} _version 
     * @returns {VARIANT_BOOL} 
     */
    hasFeature(bstrfeature, _version) {
        bstrfeature := bstrfeature is String ? BSTR.Alloc(bstrfeature).Value : bstrfeature

        result := ComCall(10, this, BSTR, bstrfeature, VARIANT, _version, VARIANT_BOOL.Ptr, &pfHasFeature := 0, "HRESULT")
        return pfHasFeature
    }

    Query(iid) {
        if (IHTMLDOMImplementation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createDocumentType := CallbackCreate(GetMethod(implObj, "createDocumentType"), flags, 5)
        this.vtbl.createDocument := CallbackCreate(GetMethod(implObj, "createDocument"), flags, 5)
        this.vtbl.createHTMLDocument := CallbackCreate(GetMethod(implObj, "createHTMLDocument"), flags, 3)
        this.vtbl.hasFeature := CallbackCreate(GetMethod(implObj, "hasFeature"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createDocumentType)
        CallbackFree(this.vtbl.createDocument)
        CallbackFree(this.vtbl.createHTMLDocument)
        CallbackFree(this.vtbl.hasFeature)
    }
}
