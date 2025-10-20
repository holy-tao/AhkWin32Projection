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
     * 
     * @returns {HRESULT} 
     */
    ApplyEdits() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} unicodeString 
     * @returns {HRESULT} 
     */
    GetUnicodeString(unicodeString) {
        result := ComCall(4, this, "ptr", unicodeString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} unicodeString 
     * @returns {HRESULT} 
     */
    SetUnicodeString(unicodeString) {
        unicodeString := unicodeString is String ? StrPtr(unicodeString) : unicodeString

        result := ComCall(5, this, "ptr", unicodeString, "int")
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
        result := ComCall(6, this, "uint*", indexCount, "int")
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
        result := ComCall(7, this, "uint*", indexCount, "ptr", glyphIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} indexCount 
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices 
     * @returns {HRESULT} 
     */
    SetGlyphIndices(indexCount, glyphIndices) {
        result := ComCall(8, this, "uint", indexCount, "ptr", glyphIndices, "int")
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
        result := ComCall(9, this, "uint*", glyphMappingCount, "int")
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
        result := ComCall(10, this, "uint*", glyphMappingCount, "ptr", glyphMappings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} glyphMappingCount 
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings 
     * @returns {HRESULT} 
     */
    SetGlyphMappings(glyphMappingCount, glyphMappings) {
        result := ComCall(11, this, "uint", glyphMappingCount, "ptr", glyphMappings, "int")
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
        result := ComCall(12, this, "uint*", prohibitedCaretStopCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @param {Pointer<UInt32>} prohibitedCaretStops 
     * @returns {HRESULT} 
     */
    GetProhibitedCaretStops(count, prohibitedCaretStops) {
        result := ComCall(13, this, "uint*", count, "uint*", prohibitedCaretStops, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<UInt32>} prohibitedCaretStops 
     * @returns {HRESULT} 
     */
    SetProhibitedCaretStops(count, prohibitedCaretStops) {
        result := ComCall(14, this, "uint", count, "uint*", prohibitedCaretStops, "int")
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
        result := ComCall(15, this, "uint*", bidiLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bidiLevel 
     * @returns {HRESULT} 
     */
    SetBidiLevel(bidiLevel) {
        result := ComCall(16, this, "uint", bidiLevel, "int")
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
        result := ComCall(17, this, "ptr", isSideways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isSideways 
     * @returns {HRESULT} 
     */
    SetIsSideways(isSideways) {
        result := ComCall(18, this, "int", isSideways, "int")
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
        result := ComCall(19, this, "ptr", deviceFontName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} deviceFontName 
     * @returns {HRESULT} 
     */
    SetDeviceFontName(deviceFontName) {
        deviceFontName := deviceFontName is String ? StrPtr(deviceFontName) : deviceFontName

        result := ComCall(20, this, "ptr", deviceFontName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
