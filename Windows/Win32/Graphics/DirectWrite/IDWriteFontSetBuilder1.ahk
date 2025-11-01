#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSetBuilder.ahk

/**
 * Contains methods for building a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontsetbuilder1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSetBuilder1 extends IDWriteFontSetBuilder{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSetBuilder1
     * @type {Guid}
     */
    static IID => Guid("{3ff7715f-3cdc-4dc6-9b72-ec5621dccafd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFontFile"]

    /**
     * 
     * @param {IDWriteFontFile} fontFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontsetbuilder1-addfontfile
     */
    AddFontFile(fontFile) {
        result := ComCall(7, this, "ptr", fontFile, "HRESULT")
        return result
    }
}
