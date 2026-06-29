#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVBSAXAttributes.ahk" { IVBSAXAttributes }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IVBSAXLocator.ahk" { IVBSAXLocator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXContentHandler extends IDispatch {
    /**
     * The interface identifier for IVBSAXContentHandler
     * @type {Guid}
     */
    static IID := Guid("{2ed7290a-4dd5-4b46-bb26-4e4155e77faa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXContentHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_documentLocator : IntPtr
        startDocument          : IntPtr
        endDocument            : IntPtr
        startPrefixMapping     : IntPtr
        endPrefixMapping       : IntPtr
        startElement           : IntPtr
        endElement             : IntPtr
        characters             : IntPtr
        ignorableWhitespace    : IntPtr
        processingInstruction  : IntPtr
        skippedEntity          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXContentHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IVBSAXLocator} oLocator 
     * @returns {HRESULT} 
     */
    putref_documentLocator(oLocator) {
        result := ComCall(7, this, "ptr", oLocator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startDocument() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endDocument() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPrefix 
     * @param {Pointer<BSTR>} strURI 
     * @returns {HRESULT} 
     */
    startPrefixMapping(strPrefix, strURI) {
        result := ComCall(10, this, BSTR.Ptr, strPrefix, BSTR.Ptr, strURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPrefix 
     * @returns {HRESULT} 
     */
    endPrefixMapping(strPrefix) {
        result := ComCall(11, this, BSTR.Ptr, strPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strNamespaceURI 
     * @param {Pointer<BSTR>} strLocalName 
     * @param {Pointer<BSTR>} strQName 
     * @param {IVBSAXAttributes} oAttributes 
     * @returns {HRESULT} 
     */
    startElement(strNamespaceURI, strLocalName, strQName, oAttributes) {
        result := ComCall(12, this, BSTR.Ptr, strNamespaceURI, BSTR.Ptr, strLocalName, BSTR.Ptr, strQName, "ptr", oAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strNamespaceURI 
     * @param {Pointer<BSTR>} strLocalName 
     * @param {Pointer<BSTR>} strQName 
     * @returns {HRESULT} 
     */
    endElement(strNamespaceURI, strLocalName, strQName) {
        result := ComCall(13, this, BSTR.Ptr, strNamespaceURI, BSTR.Ptr, strLocalName, BSTR.Ptr, strQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strChars 
     * @returns {HRESULT} 
     */
    characters(strChars) {
        result := ComCall(14, this, BSTR.Ptr, strChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strChars 
     * @returns {HRESULT} 
     */
    ignorableWhitespace(strChars) {
        result := ComCall(15, this, BSTR.Ptr, strChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strTarget 
     * @param {Pointer<BSTR>} strData 
     * @returns {HRESULT} 
     */
    processingInstruction(strTarget, strData) {
        result := ComCall(16, this, BSTR.Ptr, strTarget, BSTR.Ptr, strData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    skippedEntity(strName) {
        result := ComCall(17, this, BSTR.Ptr, strName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXContentHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_documentLocator := CallbackCreate(GetMethod(implObj, "putref_documentLocator"), flags, 2)
        this.vtbl.startDocument := CallbackCreate(GetMethod(implObj, "startDocument"), flags, 1)
        this.vtbl.endDocument := CallbackCreate(GetMethod(implObj, "endDocument"), flags, 1)
        this.vtbl.startPrefixMapping := CallbackCreate(GetMethod(implObj, "startPrefixMapping"), flags, 3)
        this.vtbl.endPrefixMapping := CallbackCreate(GetMethod(implObj, "endPrefixMapping"), flags, 2)
        this.vtbl.startElement := CallbackCreate(GetMethod(implObj, "startElement"), flags, 5)
        this.vtbl.endElement := CallbackCreate(GetMethod(implObj, "endElement"), flags, 4)
        this.vtbl.characters := CallbackCreate(GetMethod(implObj, "characters"), flags, 2)
        this.vtbl.ignorableWhitespace := CallbackCreate(GetMethod(implObj, "ignorableWhitespace"), flags, 2)
        this.vtbl.processingInstruction := CallbackCreate(GetMethod(implObj, "processingInstruction"), flags, 3)
        this.vtbl.skippedEntity := CallbackCreate(GetMethod(implObj, "skippedEntity"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_documentLocator)
        CallbackFree(this.vtbl.startDocument)
        CallbackFree(this.vtbl.endDocument)
        CallbackFree(this.vtbl.startPrefixMapping)
        CallbackFree(this.vtbl.endPrefixMapping)
        CallbackFree(this.vtbl.startElement)
        CallbackFree(this.vtbl.endElement)
        CallbackFree(this.vtbl.characters)
        CallbackFree(this.vtbl.ignorableWhitespace)
        CallbackFree(this.vtbl.processingInstruction)
        CallbackFree(this.vtbl.skippedEntity)
    }
}
