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
     * 
     * @param {Pointer<IDWriteFontFile>} fontFile 
     * @returns {HRESULT} 
     */
    AddFontFile(fontFile) {
        result := ComCall(7, this, "ptr", fontFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
