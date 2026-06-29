#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\IDWriteTextFormat2.ahk" { IDWriteTextFormat2 }
#Import ".\DWRITE_AUTOMATIC_FONT_AXES.ahk" { DWRITE_AUTOMATIC_FONT_AXES }

/**
 * Describes the font and paragraph properties used to format text, and it describes locale information. (IDWriteTextFormat3)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritetextformat3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextFormat3 extends IDWriteTextFormat2 {
    /**
     * The interface identifier for IDWriteTextFormat3
     * @type {Guid}
     */
    static IID := Guid("{6d3b5641-e550-430d-a85b-b7bf48a93427}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextFormat3 interfaces
    */
    struct Vtbl extends IDWriteTextFormat2.Vtbl {
        SetFontAxisValues     : IntPtr
        GetFontAxisValueCount : IntPtr
        GetFontAxisValues     : IntPtr
        GetAutomaticFontAxes  : IntPtr
        SetAutomaticFontAxes  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextFormat3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-setfontaxisvalues
     */
    SetFontAxisValues(fontAxisValues, fontAxisValueCount) {
        result := ComCall(38, this, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of axes set on the format.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axes set on the format.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(39, this, UInt32)
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(40, this, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return fontAxisValues
    }

    /**
     * Retrieves the automatic axis options.
     * @returns {DWRITE_AUTOMATIC_FONT_AXES} Type: **[DWRITE_AUTOMATIC_FONT_AXES](./ne-dwrite_3-dwrite_automatic_font_axes.md)**
     * 
     * Automatic axis options.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-getautomaticfontaxes
     */
    GetAutomaticFontAxes() {
        result := ComCall(41, this, DWRITE_AUTOMATIC_FONT_AXES)
        return result
    }

    /**
     * Sets the automatic font axis options.
     * @param {DWRITE_AUTOMATIC_FONT_AXES} automaticFontAxes Type: **[DWRITE_AUTOMATIC_FONT_AXES](./ne-dwrite_3-dwrite_automatic_font_axes.md)**
     * 
     * Automatic font axis options.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-setautomaticfontaxes
     */
    SetAutomaticFontAxes(automaticFontAxes) {
        result := ComCall(42, this, DWRITE_AUTOMATIC_FONT_AXES, automaticFontAxes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextFormat3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFontAxisValues := CallbackCreate(GetMethod(implObj, "SetFontAxisValues"), flags, 3)
        this.vtbl.GetFontAxisValueCount := CallbackCreate(GetMethod(implObj, "GetFontAxisValueCount"), flags, 1)
        this.vtbl.GetFontAxisValues := CallbackCreate(GetMethod(implObj, "GetFontAxisValues"), flags, 3)
        this.vtbl.GetAutomaticFontAxes := CallbackCreate(GetMethod(implObj, "GetAutomaticFontAxes"), flags, 1)
        this.vtbl.SetAutomaticFontAxes := CallbackCreate(GetMethod(implObj, "SetAutomaticFontAxes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFontAxisValues)
        CallbackFree(this.vtbl.GetFontAxisValueCount)
        CallbackFree(this.vtbl.GetFontAxisValues)
        CallbackFree(this.vtbl.GetAutomaticFontAxes)
        CallbackFree(this.vtbl.SetAutomaticFontAxes)
    }
}
