#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISAXAttributes.ahk" { ISAXAttributes }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISAXLocator.ahk" { ISAXLocator }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXContentHandler extends IUnknown {
    /**
     * The interface identifier for ISAXContentHandler
     * @type {Guid}
     */
    static IID := Guid("{1545cdfa-9e4e-4497-a8a4-2bf7d0112c44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXContentHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        putDocumentLocator    : IntPtr
        startDocument         : IntPtr
        endDocument           : IntPtr
        startPrefixMapping    : IntPtr
        endPrefixMapping      : IntPtr
        startElement          : IntPtr
        endElement            : IntPtr
        characters            : IntPtr
        ignorableWhitespace   : IntPtr
        processingInstruction : IntPtr
        skippedEntity         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXContentHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISAXLocator} pLocator 
     * @returns {HRESULT} 
     */
    putDocumentLocator(pLocator) {
        result := ComCall(3, this, "ptr", pLocator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startDocument() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endDocument() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchPrefix 
     * @param {Integer} cchPrefix 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @returns {HRESULT} 
     */
    startPrefixMapping(pwchPrefix, cchPrefix, pwchUri, cchUri) {
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri

        result := ComCall(6, this, "ptr", pwchPrefix, "int", cchPrefix, "ptr", pwchUri, "int", cchUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchPrefix 
     * @param {Integer} cchPrefix 
     * @returns {HRESULT} 
     */
    endPrefixMapping(pwchPrefix, cchPrefix) {
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix

        result := ComCall(7, this, "ptr", pwchPrefix, "int", cchPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchNamespaceUri 
     * @param {Integer} cchNamespaceUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {ISAXAttributes} pAttributes 
     * @returns {HRESULT} 
     */
    startElement(pwchNamespaceUri, cchNamespaceUri, pwchLocalName, cchLocalName, pwchQName, cchQName, pAttributes) {
        pwchNamespaceUri := pwchNamespaceUri is String ? StrPtr(pwchNamespaceUri) : pwchNamespaceUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        result := ComCall(8, this, "ptr", pwchNamespaceUri, "int", cchNamespaceUri, "ptr", pwchLocalName, "int", cchLocalName, "ptr", pwchQName, "int", cchQName, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchNamespaceUri 
     * @param {Integer} cchNamespaceUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @returns {HRESULT} 
     */
    endElement(pwchNamespaceUri, cchNamespaceUri, pwchLocalName, cchLocalName, pwchQName, cchQName) {
        pwchNamespaceUri := pwchNamespaceUri is String ? StrPtr(pwchNamespaceUri) : pwchNamespaceUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        result := ComCall(9, this, "ptr", pwchNamespaceUri, "int", cchNamespaceUri, "ptr", pwchLocalName, "int", cchLocalName, "ptr", pwchQName, "int", cchQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchChars 
     * @param {Integer} cchChars 
     * @returns {HRESULT} 
     */
    characters(pwchChars, cchChars) {
        pwchChars := pwchChars is String ? StrPtr(pwchChars) : pwchChars

        result := ComCall(10, this, "ptr", pwchChars, "int", cchChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchChars 
     * @param {Integer} cchChars 
     * @returns {HRESULT} 
     */
    ignorableWhitespace(pwchChars, cchChars) {
        pwchChars := pwchChars is String ? StrPtr(pwchChars) : pwchChars

        result := ComCall(11, this, "ptr", pwchChars, "int", cchChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchTarget 
     * @param {Integer} cchTarget 
     * @param {PWSTR} pwchData 
     * @param {Integer} cchData 
     * @returns {HRESULT} 
     */
    processingInstruction(pwchTarget, cchTarget, pwchData, cchData) {
        pwchTarget := pwchTarget is String ? StrPtr(pwchTarget) : pwchTarget
        pwchData := pwchData is String ? StrPtr(pwchData) : pwchData

        result := ComCall(12, this, "ptr", pwchTarget, "int", cchTarget, "ptr", pwchData, "int", cchData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     */
    skippedEntity(pwchName, cchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(13, this, "ptr", pwchName, "int", cchName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXContentHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putDocumentLocator := CallbackCreate(GetMethod(implObj, "putDocumentLocator"), flags, 2)
        this.vtbl.startDocument := CallbackCreate(GetMethod(implObj, "startDocument"), flags, 1)
        this.vtbl.endDocument := CallbackCreate(GetMethod(implObj, "endDocument"), flags, 1)
        this.vtbl.startPrefixMapping := CallbackCreate(GetMethod(implObj, "startPrefixMapping"), flags, 5)
        this.vtbl.endPrefixMapping := CallbackCreate(GetMethod(implObj, "endPrefixMapping"), flags, 3)
        this.vtbl.startElement := CallbackCreate(GetMethod(implObj, "startElement"), flags, 8)
        this.vtbl.endElement := CallbackCreate(GetMethod(implObj, "endElement"), flags, 7)
        this.vtbl.characters := CallbackCreate(GetMethod(implObj, "characters"), flags, 3)
        this.vtbl.ignorableWhitespace := CallbackCreate(GetMethod(implObj, "ignorableWhitespace"), flags, 3)
        this.vtbl.processingInstruction := CallbackCreate(GetMethod(implObj, "processingInstruction"), flags, 5)
        this.vtbl.skippedEntity := CallbackCreate(GetMethod(implObj, "skippedEntity"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putDocumentLocator)
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
