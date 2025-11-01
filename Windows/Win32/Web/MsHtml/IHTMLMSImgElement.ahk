#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMSImgElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLMSImgElement
     * @type {Guid}
     */
    static IID => Guid("{30510793-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_msPlayToDisabled", "get_msPlayToDisabled", "put_msPlayToPrimary", "get_msPlayToPrimary"]

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_msPlayToDisabled(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_msPlayToDisabled(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_msPlayToPrimary(v) {
        result := ComCall(9, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_msPlayToPrimary(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
    }
}
