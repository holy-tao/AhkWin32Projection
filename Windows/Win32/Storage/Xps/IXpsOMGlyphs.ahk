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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUnicodeString", "GetGlyphIndexCount", "GetGlyphIndices", "GetGlyphMappingCount", "GetGlyphMappings", "GetProhibitedCaretStopCount", "GetProhibitedCaretStops", "GetBidiLevel", "GetIsSideways", "GetDeviceFontName", "GetStyleSimulations", "SetStyleSimulations", "GetOrigin", "SetOrigin", "GetFontRenderingEmSize", "SetFontRenderingEmSize", "GetFontResource", "SetFontResource", "GetFontFaceIndex", "SetFontFaceIndex", "GetFillBrush", "GetFillBrushLocal", "SetFillBrushLocal", "GetFillBrushLookup", "SetFillBrushLookup", "GetGlyphsEditor", "Clone"]

    /**
     * 
     * @param {Pointer<PWSTR>} unicodeString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getunicodestring
     */
    GetUnicodeString(unicodeString) {
        result := ComCall(30, this, "ptr", unicodeString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} indexCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindexcount
     */
    GetGlyphIndexCount(indexCount) {
        result := ComCall(31, this, "uint*", indexCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} indexCount 
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindices
     */
    GetGlyphIndices(indexCount, glyphIndices) {
        result := ComCall(32, this, "uint*", indexCount, "ptr", glyphIndices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphMappingCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappingcount
     */
    GetGlyphMappingCount(glyphMappingCount) {
        result := ComCall(33, this, "uint*", glyphMappingCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphMappingCount 
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappings
     */
    GetGlyphMappings(glyphMappingCount, glyphMappings) {
        result := ComCall(34, this, "uint*", glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prohibitedCaretStopCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstopcount
     */
    GetProhibitedCaretStopCount(prohibitedCaretStopCount) {
        result := ComCall(35, this, "uint*", prohibitedCaretStopCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prohibitedCaretStopCount 
     * @param {Pointer<Integer>} prohibitedCaretStops 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstops
     */
    GetProhibitedCaretStops(prohibitedCaretStopCount, prohibitedCaretStops) {
        result := ComCall(36, this, "uint*", prohibitedCaretStopCount, "uint*", prohibitedCaretStops, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bidiLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getbidilevel
     */
    GetBidiLevel(bidiLevel) {
        result := ComCall(37, this, "uint*", bidiLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isSideways 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getissideways
     */
    GetIsSideways(isSideways) {
        result := ComCall(38, this, "ptr", isSideways, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} deviceFontName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getdevicefontname
     */
    GetDeviceFontName(deviceFontName) {
        result := ComCall(39, this, "ptr", deviceFontName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} styleSimulations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getstylesimulations
     */
    GetStyleSimulations(styleSimulations) {
        result := ComCall(40, this, "int*", styleSimulations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} styleSimulations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setstylesimulations
     */
    SetStyleSimulations(styleSimulations) {
        result := ComCall(41, this, "int", styleSimulations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} origin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getorigin
     */
    GetOrigin(origin) {
        result := ComCall(42, this, "ptr", origin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XPS_POINT>} origin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setorigin
     */
    SetOrigin(origin) {
        result := ComCall(43, this, "ptr", origin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} fontRenderingEmSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontrenderingemsize
     */
    GetFontRenderingEmSize(fontRenderingEmSize) {
        result := ComCall(44, this, "float*", fontRenderingEmSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fontRenderingEmSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfontrenderingemsize
     */
    SetFontRenderingEmSize(fontRenderingEmSize) {
        result := ComCall(45, this, "float", fontRenderingEmSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMFontResource>} fontResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontresource
     */
    GetFontResource(fontResource) {
        result := ComCall(46, this, "ptr*", fontResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMFontResource} fontResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfontresource
     */
    SetFontResource(fontResource) {
        result := ComCall(47, this, "ptr", fontResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fontFaceIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontfaceindex
     */
    GetFontFaceIndex(fontFaceIndex) {
        result := ComCall(48, this, "short*", fontFaceIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fontFaceIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfontfaceindex
     */
    SetFontFaceIndex(fontFaceIndex) {
        result := ComCall(49, this, "short", fontFaceIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} fillBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrush
     */
    GetFillBrush(fillBrush) {
        result := ComCall(50, this, "ptr*", fillBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMBrush>} fillBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlocal
     */
    GetFillBrushLocal(fillBrush) {
        result := ComCall(51, this, "ptr*", fillBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMBrush} fillBrush 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal
     */
    SetFillBrushLocal(fillBrush) {
        result := ComCall(52, this, "ptr", fillBrush, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlookup
     */
    GetFillBrushLookup(key) {
        result := ComCall(53, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup
     */
    SetFillBrushLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(54, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGlyphsEditor>} editor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphseditor
     */
    GetGlyphsEditor(editor) {
        result := ComCall(55, this, "ptr*", editor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGlyphs>} glyphs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-clone
     */
    Clone(glyphs) {
        result := ComCall(56, this, "ptr*", glyphs, "HRESULT")
        return result
    }
}
