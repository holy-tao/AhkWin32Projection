#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods for building a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontsetbuilder
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSetBuilder extends IUnknown{
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
     * 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     */
    AddFontFaceReference(fontFaceReference, properties, propertyCount) {
        result := ComCall(3, this, "ptr", fontFaceReference, "ptr", properties, "uint", propertyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     */
    AddFontFaceReference(fontFaceReference) {
        result := ComCall(4, this, "ptr", fontFaceReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @returns {HRESULT} 
     */
    AddFontSet(fontSet) {
        result := ComCall(5, this, "ptr", fontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @returns {HRESULT} 
     */
    CreateFontSet(fontSet) {
        result := ComCall(6, this, "ptr", fontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
