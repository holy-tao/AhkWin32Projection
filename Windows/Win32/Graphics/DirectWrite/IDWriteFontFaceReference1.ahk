#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFaceReference.ahk

/**
 * Represents a reference to a font face. A uniquely identifying reference to a font, from which you can create a font face to query font metrics and use for rendering.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontfacereference1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFaceReference1 extends IDWriteFontFaceReference{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFaceReference1
     * @type {Guid}
     */
    static IID => Guid("{c081fe77-2fd1-41ac-a5a3-34983c4ba61a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontFace", "GetFontAxisValueCount", "GetFontAxisValues"]

    /**
     * 
     * @param {Pointer<IDWriteFontFace5>} fontFace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference1-createfontface
     */
    CreateFontFace(fontFace) {
        result := ComCall(17, this, "ptr*", fontFace, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference1-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference1-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValues, fontAxisValueCount) {
        result := ComCall(19, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return result
    }
}
