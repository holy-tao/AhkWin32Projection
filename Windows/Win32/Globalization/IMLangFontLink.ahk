#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
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
     * @param {HDC} hDC 
     * @param {HFONT} hFont 
     * @param {Pointer<Integer>} pdwCodePages 
     * @returns {HRESULT} 
     */
    GetFontCodePages(hDC, hFont, pdwCodePages) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(7, this, "ptr", hDC, "ptr", hFont, "uint*", pdwCodePages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hDC 
     * @param {Integer} dwCodePages 
     * @param {HFONT} hSrcFont 
     * @param {Pointer<HFONT>} phDestFont 
     * @returns {HRESULT} 
     */
    MapFont(hDC, dwCodePages, hSrcFont, phDestFont) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC
        hSrcFont := hSrcFont is Win32Handle ? NumGet(hSrcFont, "ptr") : hSrcFont

        result := ComCall(8, this, "ptr", hDC, "uint", dwCodePages, "ptr", hSrcFont, "ptr", phDestFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     */
    ReleaseFont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(9, this, "ptr", hFont, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFontMapping() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
