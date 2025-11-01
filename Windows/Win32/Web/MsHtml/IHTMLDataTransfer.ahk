#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDataTransfer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDataTransfer
     * @type {Guid}
     */
    static IID => Guid("{3050f4b3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setData", "getData", "clearData", "put_dropEffect", "get_dropEffect", "put_effectAllowed", "get_effectAllowed"]

    /**
     * 
     * @param {BSTR} format 
     * @param {Pointer<VARIANT>} data 
     * @param {Pointer<VARIANT_BOOL>} pret 
     * @returns {HRESULT} 
     */
    setData(format, data, pret) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(7, this, "ptr", format, "ptr", data, "ptr", pret, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} format 
     * @param {Pointer<VARIANT>} pvarRet 
     * @returns {HRESULT} 
     */
    getData(format, pvarRet) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(8, this, "ptr", format, "ptr", pvarRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} format 
     * @param {Pointer<VARIANT_BOOL>} pret 
     * @returns {HRESULT} 
     */
    clearData(format, pret) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(9, this, "ptr", format, "ptr", pret, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dropEffect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dropEffect(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_effectAllowed(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_effectAllowed(p) {
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return result
    }
}
