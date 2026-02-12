#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_FONT_AXIS_VALUE.ahk
#Include .\IDWriteTextFormat2.ahk

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information. (IDWriteTextFormat3)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritetextformat3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextFormat3 extends IDWriteTextFormat2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextFormat3
     * @type {Guid}
     */
    static IID => Guid("{6d3b5641-e550-430d-a85b-b7bf48a93427}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFontAxisValues", "GetFontAxisValueCount", "GetFontAxisValues", "GetAutomaticFontAxes", "SetAutomaticFontAxes"]

    /**
     * Sets values for the font axes of the format.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritetextformat3-setfontaxisvalues
     */
    SetFontAxisValues(fontAxisValues, fontAxisValueCount) {
        result := ComCall(38, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the number of axes set on the format.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axes set on the format.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritetextformat3-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(39, this, "uint")
        return result
    }

    /**
     * Retrieves the list of font axis values on the format.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of font axis values to write into the memory block pointed to by `fontAxisValues`.
     * @returns {DWRITE_FONT_AXIS_VALUE} Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md)\***
     * 
     * A pointer to an array of **DWRITE_FONT_AXIS_VALUE** structures into which **GetFontAxisValues** writes the list of font axis values. You're responsible for managing the size and the lifetime of this array. Call [GetFontAxisValueCount](./nf-dwrite_3-idwritetextformat3-getfontaxisvaluecount.md) to determine the size of array to allocate.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritetextformat3-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(40, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontAxisValues
    }

    /**
     * Retrieves the automatic axis options.
     * @returns {Integer} Type: **[DWRITE_AUTOMATIC_FONT_AXES](./ne-dwrite_3-dwrite_automatic_font_axes.md)**
     * 
     * Automatic axis options.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritetextformat3-getautomaticfontaxes
     */
    GetAutomaticFontAxes() {
        result := ComCall(41, this, "int")
        return result
    }

    /**
     * Sets the automatic font axis options.
     * @param {Integer} automaticFontAxes Type: **[DWRITE_AUTOMATIC_FONT_AXES](./ne-dwrite_3-dwrite_automatic_font_axes.md)**
     * 
     * Automatic font axis options.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritetextformat3-setautomaticfontaxes
     */
    SetAutomaticFontAxes(automaticFontAxes) {
        result := ComCall(42, this, "int", automaticFontAxes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
