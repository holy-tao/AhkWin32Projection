#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMTextNode2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMTextNode2
     * @type {Guid}
     */
    static IID => Guid("{3050f809-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["substringData", "appendData", "insertData", "deleteData", "replaceData"]

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @param {Pointer<BSTR>} pbstrsubString 
     * @returns {HRESULT} 
     */
    substringData(offset, Count, pbstrsubString) {
        result := ComCall(7, this, "int", offset, "int", Count, "ptr", pbstrsubString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    appendData(bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(8, this, "ptr", bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    insertData(offset, bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(9, this, "int", offset, "ptr", bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    deleteData(offset, Count) {
        result := ComCall(10, this, "int", offset, "int", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    replaceData(offset, Count, bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(11, this, "int", offset, "int", Count, "ptr", bstrstring, "HRESULT")
        return result
    }
}
