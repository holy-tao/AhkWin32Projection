#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_COLOR_F.ahk
#Include .\IDWriteFontFace1.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritefontface2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace2 extends IDWriteFontFace1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace2
     * @type {Guid}
     */
    static IID => Guid("{d8b768ff-64bc-4e66-982b-ec8e87f693f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsColorFont", "GetColorPaletteCount", "GetPaletteEntryCount", "GetPaletteEntries", "GetRecommendedRenderingMode"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-iscolorfont
     */
    IsColorFont() {
        result := ComCall(30, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getcolorpalettecount
     */
    GetColorPaletteCount() {
        result := ComCall(31, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getpaletteentrycount
     */
    GetPaletteEntryCount() {
        result := ComCall(32, this, "uint")
        return result
    }

    /**
     * The GetPaletteEntries function retrieves a specified range of palette entries from the given logical palette.
     * @param {Integer} colorPaletteIndex 
     * @param {Integer} firstEntryIndex 
     * @param {Integer} entryCount 
     * @returns {DWRITE_COLOR_F} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpaletteentries
     */
    GetPaletteEntries(colorPaletteIndex, firstEntryIndex, entryCount) {
        paletteEntries := DWRITE_COLOR_F()
        result := ComCall(33, this, "uint", colorPaletteIndex, "uint", firstEntryIndex, "uint", entryCount, "ptr", paletteEntries, "HRESULT")
        return paletteEntries
    }

    /**
     * 
     * @param {Float} fontEmSize 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @param {Pointer<DWRITE_MATRIX>} transform 
     * @param {BOOL} isSideways 
     * @param {Integer} outlineThreshold 
     * @param {Integer} measuringMode 
     * @param {IDWriteRenderingParams} renderingParams 
     * @param {Pointer<Integer>} renderingMode 
     * @param {Pointer<Integer>} gridFitMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode, renderingParams, renderingMode, gridFitMode) {
        renderingModeMarshal := renderingMode is VarRef ? "int*" : "ptr"
        gridFitModeMarshal := gridFitMode is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "ptr", renderingParams, renderingModeMarshal, renderingMode, gridFitModeMarshal, gridFitMode, "HRESULT")
        return result
    }
}
