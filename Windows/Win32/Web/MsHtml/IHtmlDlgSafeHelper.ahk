#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHtmlDlgSafeHelper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHtmlDlgSafeHelper
     * @type {Guid}
     */
    static IID => Guid("{3050f81a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HtmlDlgSafeHelper
     * @type {Guid}
     */
    static CLSID => Guid("{3050f819-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["choosecolordlg", "getCharset", "get_Fonts", "get_BlockFormats"]

    /**
     * @type {IDispatch} 
     */
    Fonts {
        get => this.get_Fonts()
    }

    /**
     * @type {IDispatch} 
     */
    BlockFormats {
        get => this.get_BlockFormats()
    }

    /**
     * 
     * @param {VARIANT} initColor 
     * @returns {VARIANT} 
     */
    choosecolordlg(initColor) {
        rgbColor := VARIANT()
        result := ComCall(7, this, "ptr", initColor, "ptr", rgbColor, "HRESULT")
        return rgbColor
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @returns {VARIANT} 
     */
    getCharset(fontName) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        charset := VARIANT()
        result := ComCall(8, this, "ptr", fontName, "ptr", charset, "HRESULT")
        return charset
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Fonts() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_BlockFormats() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }
}
