#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet1.ahk
#Include .\IDWriteFontFaceReference1.ahk
#Include .\IDWriteFontResource.ahk
#Include .\IDWriteFontFace5.ahk
#Include .\IDWriteFontSet.ahk

/**
 * Represents a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontset1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet1 extends IDWriteFontSet{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet1
     * @type {Guid}
     */
    static IID => Guid("{7e9fda85-6c92-4053-bc47-7ae3530db4d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMatchingFonts", "GetFirstFontResources", "GetFilteredFonts", "GetFilteredFonts1", "GetFilteredFonts2", "GetFilteredFontIndices", "GetFilteredFontIndices1", "GetFontAxisRanges", "GetFontAxisRanges1", "GetFontFaceReference", "CreateFontResource", "CreateFontFace", "GetFontLocality"]

    /**
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} fontProperty 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {IDWriteFontSet1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getmatchingfonts
     */
    GetMatchingFonts(fontProperty, fontAxisValues, fontAxisValueCount) {
        result := ComCall(13, this, "ptr", fontProperty, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &matchingFonts := 0, "HRESULT")
        return IDWriteFontSet1(matchingFonts)
    }

    /**
     * 
     * @returns {IDWriteFontSet1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfirstfontresources
     */
    GetFirstFontResources() {
        result := ComCall(14, this, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * 
     * @param {Pointer<Integer>} indices 
     * @param {Integer} indexCount 
     * @returns {IDWriteFontSet1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfonts(uint32const_uint32_idwritefontset1)
     */
    GetFilteredFonts(indices, indexCount) {
        indicesMarshal := indices is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, indicesMarshal, indices, "uint", indexCount, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {BOOL} selectAnyRange 
     * @returns {IDWriteFontSet1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfonts(uint32const_uint32_idwritefontset1)
     */
    GetFilteredFonts1(fontAxisRanges, fontAxisRangeCount, selectAnyRange) {
        result := ComCall(16, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "int", selectAnyRange, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @param {BOOL} selectAnyProperty 
     * @returns {IDWriteFontSet1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfonts(uint32const_uint32_idwritefontset1)
     */
    GetFilteredFonts2(properties, propertyCount, selectAnyProperty) {
        result := ComCall(17, this, "ptr", properties, "uint", propertyCount, "int", selectAnyProperty, "ptr*", &filteredFontSet := 0, "HRESULT")
        return IDWriteFontSet1(filteredFontSet)
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {BOOL} selectAnyRange 
     * @param {Pointer<Integer>} indices 
     * @param {Integer} maxIndexCount 
     * @param {Pointer<Integer>} actualIndexCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfontindices
     */
    GetFilteredFontIndices(fontAxisRanges, fontAxisRangeCount, selectAnyRange, indices, maxIndexCount, actualIndexCount) {
        indicesMarshal := indices is VarRef ? "uint*" : "ptr"
        actualIndexCountMarshal := actualIndexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "int", selectAnyRange, indicesMarshal, indices, "uint", maxIndexCount, actualIndexCountMarshal, actualIndexCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @param {BOOL} selectAnyProperty 
     * @param {Pointer<Integer>} indices 
     * @param {Integer} maxIndexCount 
     * @param {Pointer<Integer>} actualIndexCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfilteredfontindices
     */
    GetFilteredFontIndices1(properties, propertyCount, selectAnyProperty, indices, maxIndexCount, actualIndexCount) {
        indicesMarshal := indices is VarRef ? "uint*" : "ptr"
        actualIndexCountMarshal := actualIndexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", properties, "uint", propertyCount, "int", selectAnyProperty, indicesMarshal, indices, "uint", maxIndexCount, actualIndexCountMarshal, actualIndexCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} maxFontAxisRangeCount 
     * @param {Pointer<Integer>} actualFontAxisRangeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontaxisranges
     */
    GetFontAxisRanges(listIndex, fontAxisRanges, maxFontAxisRangeCount, actualFontAxisRangeCount) {
        actualFontAxisRangeCountMarshal := actualFontAxisRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", listIndex, "ptr", fontAxisRanges, "uint", maxFontAxisRangeCount, actualFontAxisRangeCountMarshal, actualFontAxisRangeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} maxFontAxisRangeCount 
     * @param {Pointer<Integer>} actualFontAxisRangeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontaxisranges
     */
    GetFontAxisRanges1(fontAxisRanges, maxFontAxisRangeCount, actualFontAxisRangeCount) {
        actualFontAxisRangeCountMarshal := actualFontAxisRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", fontAxisRanges, "uint", maxFontAxisRangeCount, actualFontAxisRangeCountMarshal, actualFontAxisRangeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {IDWriteFontFaceReference1} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(22, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference1(fontFaceReference)
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {IDWriteFontResource} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-createfontresource
     */
    CreateFontResource(listIndex) {
        result := ComCall(23, this, "uint", listIndex, "ptr*", &fontResource := 0, "HRESULT")
        return IDWriteFontResource(fontResource)
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {IDWriteFontFace5} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-createfontface
     */
    CreateFontFace(listIndex) {
        result := ComCall(24, this, "uint", listIndex, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace5(fontFace)
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset1-getfontlocality
     */
    GetFontLocality(listIndex) {
        result := ComCall(25, this, "uint", listIndex, "int")
        return result
    }
}
