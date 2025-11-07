#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_POINT.ahk
#Include .\IXpsOMFontResource.ahk
#Include .\IXpsOMBrush.ahk
#Include .\IXpsOMGlyphsEditor.ahk
#Include .\IXpsOMGlyphs.ahk
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getunicodestring
     */
    GetUnicodeString() {
        result := ComCall(30, this, "ptr*", &unicodeString := 0, "HRESULT")
        return unicodeString
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindexcount
     */
    GetGlyphIndexCount() {
        result := ComCall(31, this, "uint*", &indexCount := 0, "HRESULT")
        return indexCount
    }

    /**
     * 
     * @param {Pointer<Integer>} indexCount 
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindices
     */
    GetGlyphIndices(indexCount, glyphIndices) {
        indexCountMarshal := indexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, indexCountMarshal, indexCount, "ptr", glyphIndices, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappingcount
     */
    GetGlyphMappingCount() {
        result := ComCall(33, this, "uint*", &glyphMappingCount := 0, "HRESULT")
        return glyphMappingCount
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphMappingCount 
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappings
     */
    GetGlyphMappings(glyphMappingCount, glyphMappings) {
        glyphMappingCountMarshal := glyphMappingCount is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, glyphMappingCountMarshal, glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstopcount
     */
    GetProhibitedCaretStopCount() {
        result := ComCall(35, this, "uint*", &prohibitedCaretStopCount := 0, "HRESULT")
        return prohibitedCaretStopCount
    }

    /**
     * 
     * @param {Pointer<Integer>} prohibitedCaretStopCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstops
     */
    GetProhibitedCaretStops(prohibitedCaretStopCount) {
        prohibitedCaretStopCountMarshal := prohibitedCaretStopCount is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, prohibitedCaretStopCountMarshal, prohibitedCaretStopCount, "uint*", &prohibitedCaretStops := 0, "HRESULT")
        return prohibitedCaretStops
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getbidilevel
     */
    GetBidiLevel() {
        result := ComCall(37, this, "uint*", &bidiLevel := 0, "HRESULT")
        return bidiLevel
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getissideways
     */
    GetIsSideways() {
        result := ComCall(38, this, "int*", &isSideways := 0, "HRESULT")
        return isSideways
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getdevicefontname
     */
    GetDeviceFontName() {
        result := ComCall(39, this, "ptr*", &deviceFontName := 0, "HRESULT")
        return deviceFontName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getstylesimulations
     */
    GetStyleSimulations() {
        result := ComCall(40, this, "int*", &styleSimulations := 0, "HRESULT")
        return styleSimulations
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
     * @returns {XPS_POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getorigin
     */
    GetOrigin() {
        origin := XPS_POINT()
        result := ComCall(42, this, "ptr", origin, "HRESULT")
        return origin
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontrenderingemsize
     */
    GetFontRenderingEmSize() {
        result := ComCall(44, this, "float*", &fontRenderingEmSize := 0, "HRESULT")
        return fontRenderingEmSize
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
     * @returns {IXpsOMFontResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontresource
     */
    GetFontResource() {
        result := ComCall(46, this, "ptr*", &fontResource := 0, "HRESULT")
        return IXpsOMFontResource(fontResource)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(48, this, "short*", &fontFaceIndex := 0, "HRESULT")
        return fontFaceIndex
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
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrush
     */
    GetFillBrush() {
        result := ComCall(50, this, "ptr*", &fillBrush := 0, "HRESULT")
        return IXpsOMBrush(fillBrush)
    }

    /**
     * 
     * @returns {IXpsOMBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlocal
     */
    GetFillBrushLocal() {
        result := ComCall(51, this, "ptr*", &fillBrush := 0, "HRESULT")
        return IXpsOMBrush(fillBrush)
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlookup
     */
    GetFillBrushLookup() {
        result := ComCall(53, this, "ptr*", &key := 0, "HRESULT")
        return key
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
     * @returns {IXpsOMGlyphsEditor} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphseditor
     */
    GetGlyphsEditor() {
        result := ComCall(55, this, "ptr*", &editor := 0, "HRESULT")
        return IXpsOMGlyphsEditor(editor)
    }

    /**
     * 
     * @returns {IXpsOMGlyphs} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-clone
     */
    Clone() {
        result := ComCall(56, this, "ptr*", &glyphs := 0, "HRESULT")
        return IXpsOMGlyphs(glyphs)
    }
}
