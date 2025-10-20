#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IHTMLDocumentCompatibleInfoCollection>} p 
     * @returns {HRESULT} 
     */
    get_compatible(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_documentMode(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onstorage(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_onstoragecommit(p) {
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrId 
     * @param {Pointer<IHTMLElement2>} ppRetElement 
     * @returns {HRESULT} 
     */
    getElementById(bstrId, ppRetElement) {
        bstrId := bstrId is String ? BSTR.Alloc(bstrId).Value : bstrId

        result := ComCall(13, this, "ptr", bstrId, "ptr*", ppRetElement, "HRESULT")
        return result
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
