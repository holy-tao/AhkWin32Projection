#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleMedia extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleMedia
     * @type {Guid}
     */
    static IID => Guid("{3051074b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleMedia
     * @type {Guid}
     */
    static CLSID => Guid("{3051074c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "matchMedium"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} mediaQuery 
     * @param {Pointer<VARIANT_BOOL>} matches 
     * @returns {HRESULT} 
     */
    matchMedium(mediaQuery, matches) {
        mediaQuery := mediaQuery is String ? BSTR.Alloc(mediaQuery).Value : mediaQuery

        result := ComCall(8, this, "ptr", mediaQuery, "ptr", matches, "HRESULT")
        return result
    }
}
