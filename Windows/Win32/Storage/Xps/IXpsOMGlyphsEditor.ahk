#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_GLYPH_INDEX.ahk
#Include .\XPS_GLYPH_MAPPING.ahk
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getunicodestring
     */
    GetUnicodeString() {
        result := ComCall(4, this, "ptr*", &unicodeString := 0, "HRESULT")
        return unicodeString
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphindexcount
     */
    GetGlyphIndexCount() {
        result := ComCall(6, this, "uint*", &indexCount := 0, "HRESULT")
        return indexCount
    }

    /**
     * 
     * @param {Pointer<Integer>} indexCount 
     * @returns {XPS_GLYPH_INDEX} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphindices
     */
    GetGlyphIndices(indexCount) {
        indexCountMarshal := indexCount is VarRef ? "uint*" : "ptr"

        glyphIndices := XPS_GLYPH_INDEX()
        result := ComCall(7, this, indexCountMarshal, indexCount, "ptr", glyphIndices, "HRESULT")
        return glyphIndices
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphmappingcount
     */
    GetGlyphMappingCount() {
        result := ComCall(9, this, "uint*", &glyphMappingCount := 0, "HRESULT")
        return glyphMappingCount
    }

    /**
     * 
     * @param {Pointer<Integer>} glyphMappingCount 
     * @returns {XPS_GLYPH_MAPPING} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphmappings
     */
    GetGlyphMappings(glyphMappingCount) {
        glyphMappingCountMarshal := glyphMappingCount is VarRef ? "uint*" : "ptr"

        glyphMappings := XPS_GLYPH_MAPPING()
        result := ComCall(10, this, glyphMappingCountMarshal, glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return glyphMappings
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getprohibitedcaretstopcount
     */
    GetProhibitedCaretStopCount() {
        result := ComCall(12, this, "uint*", &prohibitedCaretStopCount := 0, "HRESULT")
        return prohibitedCaretStopCount
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getprohibitedcaretstops
     */
    GetProhibitedCaretStops(count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, countMarshal, count, "uint*", &prohibitedCaretStops := 0, "HRESULT")
        return prohibitedCaretStops
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getbidilevel
     */
    GetBidiLevel() {
        result := ComCall(15, this, "uint*", &bidiLevel := 0, "HRESULT")
        return bidiLevel
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getissideways
     */
    GetIsSideways() {
        result := ComCall(17, this, "int*", &isSideways := 0, "HRESULT")
        return isSideways
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getdevicefontname
     */
    GetDeviceFontName() {
        result := ComCall(19, this, "ptr*", &deviceFontName := 0, "HRESULT")
        return deviceFontName
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
