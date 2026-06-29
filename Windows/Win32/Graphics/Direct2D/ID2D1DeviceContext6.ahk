#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Image.ahk" { ID2D1Image }
#Import ".\ID2D1DeviceContext5.ahk" { ID2D1DeviceContext5 }
#Import ".\D2D1_INTERPOLATION_MODE.ahk" { D2D1_INTERPOLATION_MODE }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import "Common\D2D1_BLEND_MODE.ahk" { D2D1_BLEND_MODE }

/**
 * This interface performs all the same functions as the existing ID2D1DeviceContext5 interface, plus it enables access to the BlendImage method.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1devicecontext6
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DeviceContext6 extends ID2D1DeviceContext5 {
    /**
     * The interface identifier for ID2D1DeviceContext6
     * @type {Guid}
     */
    static IID := Guid("{985f7e37-4ed0-4a19-98a3-15b0edfde306}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DeviceContext6 interfaces
    */
    struct Vtbl extends ID2D1DeviceContext5.Vtbl {
        BlendImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DeviceContext6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Draws an image to the device context using the specified blend mode. Results are equivalent to using Direct2D's built-in Blend effect. (ID2D1DeviceContext6.BlendImage)
     * @param {ID2D1Image} _image Type: <b>ID2D1Image*</b>
     * 
     * The image to be drawn to the device context.
     * @param {D2D1_BLEND_MODE} blendMode Type: <b>D2D1_BLEND_MODE</b>
     * 
     * The blend mode to be used. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/blend">Blend modes</a> for more info.
     * @param {Pointer<D2D_POINT_2F>} targetOffset Type: <b>const D2D1_POINT_2F*</b>
     * 
     * The offset in the destination space that the image will be rendered to. 
     *             The entire logical extent of the image will be rendered to the corresponding destination. 
     *             If not specified, the destination origin will be (0, 0). 
     *             The top-left corner of the image will be mapped to the target offset. 
     *             This will not necessarily be the origin. The default value is NULL.
     * @param {Pointer<D2D_RECT_F>} imageRectangle Type: <b>const D2D1_RECT_F*</b>
     * 
     * The corresponding rectangle in the image space will be mapped to the given origins when processing the image. The default value is NULL.
     * @param {D2D1_INTERPOLATION_MODE} _interpolationMode Type: <b>D2D1_INTERPOLATION_MODE</b>
     * 
     * The interpolation mode that will be used to scale the image if necessary. The default value is D2D1_INTERPOLATION_MODE_LINEAR.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext6-blendimage
     */
    BlendImage(_image, blendMode, targetOffset, imageRectangle, _interpolationMode) {
        ComCall(119, this, "ptr", _image, D2D1_BLEND_MODE, blendMode, D2D_POINT_2F.Ptr, targetOffset, D2D_RECT_F.Ptr, imageRectangle, D2D1_INTERPOLATION_MODE, _interpolationMode)
    }

    Query(iid) {
        if (ID2D1DeviceContext6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BlendImage := CallbackCreate(GetMethod(implObj, "BlendImage"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BlendImage)
    }
}
