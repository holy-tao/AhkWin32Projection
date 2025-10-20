#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXContentHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXContentHandler
     * @type {Guid}
     */
    static IID => Guid("{1545cdfa-9e4e-4497-a8a4-2bf7d0112c44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putDocumentLocator", "startDocument", "endDocument", "startPrefixMapping", "endPrefixMapping", "startElement", "endElement", "characters", "ignorableWhitespace", "processingInstruction", "skippedEntity"]

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
}
