#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Graphics\Gdi\HFONT.ahk
#Include .\IMLangCodePages.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangFontLink extends IMLangCodePages{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangFontLink
     * @type {Guid}
     */
    static IID => Guid("{359f3441-bd4a-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontCodePages", "MapFont", "ReleaseFont", "ResetFontMapping"]

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
     * @param {HDC} hDC_ 
     * @param {Integer} dwCodePages 
     * @param {HFONT} hSrcFont 
     * @returns {HFONT} 
     */
    MapFont(hDC_, dwCodePages, hSrcFont) {
        hDC_ := hDC_ is Win32Handle ? NumGet(hDC_, "ptr") : hDC_
        hSrcFont := hSrcFont is Win32Handle ? NumGet(hSrcFont, "ptr") : hSrcFont

        phDestFont := HFONT()
        result := ComCall(8, this, "ptr", hDC_, "uint", dwCodePages, "ptr", hSrcFont, "ptr", phDestFont, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDestFont
    }

    /**
     * 
     * @param {HFONT} hFont_ 
     * @returns {HRESULT} 
     */
    ReleaseFont(hFont_) {
        hFont_ := hFont_ is Win32Handle ? NumGet(hFont_, "ptr") : hFont_

        result := ComCall(9, this, "ptr", hFont_, "int")
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
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
