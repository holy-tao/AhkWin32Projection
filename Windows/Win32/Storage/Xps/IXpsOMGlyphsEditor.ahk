#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows batch modification of properties that affect the text content in an IXpsOMGlyphs interface.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphseditor
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGlyphsEditor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGlyphsEditor
     * @type {Guid}
     */
    static IID => Guid("{a5ab8616-5b16-4b9f-9629-89b323ed7909}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplyEdits", "GetUnicodeString", "SetUnicodeString", "GetGlyphIndexCount", "GetGlyphIndices", "SetGlyphIndices", "GetGlyphMappingCount", "GetGlyphMappings", "SetGlyphMappings", "GetProhibitedCaretStopCount", "GetProhibitedCaretStops", "SetProhibitedCaretStops", "GetBidiLevel", "SetBidiLevel", "GetIsSideways", "SetIsSideways", "GetDeviceFontName", "SetDeviceFontName"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-applyedits
     */
    ApplyEdits() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} unicodeString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getunicodestring
     */
    GetUnicodeString(unicodeString) {
        result := ComCall(4, this, "ptr", unicodeString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} unicodeString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setunicodestring
     */
    SetUnicodeString(unicodeString) {
        unicodeString := unicodeString is String ? StrPtr(unicodeString) : unicodeString

        result := ComCall(5, this, "ptr", unicodeString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} indexCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphindexcount
     */
    GetGlyphIndexCount(indexCount) {
        indexCountMarshal := indexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, indexCountMarshal, indexCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} indexCount 
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphindices
     */
    GetGlyphIndices(indexCount, glyphIndices) {
        indexCountMarshal := indexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, indexCountMarshal, indexCount, "ptr", glyphIndices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} indexCount 
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setglyphindices
     */
    SetGlyphIndices(indexCount, glyphIndices) {
        result := ComCall(8, this, "uint", indexCount, "ptr", glyphIndices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphMappingCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphmappingcount
     */
    GetGlyphMappingCount(glyphMappingCount) {
        glyphMappingCountMarshal := glyphMappingCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, glyphMappingCountMarshal, glyphMappingCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphMappingCount 
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphmappings
     */
    GetGlyphMappings(glyphMappingCount, glyphMappings) {
        glyphMappingCountMarshal := glyphMappingCount is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, glyphMappingCountMarshal, glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} glyphMappingCount 
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setglyphmappings
     */
    SetGlyphMappings(glyphMappingCount, glyphMappings) {
        result := ComCall(11, this, "uint", glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prohibitedCaretStopCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getprohibitedcaretstopcount
     */
    GetProhibitedCaretStopCount(prohibitedCaretStopCount) {
        prohibitedCaretStopCountMarshal := prohibitedCaretStopCount is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, prohibitedCaretStopCountMarshal, prohibitedCaretStopCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @param {Pointer<Integer>} prohibitedCaretStops 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getprohibitedcaretstops
     */
    GetProhibitedCaretStops(count, prohibitedCaretStops) {
        countMarshal := count is VarRef ? "uint*" : "ptr"
        prohibitedCaretStopsMarshal := prohibitedCaretStops is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, countMarshal, count, prohibitedCaretStopsMarshal, prohibitedCaretStops, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<Integer>} prohibitedCaretStops 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setprohibitedcaretstops
     */
    SetProhibitedCaretStops(count, prohibitedCaretStops) {
        prohibitedCaretStopsMarshal := prohibitedCaretStops is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", count, prohibitedCaretStopsMarshal, prohibitedCaretStops, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bidiLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getbidilevel
     */
    GetBidiLevel(bidiLevel) {
        bidiLevelMarshal := bidiLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, bidiLevelMarshal, bidiLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bidiLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setbidilevel
     */
    SetBidiLevel(bidiLevel) {
        result := ComCall(16, this, "uint", bidiLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isSideways 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getissideways
     */
    GetIsSideways(isSideways) {
        result := ComCall(17, this, "ptr", isSideways, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isSideways 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setissideways
     */
    SetIsSideways(isSideways) {
        result := ComCall(18, this, "int", isSideways, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} deviceFontName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getdevicefontname
     */
    GetDeviceFontName(deviceFontName) {
        result := ComCall(19, this, "ptr", deviceFontName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} deviceFontName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setdevicefontname
     */
    SetDeviceFontName(deviceFontName) {
        deviceFontName := deviceFontName is String ? StrPtr(deviceFontName) : deviceFontName

        result := ComCall(20, this, "ptr", deviceFontName, "HRESULT")
        return result
    }
}
