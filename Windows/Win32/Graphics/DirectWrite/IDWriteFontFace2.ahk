#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace1.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritefontface2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace2 extends IDWriteFontFace1{
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
     * 
     * @returns {BOOL} 
     */
    IsColorFont() {
        result := ComCall(30, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetColorPaletteCount() {
        result := ComCall(31, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
     * @param {Pointer<DWRITE_COLOR_F>} paletteEntries 
     * @returns {HRESULT} If the function succeeds and the handle to the logical palette is a valid pointer (not <b>NULL</b>), the return value is the number of entries retrieved from the logical palette. If the function succeeds and handle to the logical palette is <b>NULL</b>, the return value is the number of entries in the given palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpaletteentries
     */
    GetPaletteEntries(colorPaletteIndex, firstEntryIndex, entryCount, paletteEntries) {
        result := ComCall(33, this, "uint", colorPaletteIndex, "uint", firstEntryIndex, "uint", entryCount, "ptr", paletteEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<IDWriteRenderingParams>} renderingParams 
     * @param {Pointer<Int32>} renderingMode 
     * @param {Pointer<Int32>} gridFitMode 
     * @returns {HRESULT} 
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode, renderingParams, renderingMode, gridFitMode) {
        result := ComCall(34, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "ptr", renderingParams, "int*", renderingMode, "int*", gridFitMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
