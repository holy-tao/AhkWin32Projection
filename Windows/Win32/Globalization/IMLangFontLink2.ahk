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
     * @param {HDC} hDC_ 
     * @param {HFONT} hFont_ 
     * @returns {Integer} 
     */
    GetFontCodePages(hDC_, hFont_) {
        hDC_ := hDC_ is Win32Handle ? NumGet(hDC_, "ptr") : hDC_
        hFont_ := hFont_ is Win32Handle ? NumGet(hFont_, "ptr") : hFont_

        result := ComCall(7, this, "ptr", hDC_, "ptr", hFont_, "uint*", &pdwCodePages := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCodePages
    }

    /**
     * 
     * @param {HFONT} hFont_ 
     * @returns {HRESULT} 
     */
    ReleaseFont(hFont_) {
        hFont_ := hFont_ is Win32Handle ? NumGet(hFont_, "ptr") : hFont_

        result := ComCall(8, this, "ptr", hFont_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFontMapping() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HDC} hDC_ 
     * @param {Integer} dwCodePages 
     * @param {Integer} chSrc 
     * @returns {HFONT} 
     */
    MapFont(hDC_, dwCodePages, chSrc) {
        hDC_ := hDC_ is Win32Handle ? NumGet(hDC_, "ptr") : hDC_

        pFont := HFONT()
        result := ComCall(10, this, "ptr", hDC_, "uint", dwCodePages, "char", chSrc, "ptr", pFont, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFont
    }

    /**
     * The GetFontUnicodeRanges function returns information about which Unicode characters are supported by a font. The information is returned as a GLYPHSET structure.
     * @param {HDC} hDC_ 
     * @param {Pointer<Integer>} puiRanges 
     * @returns {UNICODERANGE} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getfontunicoderanges
     */
    GetFontUnicodeRanges(hDC_, puiRanges) {
        hDC_ := hDC_ is Win32Handle ? NumGet(hDC_, "ptr") : hDC_

        puiRangesMarshal := puiRanges is VarRef ? "uint*" : "ptr"

        pUranges := UNICODERANGE()
        result := ComCall(11, this, "ptr", hDC_, puiRangesMarshal, puiRanges, "ptr", pUranges, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pUranges
    }

    /**
     * 
     * @param {Integer} sid_ 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} puiFonts 
     * @returns {SCRIPTFONTINFO} 
     */
    GetScriptFontInfo(sid_, dwFlags, puiFonts) {
        puiFontsMarshal := puiFonts is VarRef ? "uint*" : "ptr"

        pScriptFont := SCRIPTFONTINFO()
        result := ComCall(12, this, "char", sid_, "uint", dwFlags, puiFontsMarshal, puiFonts, "ptr", pScriptFont, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pScriptFont
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {Integer} 
     */
    CodePageToScriptID(uiCodePage) {
        result := ComCall(13, this, "uint", uiCodePage, "char*", &pSid_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSid_
    }
}
