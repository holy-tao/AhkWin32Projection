#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMImplementation2 extends IDispatch{
    /**
     * The interface identifier for IHTMLDOMImplementation2
     * @type {Guid}
     */
    static IID => Guid("{3051073c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrQualifiedName 
     * @param {Pointer<VARIANT>} pvarPublicId 
     * @param {Pointer<VARIANT>} pvarSystemId 
     * @param {Pointer<IDOMDocumentType>} newDocumentType 
     * @returns {HRESULT} 
     */
    createDocumentType(bstrQualifiedName, pvarPublicId, pvarSystemId, newDocumentType) {
        bstrQualifiedName := bstrQualifiedName is String ? BSTR.Alloc(bstrQualifiedName).Value : bstrQualifiedName

        result := ComCall(7, this, "ptr", bstrQualifiedName, "ptr", pvarPublicId, "ptr", pvarSystemId, "ptr", newDocumentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {Pointer<VARIANT>} pvarTagName 
     * @param {Pointer<IDOMDocumentType>} pDocumentType 
     * @param {Pointer<IHTMLDocument7>} ppnewDocument 
     * @returns {HRESULT} 
     */
    createDocument(pvarNS, pvarTagName, pDocumentType, ppnewDocument) {
        result := ComCall(8, this, "ptr", pvarNS, "ptr", pvarTagName, "ptr", pDocumentType, "ptr", ppnewDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @param {Pointer<IHTMLDocument7>} ppnewDocument 
     * @returns {HRESULT} 
     */
    createHTMLDocument(bstrTitle, ppnewDocument) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(9, this, "ptr", bstrTitle, "ptr", ppnewDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrfeature 
     * @param {VARIANT} version 
     * @param {Pointer<VARIANT_BOOL>} pfHasFeature 
     * @returns {HRESULT} 
     */
    hasFeature(bstrfeature, version, pfHasFeature) {
        bstrfeature := bstrfeature is String ? BSTR.Alloc(bstrfeature).Value : bstrfeature

        result := ComCall(10, this, "ptr", bstrfeature, "ptr", version, "ptr", pfHasFeature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
