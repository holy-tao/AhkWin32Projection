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
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} mediaQuery 
     * @returns {VARIANT_BOOL} 
     */
    matchMedium(mediaQuery) {
        mediaQuery := mediaQuery is String ? BSTR.Alloc(mediaQuery).Value : mediaQuery

        result := ComCall(8, this, "ptr", mediaQuery, "short*", &matches := 0, "HRESULT")
        return matches
    }
}
