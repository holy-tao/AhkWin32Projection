#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_FONT_AXIS_VALUE.ahk
#Include .\IDWriteFontResource.ahk
#Include .\IDWriteFontFace4.ahk

/**
 * Contains font face type, appropriate file references, and face identification data. (IDWriteFontFace5)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritefontface5
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace5 extends IDWriteFontFace4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace5
     * @type {Guid}
     */
    static IID => Guid("{98eff3a5-b667-479a-b145-e2fa5b9fdc29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 53

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontAxisValueCount", "GetFontAxisValues", "HasVariations", "GetFontResource", "Equals"]

    /**
     * Retrieves the number of axes defined by the font. This includes both static and variable axes.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axes defined by the font face.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontface5-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(53, this, "uint")
        return result
    }

    /**
     * Retrieves the list of axis values used by the font.
     * @remarks
     * The values are returned in the canonical order defined by the font, clamped to the actual range supported. It's not necessarily the same axis value array that you passed to **CreateFontFace**.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of font axis values to write into the memory block pointed to by `fontAxisValues`.
     * @returns {DWRITE_FONT_AXIS_VALUE} Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md)\***
     * 
     * A pointer to an array of **DWRITE_FONT_AXIS_VALUE** structures into which **GetFontAxisValues** writes the list of font axis values. You're responsible for managing the size and the lifetime of this array. Call [GetFontAxisValueCount](./nf-dwrite_3-idwritefontface5-getfontaxisvaluecount.md) to determine the size of array to allocate.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontface5-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(54, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontAxisValues
    }

    /**
     * Determines whether this font face's resource supports any variable axes. (IDWriteFontFace5::HasVariations)
     * @returns {BOOL} Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if the font face's resource supports any variable axes. Otherwise, `false`.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontface5-hasvariations
     */
    HasVariations() {
        result := ComCall(55, this, "int")
        return result
    }

    /**
     * Retrieves the underlying font resource for this font face.
     * @returns {Pointer<IDWriteFontResource>} Type: **[IDWriteFontResource](./nn-dwrite_3-idwritefontresource.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontResource](./nn-dwrite_3-idwritefontresource.md) interface. On successful completion, the function sets the pointer to a newly created font resource object.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontface5-getfontresource
     */
    GetFontResource() {
        result := ComCall(56, this, "ptr*", &fontResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontResource
    }

    /**
     * Performs an equality comparison between the font face object on which **Equals** is being called and the font face object passed as a parameter.
     * @param {IDWriteFontFace} fontFace Type: **[IDWriteFontFace](../dwrite/nn-dwrite-idwritefontface.md)\***
     * 
     * A pointer to a font face object to compare with the font face object on which **Equals** is being called.
     * @returns {BOOL} Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if the font face objects are equal. Otherwise, `false`.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontface5-equals
     */
    Equals(fontFace) {
        result := ComCall(57, this, "ptr", fontFace, "int")
        return result
    }
}
