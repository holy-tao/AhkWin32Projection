#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods for building a font set. (IDWriteFontSetBuilder)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritefontsetbuilder
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
     * Adds a reference to a font to the set being built.
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @param {Pointer<DWRITE_FONT_PROPERTY>} properties_ 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectWrite/idwritefontsetbuilder-addfontfacereference-overload
     */
    AddFontFaceReference(fontFaceReference, properties_, propertyCount) {
        result := ComCall(3, this, "ptr", fontFaceReference, "ptr", properties_, "uint", propertyCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a reference to a font to the set being built.
     * @param {IDWriteFontFaceReference} fontFaceReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectWrite/idwritefontsetbuilder-addfontfacereference-overload
     */
    AddFontFaceReference1(fontFaceReference) {
        result := ComCall(4, this, "ptr", fontFaceReference, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Appends an existing font set to the one being built, allowing one to aggregate two sets or to essentially extend an existing one.
     * @param {IDWriteFontSet} fontSet Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>*</b>
     * 
     * Font set to append font face references from.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-addfontset
     */
    AddFontSet(fontSet) {
        result := ComCall(5, this, "ptr", fontSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a font set from all the font face references added so far with AddFontFaceReference.
     * @remarks
     * Creating a font set takes less time if the references were added with metadata rather than needing to extract the metadata from the
     *       font file.
     * @returns {Pointer<IDWriteFontSet>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * Contains the newly created font set object, or nullptr in case of failure.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontsetbuilder-createfontset
     */
    CreateFontSet() {
        result := ComCall(6, this, "ptr*", &fontSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontSet
    }
}
