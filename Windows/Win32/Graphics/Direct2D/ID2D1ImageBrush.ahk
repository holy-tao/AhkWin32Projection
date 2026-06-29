#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Image.ahk" { ID2D1Image }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\D2D1_INTERPOLATION_MODE.ahk" { D2D1_INTERPOLATION_MODE }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }

/**
 * Represents a brush based on an ID2D1Image.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1imagebrush
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ImageBrush extends ID2D1Brush {
    /**
     * The interface identifier for ID2D1ImageBrush
     * @type {Guid}
     */
    static IID := Guid("{fe9e984d-3f95-407c-b5db-cb94d4e8f87c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ImageBrush interfaces
    */
    struct Vtbl extends ID2D1Brush.Vtbl {
        SetImage             : IntPtr
        SetExtendModeX       : IntPtr
        SetExtendModeY       : IntPtr
        SetInterpolationMode : IntPtr
        SetSourceRectangle   : IntPtr
        GetImage             : IntPtr
        GetExtendModeX       : IntPtr
        GetExtendModeY       : IntPtr
        GetInterpolationMode : IntPtr
        GetSourceRectangle   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ImageBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the image associated with the provided image brush.
     * @param {ID2D1Image} _image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The image to be associated with the image brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setimage
     */
    SetImage(_image) {
        ComCall(8, this, "ptr", _image)
    }

    /**
     * Sets how the content inside the source rectangle in the image brush will be extended on the x-axis.
     * @param {D2D1_EXTEND_MODE} extendModeX Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode on the x-axis of the image.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setextendmodex
     */
    SetExtendModeX(extendModeX) {
        ComCall(9, this, D2D1_EXTEND_MODE, extendModeX)
    }

    /**
     * Sets the extend mode on the y-axis.
     * @param {D2D1_EXTEND_MODE} extendModeY Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode on the y-axis of the image.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setextendmodey
     */
    SetExtendModeY(extendModeY) {
        ComCall(10, this, D2D1_EXTEND_MODE, extendModeY)
    }

    /**
     * Sets the interpolation mode for the image brush.
     * @param {D2D1_INTERPOLATION_MODE} _interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * How the contents of the image will be interpolated to handle the brush transform.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setinterpolationmode
     */
    SetInterpolationMode(_interpolationMode) {
        ComCall(11, this, D2D1_INTERPOLATION_MODE, _interpolationMode)
    }

    /**
     * Sets the source rectangle in the image brush.
     * @remarks
     * The top left corner of the <i>sourceRectangle</i> parameter maps to the brush space origin. That is, if the  brush and world transforms are both identity, the portion of the image in the top left corner of the source rectangle will be rendered at (0,0) in the render target.
     * 
     * The source rectangle will be expanded differently depending on whether the input image is based on   pixels (a bitmap or effect) or by a command list.
     * 
     * 
     * 
     * <ul>
     * <li>If the input image is a bitmap or an effect, the rectangle will be expanded to encapsulate a full input pixel before being additionally down-scaled to ensure that the projected rectangle will be correct in the final scene-space.</li>
     * <li>If the input image is a command list, the command list will be slightly expanded to encapsulate a full input pixel.
     * </li>
     * </ul>
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The source rectangle that defines the portion of the image to tile.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-setsourcerectangle
     */
    SetSourceRectangle(sourceRectangle) {
        ComCall(12, this, D2D_RECT_F.Ptr, sourceRectangle)
    }

    /**
     * Gets the image associated with the image brush.
     * @param {Pointer<ID2D1Image>} _image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the image associated with  this brush.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getimage
     */
    GetImage(_image) {
        ComCall(13, this, ID2D1Image.Ptr, _image)
    }

    /**
     * Gets the extend mode of the image brush on the x-axis.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the x-extend mode.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getextendmodex
     */
    GetExtendModeX() {
        result := ComCall(14, this, D2D1_EXTEND_MODE)
        return result
    }

    /**
     * Gets the extend mode of the image brush on the y-axis of the image.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * This method returns the  y-extend mode.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getextendmodey
     */
    GetExtendModeY() {
        result := ComCall(15, this, D2D1_EXTEND_MODE)
        return result
    }

    /**
     * Gets the interpolation mode of the image brush.
     * @returns {D2D1_INTERPOLATION_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * This method returns the  interpolation mode.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getinterpolationmode
     */
    GetInterpolationMode() {
        result := ComCall(16, this, D2D1_INTERPOLATION_MODE)
        return result
    }

    /**
     * Gets the rectangle that will be used as the bounds of the image when drawn as an image brush.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * When this method returns, contains the address of the output source rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1imagebrush-getsourcerectangle
     */
    GetSourceRectangle(sourceRectangle) {
        ComCall(17, this, D2D_RECT_F.Ptr, sourceRectangle)
    }

    Query(iid) {
        if (ID2D1ImageBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetImage := CallbackCreate(GetMethod(implObj, "SetImage"), flags, 2)
        this.vtbl.SetExtendModeX := CallbackCreate(GetMethod(implObj, "SetExtendModeX"), flags, 2)
        this.vtbl.SetExtendModeY := CallbackCreate(GetMethod(implObj, "SetExtendModeY"), flags, 2)
        this.vtbl.SetInterpolationMode := CallbackCreate(GetMethod(implObj, "SetInterpolationMode"), flags, 2)
        this.vtbl.SetSourceRectangle := CallbackCreate(GetMethod(implObj, "SetSourceRectangle"), flags, 2)
        this.vtbl.GetImage := CallbackCreate(GetMethod(implObj, "GetImage"), flags, 2)
        this.vtbl.GetExtendModeX := CallbackCreate(GetMethod(implObj, "GetExtendModeX"), flags, 1)
        this.vtbl.GetExtendModeY := CallbackCreate(GetMethod(implObj, "GetExtendModeY"), flags, 1)
        this.vtbl.GetInterpolationMode := CallbackCreate(GetMethod(implObj, "GetInterpolationMode"), flags, 1)
        this.vtbl.GetSourceRectangle := CallbackCreate(GetMethod(implObj, "GetSourceRectangle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetImage)
        CallbackFree(this.vtbl.SetExtendModeX)
        CallbackFree(this.vtbl.SetExtendModeY)
        CallbackFree(this.vtbl.SetInterpolationMode)
        CallbackFree(this.vtbl.SetSourceRectangle)
        CallbackFree(this.vtbl.GetImage)
        CallbackFree(this.vtbl.GetExtendModeX)
        CallbackFree(this.vtbl.GetExtendModeY)
        CallbackFree(this.vtbl.GetInterpolationMode)
        CallbackFree(this.vtbl.GetSourceRectangle)
    }
}
