#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace5.ahk
#Include .\DWRITE_FONT_AXIS_VALUE.ahk
#Include .\IDWriteFontFaceReference.ahk

/**
 * Represents a reference to a font face. A uniquely identifying reference to a font, from which you can create a font face to query font metrics and use for rendering.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference1
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
     * Uses the reference to create a font face, for use with layout, shaping, or rendering.
     * @returns {IDWriteFontFace5} Type: **[IDWriteFontFace5](./nn-dwrite_3-idwritefontface5.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFace5](./nn-dwrite_3-idwritefontface5.md) interface. On successful completion, the function sets the pointer to a newly created font face object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference1-createfontface
     */
    CreateFontFace() {
        result := ComCall(17, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace5(fontFace)
    }

    /**
     * Retrieves the number of axes specified by the reference.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axes defined by the font face.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference1-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(18, this, "uint")
        return result
    }

    /**
     * Retrieves the list of font axis values specified by the reference.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of font axis values to write into the memory block pointed to by `fontAxisValues`.
     * @returns {DWRITE_FONT_AXIS_VALUE} Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md)\***
     * 
     * A pointer to an array of **DWRITE_FONT_AXIS_VALUE** structures into which **GetFontAxisValues** writes the list of font axis values. You're responsible for managing the size and the lifetime of this array. Call [GetFontAxisValueCount](./nf-dwrite_3-idwritefontfacereference1-getfontaxisvaluecount.md) to determine the size of array to allocate.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontfacereference1-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(19, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return fontAxisValues
    }
}
