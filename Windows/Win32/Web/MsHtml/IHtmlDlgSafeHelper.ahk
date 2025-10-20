#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHtmlDlgSafeHelper extends IDispatch{
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
     * 
     * @param {VARIANT} initColor 
     * @param {Pointer<VARIANT>} rgbColor 
     * @returns {HRESULT} 
     */
    choosecolordlg(initColor, rgbColor) {
        result := ComCall(7, this, "ptr", initColor, "ptr", rgbColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} fontName 
     * @param {Pointer<VARIANT>} charset 
     * @returns {HRESULT} 
     */
    getCharset(fontName, charset) {
        fontName := fontName is String ? BSTR.Alloc(fontName).Value : fontName

        result := ComCall(8, this, "ptr", fontName, "ptr", charset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_Fonts(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_BlockFormats(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
