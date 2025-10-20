#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXContentHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXContentHandler
     * @type {Guid}
     */
    static IID => Guid("{2ed7290a-4dd5-4b46-bb26-4e4155e77faa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_documentLocator", "startDocument", "endDocument", "startPrefixMapping", "endPrefixMapping", "startElement", "endElement", "characters", "ignorableWhitespace", "processingInstruction", "skippedEntity"]

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
        result := ComCall(10, this, "ptr", strPrefix, "ptr", strURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPrefix 
     * @returns {HRESULT} 
     */
    endPrefixMapping(strPrefix) {
        result := ComCall(11, this, "ptr", strPrefix, "HRESULT")
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
        result := ComCall(12, this, "ptr", strNamespaceURI, "ptr", strLocalName, "ptr", strQName, "ptr", oAttributes, "HRESULT")
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
        result := ComCall(13, this, "ptr", strNamespaceURI, "ptr", strLocalName, "ptr", strQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strChars 
     * @returns {HRESULT} 
     */
    characters(strChars) {
        result := ComCall(14, this, "ptr", strChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strChars 
     * @returns {HRESULT} 
     */
    ignorableWhitespace(strChars) {
        result := ComCall(15, this, "ptr", strChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strTarget 
     * @param {Pointer<BSTR>} strData 
     * @returns {HRESULT} 
     */
    processingInstruction(strTarget, strData) {
        result := ComCall(16, this, "ptr", strTarget, "ptr", strData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    skippedEntity(strName) {
        result := ComCall(17, this, "ptr", strName, "HRESULT")
        return result
    }
}
