#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace5.ahk
#Include .\DWRITE_FONT_FAMILY_MODEL.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class IDWriteFontFace6 extends IDWriteFontFace5 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace6
     * @type {Guid}
     */
    static IID => Guid("{c4b1fe1b-6e84-47d5-b54c-a597981b06ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFamilyNames", "GetFaceNames"]

    /**
     * 
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel 
     * @returns {IDWriteLocalizedStrings} 
     */
    GetFamilyNames(fontFamilyModel) {
        result := ComCall(58, this, "int", fontFamilyModel, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * 
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel 
     * @returns {IDWriteLocalizedStrings} 
     */
    GetFaceNames(fontFamilyModel) {
        result := ComCall(59, this, "int", fontFamilyModel, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }
}
