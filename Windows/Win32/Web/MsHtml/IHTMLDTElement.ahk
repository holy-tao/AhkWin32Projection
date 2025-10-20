#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDTElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDTElement
     * @type {Guid}
     */
    static IID => Guid("{3050f1f3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDTElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f27c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_noWrap", "get_noWrap"]

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noWrap(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_noWrap(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }
}
