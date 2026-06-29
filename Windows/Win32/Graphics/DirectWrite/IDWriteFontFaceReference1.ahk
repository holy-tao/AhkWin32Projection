#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFaceReference.ahk" { IDWriteFontFaceReference }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontFace5.ahk" { IDWriteFontFace5 }

/**
 * Represents a reference to a font face. A uniquely identifying reference to a font, from which you can create a font face to query font metrics and use for rendering.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFaceReference1 extends IDWriteFontFaceReference {
    /**
     * The interface identifier for IDWriteFontFaceReference1
     * @type {Guid}
     */
    static IID := Guid("{c081fe77-2fd1-41ac-a5a3-34983c4ba61a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFaceReference1 interfaces
    */
    struct Vtbl extends IDWriteFontFaceReference.Vtbl {
        CreateFontFace        : IntPtr
        GetFontAxisValueCount : IntPtr
        GetFontAxisValues     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFaceReference1.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(18, this, UInt32)
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
        result := ComCall(19, this, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return fontAxisValues
    }

    Query(iid) {
        if (IDWriteFontFaceReference1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFontFace := CallbackCreate(GetMethod(implObj, "CreateFontFace"), flags, 2)
        this.vtbl.GetFontAxisValueCount := CallbackCreate(GetMethod(implObj, "GetFontAxisValueCount"), flags, 1)
        this.vtbl.GetFontAxisValues := CallbackCreate(GetMethod(implObj, "GetFontAxisValues"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFontFace)
        CallbackFree(this.vtbl.GetFontAxisValueCount)
        CallbackFree(this.vtbl.GetFontAxisValues)
    }
}
