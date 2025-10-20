#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMVisual.ahk

/**
 * Describes the text that appears on a page.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMGlyphs       *newInterface;
  * // this interface is defined outside of this example
  * //  IXpsOMFontResource *font; 
  * 
  * // Note the implicit requirement that CoInitializeEx 
  * //  has previously been called from this thread.
  * 
  * hr = CoCreateInstance(
  *     __uuidof(XpsOMObjectFactory),
  *     NULL,
  *     CLSCTX_INPROC_SERVER,
  *     _uuidof(IXpsOMObjectFactory),
  *     reinterpret_cast<LPVOID*>(&xpsFactory)
  *     );
  * 
  * if (SUCCEEDED(hr))
  * {
  *     hr = xpsFactory->CreateGlyphs (font, &newInterface);
  *     if (SUCCEEDED(hr))
  *     {
  *         // use newInterface
  * 
  *         newInterface->Release();
  *     }
  *     xpsFactory->Release();
  * }
  * else
  * {
  *     // evaluate HRESULT error returned in hr
  * }
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGlyphs extends IXpsOMVisual{
    /**
     * The interface identifier for IXpsOMGlyphs
     * @type {Guid}
     */
    static IID => Guid("{819b3199-0a5a-4b64-bec7-a9e17e780de2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * 
     * @param {Pointer<PWSTR>} unicodeString 
     * @returns {HRESULT} 
     */
    GetUnicodeString(unicodeString) {
        result := ComCall(30, this, "ptr", unicodeString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} indexCount 
     * @returns {HRESULT} 
     */
    GetGlyphIndexCount(indexCount) {
        result := ComCall(31, this, "uint*", indexCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} indexCount 
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices 
     * @returns {HRESULT} 
     */
    GetGlyphIndices(indexCount, glyphIndices) {
        result := ComCall(32, this, "uint*", indexCount, "ptr", glyphIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} glyphMappingCount 
     * @returns {HRESULT} 
     */
    GetGlyphMappingCount(glyphMappingCount) {
        result := ComCall(33, this, "uint*", glyphMappingCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} glyphMappingCount 
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings 
     * @returns {HRESULT} 
     */
    GetGlyphMappings(glyphMappingCount, glyphMappings) {
        result := ComCall(34, this, "uint*", glyphMappingCount, "ptr", glyphMappings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} prohibitedCaretStopCount 
     * @returns {HRESULT} 
     */
    GetProhibitedCaretStopCount(prohibitedCaretStopCount) {
        result := ComCall(35, this, "uint*", prohibitedCaretStopCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} prohibitedCaretStopCount 
     * @param {Pointer<UInt32>} prohibitedCaretStops 
     * @returns {HRESULT} 
     */
    GetProhibitedCaretStops(prohibitedCaretStopCount, prohibitedCaretStops) {
        result := ComCall(36, this, "uint*", prohibitedCaretStopCount, "uint*", prohibitedCaretStops, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} bidiLevel 
     * @returns {HRESULT} 
     */
    GetBidiLevel(bidiLevel) {
        result := ComCall(37, this, "uint*", bidiLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isSideways 
     * @returns {HRESULT} 
     */
    GetIsSideways(isSideways) {
        result := ComCall(38, this, "ptr", isSideways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} deviceFontName 
     * @returns {HRESULT} 
     */
    GetDeviceFontName(deviceFontName) {
        result := ComCall(39, this, "ptr", deviceFontName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} styleSimulations 
     * @returns {HRESULT} 
     */
    GetStyleSimulations(styleSimulations) {
        result := ComCall(40, this, "int*", styleSimulations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} styleSimulations 
     * @returns {HRESULT} 
     */
    SetStyleSimulations(styleSimulations) {
        result := ComCall(41, this, "int", styleSimulations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} origin 
     * @returns {HRESULT} 
     */
    GetOrigin(origin) {
        result := ComCall(42, this, "ptr", origin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} origin 
     * @returns {HRESULT} 
     */
    SetOrigin(origin) {
        result := ComCall(43, this, "ptr", origin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} fontRenderingEmSize 
     * @returns {HRESULT} 
     */
    GetFontRenderingEmSize(fontRenderingEmSize) {
        result := ComCall(44, this, "float*", fontRenderingEmSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} fontRenderingEmSize 
     * @returns {HRESULT} 
     */
    SetFontRenderingEmSize(fontRenderingEmSize) {
        result := ComCall(45, this, "float", fontRenderingEmSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMFontResource>} fontResource 
     * @returns {HRESULT} 
     */
    GetFontResource(fontResource) {
        result := ComCall(46, this, "ptr", fontResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMFontResource>} fontResource 
     * @returns {HRESULT} 
     */
    SetFontResource(fontResource) {
        result := ComCall(47, this, "ptr", fontResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} fontFaceIndex 
     * @returns {HRESULT} 
     */
    GetFontFaceIndex(fontFaceIndex) {
        result := ComCall(48, this, "short*", fontFaceIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fontFaceIndex 
     * @returns {HRESULT} 
     */
    SetFontFaceIndex(fontFaceIndex) {
        result := ComCall(49, this, "short", fontFaceIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} fillBrush 
     * @returns {HRESULT} 
     */
    GetFillBrush(fillBrush) {
        result := ComCall(50, this, "ptr", fillBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} fillBrush 
     * @returns {HRESULT} 
     */
    GetFillBrushLocal(fillBrush) {
        result := ComCall(51, this, "ptr", fillBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} fillBrush 
     * @returns {HRESULT} 
     */
    SetFillBrushLocal(fillBrush) {
        result := ComCall(52, this, "ptr", fillBrush, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     */
    GetFillBrushLookup(key) {
        result := ComCall(53, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     */
    SetFillBrushLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(54, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGlyphsEditor>} editor 
     * @returns {HRESULT} 
     */
    GetGlyphsEditor(editor) {
        result := ComCall(55, this, "ptr", editor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGlyphs>} glyphs 
     * @returns {HRESULT} 
     */
    Clone(glyphs) {
        result := ComCall(56, this, "ptr", glyphs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
