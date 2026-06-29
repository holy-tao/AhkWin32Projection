#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ID2D1SvgAttribute.ahk" { ID2D1SvgAttribute }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import ".\D2D1_SVG_PAINT_TYPE.ahk" { D2D1_SVG_PAINT_TYPE }

/**
 * Interface describing an SVG fill or stroke value.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nn-d2d1svg-id2d1svgpaint
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgPaint extends ID2D1SvgAttribute {
    /**
     * The interface identifier for ID2D1SvgPaint
     * @type {Guid}
     */
    static IID := Guid("{d59bab0a-68a2-455b-a5dc-9eb2854e2490}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgPaint interfaces
    */
    struct Vtbl extends ID2D1SvgAttribute.Vtbl {
        SetPaintType : IntPtr
        GetPaintType : IntPtr
        SetColor     : IntPtr
        GetColor     : IntPtr
        SetId        : IntPtr
        GetId        : IntPtr
        GetIdLength  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgPaint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the paint type.
     * @param {D2D1_SVG_PAINT_TYPE} paintType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_paint_type">D2D1_SVG_PAINT_TYPE</a></b>
     * 
     * The new paint type.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpaint-setpainttype
     */
    SetPaintType(paintType) {
        result := ComCall(6, this, D2D1_SVG_PAINT_TYPE, paintType, "HRESULT")
        return result
    }

    /**
     * Gets the paint type.
     * @returns {D2D1_SVG_PAINT_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1svg/ne-d2d1svg-d2d1_svg_paint_type">D2D1_SVG_PAINT_TYPE</a></b>
     * 
     * Returns the paint type.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpaint-getpainttype
     */
    GetPaintType() {
        result := ComCall(7, this, D2D1_SVG_PAINT_TYPE)
        return result
    }

    /**
     * Sets the paint color that is used if the paint type is D2D1\_SVG\_PAINT\_TYPE\_COLOR.
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgpaint-setcolor-overload
     */
    SetColor(_color) {
        result := ComCall(8, this, D2D1_COLOR_F.Ptr, _color, "HRESULT")
        return result
    }

    /**
     * Gets the paint color that is used if the paint type is D2D1_SVG_PAINT_TYPE_COLOR.
     * @param {Pointer<D2D1_COLOR_F>} _color Type: <b>D2D1_COLOR_F*</b>
     * 
     * The paint color that is used if the paint type is D2D1_SVG_PAINT_TYPE_COLOR.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpaint-getcolor
     */
    GetColor(_color) {
        ComCall(9, this, D2D1_COLOR_F.Ptr, _color)
    }

    /**
     * Sets the element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @param {PWSTR} id Type: <b>PCWSTR</b>
     * 
     * The element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpaint-setid
     */
    SetId(id) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(10, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * Gets the element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @param {PWSTR} id Type: <b>PWSTR</b>
     * 
     * The element id which acts as the paint server.
     * @param {Integer} idCount Type: <b>UINT32</b>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpaint-getid
     */
    GetId(id, idCount) {
        id := id is String ? StrPtr(id) : id

        result := ComCall(11, this, "ptr", id, "uint", idCount, "HRESULT")
        return result
    }

    /**
     * Gets the string length of the element id which acts as the paint server. This id is used if the paint type is D2D1_SVG_PAINT_TYPE_URI.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * the string length of the element id which acts as the paint server. The returned string length does not include room for the null terminator.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpaint-getidlength
     */
    GetIdLength() {
        result := ComCall(12, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID2D1SvgPaint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPaintType := CallbackCreate(GetMethod(implObj, "SetPaintType"), flags, 2)
        this.vtbl.GetPaintType := CallbackCreate(GetMethod(implObj, "GetPaintType"), flags, 1)
        this.vtbl.SetColor := CallbackCreate(GetMethod(implObj, "SetColor"), flags, 2)
        this.vtbl.GetColor := CallbackCreate(GetMethod(implObj, "GetColor"), flags, 2)
        this.vtbl.SetId := CallbackCreate(GetMethod(implObj, "SetId"), flags, 2)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 3)
        this.vtbl.GetIdLength := CallbackCreate(GetMethod(implObj, "GetIdLength"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPaintType)
        CallbackFree(this.vtbl.GetPaintType)
        CallbackFree(this.vtbl.SetColor)
        CallbackFree(this.vtbl.GetColor)
        CallbackFree(this.vtbl.SetId)
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetIdLength)
    }
}
