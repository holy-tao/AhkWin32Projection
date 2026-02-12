#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLStyleSheetRulesCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSMediaRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSMediaRule
     * @type {Guid}
     */
    static IID => Guid("{305106eb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSMediaRule
     * @type {Guid}
     */
    static CLSID => Guid("{305106f1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_media", "get_media", "get_cssRules", "insertRule", "deleteRule"]

    /**
     * @type {VARIANT} 
     */
    media {
        get => this.get_media()
        set => this.put_media(value)
    }

    /**
     * @type {IHTMLStyleSheetRulesCollection} 
     */
    cssRules {
        get => this.get_cssRules()
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_media() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesCollection} 
     */
    get_cssRules() {
        result := ComCall(9, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheetRulesCollection(p)
    }

    /**
     * 
     * @param {BSTR} bstrRule 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    insertRule(bstrRule, lIndex) {
        if(bstrRule is String) {
            pin := BSTR.Alloc(bstrRule)
            bstrRule := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrRule, "int", lIndex, "int*", &plNewIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plNewIndex
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    deleteRule(lIndex) {
        result := ComCall(11, this, "int", lIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
