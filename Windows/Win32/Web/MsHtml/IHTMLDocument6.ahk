#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDocumentCompatibleInfoCollection.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLElement2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocument6 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDocument6
     * @type {Guid}
     */
    static IID => Guid("{30510417-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_compatible", "get_documentMode", "put_onstorage", "get_onstorage", "put_onstoragecommit", "get_onstoragecommit", "getElementById", "updateSettings"]

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
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstorage(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstorage() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstoragecommit(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstoragecommit() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrId 
     * @returns {IHTMLElement2} 
     */
    getElementById(bstrId) {
        bstrId := bstrId is String ? BSTR.Alloc(bstrId).Value : bstrId

        result := ComCall(13, this, "ptr", bstrId, "ptr*", &ppRetElement := 0, "HRESULT")
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
}
