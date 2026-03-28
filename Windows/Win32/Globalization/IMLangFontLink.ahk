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
     * @param {HDC} _hDC 
     * @param {HFONT} _hFont 
     * @returns {Integer} 
     */
    GetFontCodePages(_hDC, _hFont) {
        _hDC := _hDC is Win32Handle ? NumGet(_hDC, "ptr") : _hDC
        _hFont := _hFont is Win32Handle ? NumGet(_hFont, "ptr") : _hFont

        result := ComCall(7, this, "ptr", _hDC, "ptr", _hFont, "uint*", &pdwCodePages := 0, "HRESULT")
        return pdwCodePages
    }

    /**
     * 
     * @param {HDC} _hDC 
     * @param {Integer} dwCodePages 
     * @param {HFONT} hSrcFont 
     * @returns {HFONT} 
     */
    MapFont(_hDC, dwCodePages, hSrcFont) {
        _hDC := _hDC is Win32Handle ? NumGet(_hDC, "ptr") : _hDC
        hSrcFont := hSrcFont is Win32Handle ? NumGet(hSrcFont, "ptr") : hSrcFont

        phDestFont := HFONT()
        result := ComCall(8, this, "ptr", _hDC, "uint", dwCodePages, "ptr", hSrcFont, "ptr", phDestFont, "HRESULT")
        return phDestFont
    }

    /**
     * 
     * @param {HFONT} _hFont 
     * @returns {HRESULT} 
     */
    ReleaseFont(_hFont) {
        _hFont := _hFont is Win32Handle ? NumGet(_hFont, "ptr") : _hFont

        result := ComCall(9, this, "ptr", _hFont, "HRESULT")
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
