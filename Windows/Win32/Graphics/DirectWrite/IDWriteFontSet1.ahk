#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet.ahk

/**
 * Represents a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontset1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet1 extends IDWriteFontSet{
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
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} fontProperty 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<IDWriteFontSet1>} matchingFonts 
     * @returns {HRESULT} 
     */
    GetMatchingFonts(fontProperty, fontAxisValues, fontAxisValueCount, matchingFonts) {
        result := ComCall(13, this, "ptr", fontProperty, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr", matchingFonts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSet1>} filteredFontSet 
     * @returns {HRESULT} 
     */
    GetFirstFontResources(filteredFontSet) {
        result := ComCall(14, this, "ptr", filteredFontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} indices 
     * @param {Integer} indexCount 
     * @param {Pointer<IDWriteFontSet1>} filteredFontSet 
     * @returns {HRESULT} 
     */
    GetFilteredFonts(indices, indexCount, filteredFontSet) {
        result := ComCall(15, this, "uint*", indices, "uint", indexCount, "ptr", filteredFontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {BOOL} selectAnyRange 
     * @param {Pointer<IDWriteFontSet1>} filteredFontSet 
     * @returns {HRESULT} 
     */
    GetFilteredFonts(fontAxisRanges, fontAxisRangeCount, selectAnyRange, filteredFontSet) {
        result := ComCall(16, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "int", selectAnyRange, "ptr", filteredFontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @param {BOOL} selectAnyProperty 
     * @param {Pointer<IDWriteFontSet1>} filteredFontSet 
     * @returns {HRESULT} 
     */
    GetFilteredFonts(properties, propertyCount, selectAnyProperty, filteredFontSet) {
        result := ComCall(17, this, "ptr", properties, "uint", propertyCount, "int", selectAnyProperty, "ptr", filteredFontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {BOOL} selectAnyRange 
     * @param {Pointer<UInt32>} indices 
     * @param {Integer} maxIndexCount 
     * @param {Pointer<UInt32>} actualIndexCount 
     * @returns {HRESULT} 
     */
    GetFilteredFontIndices(fontAxisRanges, fontAxisRangeCount, selectAnyRange, indices, maxIndexCount, actualIndexCount) {
        result := ComCall(18, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "int", selectAnyRange, "uint*", indices, "uint", maxIndexCount, "uint*", actualIndexCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @param {BOOL} selectAnyProperty 
     * @param {Pointer<UInt32>} indices 
     * @param {Integer} maxIndexCount 
     * @param {Pointer<UInt32>} actualIndexCount 
     * @returns {HRESULT} 
     */
    GetFilteredFontIndices(properties, propertyCount, selectAnyProperty, indices, maxIndexCount, actualIndexCount) {
        result := ComCall(19, this, "ptr", properties, "uint", propertyCount, "int", selectAnyProperty, "uint*", indices, "uint", maxIndexCount, "uint*", actualIndexCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} maxFontAxisRangeCount 
     * @param {Pointer<UInt32>} actualFontAxisRangeCount 
     * @returns {HRESULT} 
     */
    GetFontAxisRanges(listIndex, fontAxisRanges, maxFontAxisRangeCount, actualFontAxisRangeCount) {
        result := ComCall(20, this, "uint", listIndex, "ptr", fontAxisRanges, "uint", maxFontAxisRangeCount, "uint*", actualFontAxisRangeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} maxFontAxisRangeCount 
     * @param {Pointer<UInt32>} actualFontAxisRangeCount 
     * @returns {HRESULT} 
     */
    GetFontAxisRanges(fontAxisRanges, maxFontAxisRangeCount, actualFontAxisRangeCount) {
        result := ComCall(21, this, "ptr", fontAxisRanges, "uint", maxFontAxisRangeCount, "uint*", actualFontAxisRangeCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFontFaceReference1>} fontFaceReference 
     * @returns {HRESULT} 
     */
    GetFontFaceReference(listIndex, fontFaceReference) {
        result := ComCall(22, this, "uint", listIndex, "ptr", fontFaceReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFontResource>} fontResource 
     * @returns {HRESULT} 
     */
    CreateFontResource(listIndex, fontResource) {
        result := ComCall(23, this, "uint", listIndex, "ptr", fontResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFontFace5>} fontFace 
     * @returns {HRESULT} 
     */
    CreateFontFace(listIndex, fontFace) {
        result := ComCall(24, this, "uint", listIndex, "ptr", fontFace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {Integer} 
     */
    GetFontLocality(listIndex) {
        result := ComCall(25, this, "uint", listIndex, "int")
        return result
    }
}
