#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Graphics\Gdi\HFONT.ahk
#Include .\UNICODERANGE.ahk
#Include .\SCRIPTFONTINFO.ahk
#Include .\IMLangCodePages.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangFontLink2 extends IMLangCodePages{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangFontLink2
     * @type {Guid}
     */
    static IID => Guid("{dccfc162-2b38-11d2-b7ec-00c04f8f5d9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontCodePages", "ReleaseFont", "ResetFontMapping", "MapFont", "GetFontUnicodeRanges", "GetScriptFontInfo", "CodePageToScriptID"]

    /**
     * 
     * @param {HDC} hDC 
     * @param {HFONT} hFont 
     * @returns {Integer} 
     */
    GetFontCodePages(hDC, hFont) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(7, this, "ptr", hDC, "ptr", hFont, "uint*", &pdwCodePages := 0, "HRESULT")
        return pdwCodePages
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     */
    ReleaseFont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(8, this, "ptr", hFont, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFontMapping() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hDC 
     * @param {Integer} dwCodePages 
     * @param {Integer} chSrc 
     * @returns {HFONT} 
     */
    MapFont(hDC, dwCodePages, chSrc) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        pFont := HFONT()
        result := ComCall(10, this, "ptr", hDC, "uint", dwCodePages, "char", chSrc, "ptr", pFont, "HRESULT")
        return pFont
    }

    /**
     * The GetFontUnicodeRanges function returns information about which Unicode characters are supported by a font. The information is returned as a GLYPHSET structure.
     * @param {HDC} hDC 
     * @param {Pointer<Integer>} puiRanges 
     * @returns {UNICODERANGE} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getfontunicoderanges
     */
    GetFontUnicodeRanges(hDC, puiRanges) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        puiRangesMarshal := puiRanges is VarRef ? "uint*" : "ptr"

        pUranges := UNICODERANGE()
        result := ComCall(11, this, "ptr", hDC, puiRangesMarshal, puiRanges, "ptr", pUranges, "HRESULT")
        return pUranges
    }

    /**
     * 
     * @param {Integer} sid 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} puiFonts 
     * @returns {SCRIPTFONTINFO} 
     */
    GetScriptFontInfo(sid, dwFlags, puiFonts) {
        puiFontsMarshal := puiFonts is VarRef ? "uint*" : "ptr"

        pScriptFont := SCRIPTFONTINFO()
        result := ComCall(12, this, "char", sid, "uint", dwFlags, puiFontsMarshal, puiFonts, "ptr", pScriptFont, "HRESULT")
        return pScriptFont
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {Integer} 
     */
    CodePageToScriptID(uiCodePage) {
        result := ComCall(13, this, "uint", uiCodePage, "char*", &pSid := 0, "HRESULT")
        return pSid
    }
}
