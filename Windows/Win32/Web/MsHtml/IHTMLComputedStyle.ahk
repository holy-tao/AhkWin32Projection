#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLComputedStyle extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLComputedStyle
     * @type {Guid}
     */
    static IID => Guid("{3050f6c3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_bold", "get_italic", "get_underline", "get_overline", "get_strikeOut", "get_subScript", "get_superScript", "get_explicitFace", "get_fontWeight", "get_fontSize", "get_fontName", "get_hasBgColor", "get_textColor", "get_backgroundColor", "get_preFormatted", "get_direction", "get_blockDirection", "get_OL", "IsEqual"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_bold() {
        result := ComCall(3, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_italic() {
        result := ComCall(4, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_underline() {
        result := ComCall(5, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_overline() {
        result := ComCall(6, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_strikeOut() {
        result := ComCall(7, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_subScript() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_superScript() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_explicitFace() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fontWeight() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fontSize() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fontName() {
        result := ComCall(13, this, "char*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_hasBgColor() {
        result := ComCall(14, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_textColor() {
        result := ComCall(15, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_backgroundColor() {
        result := ComCall(16, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_preFormatted() {
        result := ComCall(17, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_direction() {
        result := ComCall(18, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_blockDirection() {
        result := ComCall(19, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_OL() {
        result := ComCall(20, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLComputedStyle} pComputedStyle 
     * @returns {VARIANT_BOOL} 
     */
    IsEqual(pComputedStyle) {
        result := ComCall(21, this, "ptr", pComputedStyle, "short*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }
}
