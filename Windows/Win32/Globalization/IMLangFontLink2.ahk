#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMLangCodePages.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangFontLink2 extends IMLangCodePages{
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
     * 
     * @param {HDC} hDC 
     * @param {HFONT} hFont 
     * @param {Pointer<UInt32>} pdwCodePages 
     * @returns {HRESULT} 
     */
    GetFontCodePages(hDC, hFont, pdwCodePages) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(7, this, "ptr", hDC, "ptr", hFont, "uint*", pdwCodePages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     */
    ReleaseFont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(8, this, "ptr", hFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFontMapping() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hDC 
     * @param {Integer} dwCodePages 
     * @param {Integer} chSrc 
     * @param {Pointer<HFONT>} pFont 
     * @returns {HRESULT} 
     */
    MapFont(hDC, dwCodePages, chSrc, pFont) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(10, this, "ptr", hDC, "uint", dwCodePages, "char", chSrc, "ptr", pFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetFontUnicodeRanges function returns information about which Unicode characters are supported by a font. The information is returned as a GLYPHSET structure.
     * @param {HDC} hDC 
     * @param {Pointer<UInt32>} puiRanges 
     * @param {Pointer<UNICODERANGE>} pUranges 
     * @returns {HRESULT} If the function succeeds, it returns number of bytes written to the GLYPHSET structure or, if the <i>lpgs</i> parameter is <b>NULL</b>, it returns the size of the GLYPHSET structure required to store the information.
     * 
     * If the function fails, it returns zero. No extended error information is available.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getfontunicoderanges
     */
    GetFontUnicodeRanges(hDC, puiRanges, pUranges) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(11, this, "ptr", hDC, "uint*", puiRanges, "ptr", pUranges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sid 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} puiFonts 
     * @param {Pointer<SCRIPTFONTINFO>} pScriptFont 
     * @returns {HRESULT} 
     */
    GetScriptFontInfo(sid, dwFlags, puiFonts, pScriptFont) {
        result := ComCall(12, this, "char", sid, "uint", dwFlags, "uint*", puiFonts, "ptr", pScriptFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @param {Pointer<Byte>} pSid 
     * @returns {HRESULT} 
     */
    CodePageToScriptID(uiCodePage, pSid) {
        result := ComCall(13, this, "uint", uiCodePage, "char*", pSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
