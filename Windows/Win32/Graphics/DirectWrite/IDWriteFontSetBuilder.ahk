#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods for building a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontsetbuilder
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSetBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSetBuilder
     * @type {Guid}
     */
    static IID => Guid("{2f642afe-9c68-4f40-b8be-457401afcb3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFontFaceReference", "AddFontFaceReference1", "AddFontSet", "CreateFontSet"]

    /**
     * 
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontfacereference(idwritefontfacereference)
     */
    AddFontFaceReference(fontFaceReference, properties, propertyCount) {
        result := ComCall(3, this, "ptr", fontFaceReference, "ptr", properties, "uint", propertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontfacereference(idwritefontfacereference)
     */
    AddFontFaceReference1(fontFaceReference) {
        result := ComCall(4, this, "ptr", fontFaceReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFontSet} fontSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontset
     */
    AddFontSet(fontSet) {
        result := ComCall(5, this, "ptr", fontSet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDWriteFontSet} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-createfontset
     */
    CreateFontSet() {
        result := ComCall(6, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }
}
