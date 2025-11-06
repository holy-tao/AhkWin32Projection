#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFile.ahk
#Include .\DWRITE_FONT_AXIS_VALUE.ahk
#Include .\DWRITE_FONT_AXIS_RANGE.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include .\IDWriteFontFace5.ahk
#Include .\IDWriteFontFaceReference1.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides axis information for a font resource, and is used to create specific font face instances.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontresource
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontResource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontResource
     * @type {Guid}
     */
    static IID => Guid("{1f803a76-6871-48e8-987f-b975551c50f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFile", "GetFontFaceIndex", "GetFontAxisCount", "GetDefaultFontAxisValues", "GetFontAxisRanges", "GetFontAxisAttributes", "GetAxisNames", "GetAxisValueNameCount", "GetAxisValueNames", "HasVariations", "CreateFontFace", "CreateFontFaceReference"]

    /**
     * 
     * @returns {IDWriteFontFile} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontfile
     */
    GetFontFile() {
        result := ComCall(3, this, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxiscount
     */
    GetFontAxisCount() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} fontAxisValueCount 
     * @returns {DWRITE_FONT_AXIS_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getdefaultfontaxisvalues
     */
    GetDefaultFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(6, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return fontAxisValues
    }

    /**
     * 
     * @param {Integer} fontAxisRangeCount 
     * @returns {DWRITE_FONT_AXIS_RANGE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxisranges
     */
    GetFontAxisRanges(fontAxisRangeCount) {
        fontAxisRanges := DWRITE_FONT_AXIS_RANGE()
        result := ComCall(7, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "HRESULT")
        return fontAxisRanges
    }

    /**
     * 
     * @param {Integer} axisIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxisattributes
     */
    GetFontAxisAttributes(axisIndex) {
        result := ComCall(8, this, "uint", axisIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} axisIndex 
     * @returns {IDWriteLocalizedStrings} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getaxisnames
     */
    GetAxisNames(axisIndex) {
        result := ComCall(9, this, "uint", axisIndex, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * 
     * @param {Integer} axisIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getaxisvaluenamecount
     */
    GetAxisValueNameCount(axisIndex) {
        result := ComCall(10, this, "uint", axisIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} axisIndex 
     * @param {Integer} axisValueIndex 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRange 
     * @param {Pointer<IDWriteLocalizedStrings>} names 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getaxisvaluenames
     */
    GetAxisValueNames(axisIndex, axisValueIndex, fontAxisRange, names) {
        result := ComCall(11, this, "uint", axisIndex, "uint", axisValueIndex, "ptr", fontAxisRange, "ptr*", names, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-hasvariations
     */
    HasVariations() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} fontSimulations 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {IDWriteFontFace5} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-createfontface
     */
    CreateFontFace(fontSimulations, fontAxisValues, fontAxisValueCount) {
        result := ComCall(13, this, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace5(fontFace)
    }

    /**
     * 
     * @param {Integer} fontSimulations 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {IDWriteFontFaceReference1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-createfontfacereference
     */
    CreateFontFaceReference(fontSimulations, fontAxisValues, fontAxisValueCount) {
        result := ComCall(14, this, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference1(fontFaceReference)
    }
}
