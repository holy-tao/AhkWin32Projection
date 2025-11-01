#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily1.ahk

/**
 * Represents a family of related fonts. **IDWriteFontFamily2** adds new facilities, including retrieving fonts by font axis values.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontfamily2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFamily2 extends IDWriteFontFamily1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFamily2
     * @type {Guid}
     */
    static IID => Guid("{3ed49e77-a398-4261-b9cf-c126c2131ef3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMatchingFonts", "GetFontSet"]

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<IDWriteFontList2>} matchingFonts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily2-getmatchingfonts
     */
    GetMatchingFonts(fontAxisValues, fontAxisValueCount, matchingFonts) {
        result := ComCall(12, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", matchingFonts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSet1>} fontSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfamily2-getfontset
     */
    GetFontSet(fontSet) {
        result := ComCall(13, this, "ptr*", fontSet, "HRESULT")
        return result
    }
}
