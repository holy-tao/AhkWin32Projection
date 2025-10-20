#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSetBuilder1.ahk

/**
 * Contains methods for building a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontsetbuilder2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSetBuilder2 extends IDWriteFontSetBuilder1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSetBuilder2
     * @type {Guid}
     */
    static IID => Guid("{ee5ba612-b131-463c-8f4f-3189b9401e45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFont", "AddFontFile"]

    /**
     * 
     * @param {IDWriteFontFile} fontFile 
     * @param {Integer} fontFaceIndex 
     * @param {Integer} fontSimulations 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRanges 
     * @param {Integer} fontAxisRangeCount 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder2-addfont
     */
    AddFont(fontFile, fontFaceIndex, fontSimulations, fontAxisValues, fontAxisValueCount, fontAxisRanges, fontAxisRangeCount, properties, propertyCount) {
        result := ComCall(8, this, "ptr", fontFile, "uint", fontFaceIndex, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "ptr", properties, "uint", propertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder2-addfontfile
     */
    AddFontFile(filePath) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(9, this, "ptr", filePath, "HRESULT")
        return result
    }
}
