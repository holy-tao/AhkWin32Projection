#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_COLOR_INTERPOLATION_MODE.ahk" { D2D1_COLOR_INTERPOLATION_MODE }
#Import "Common\D2D1_GRADIENT_STOP.ahk" { D2D1_GRADIENT_STOP }
#Import ".\D2D1_COLOR_SPACE.ahk" { D2D1_COLOR_SPACE }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }
#Import ".\ID2D1GradientStopCollection.ahk" { ID2D1GradientStopCollection }

/**
 * Represents a collection of D2D1_GRADIENT_STOP objects for linear and radial gradient brushes. It provides get methods for all the new parameters added to the gradient stop collection.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1gradientstopcollection1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GradientStopCollection1 extends ID2D1GradientStopCollection {
    /**
     * The interface identifier for ID2D1GradientStopCollection1
     * @type {Guid}
     */
    static IID := Guid("{ae1572f4-5dd0-4777-998b-9279472ae63b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GradientStopCollection1 interfaces
    */
    struct Vtbl extends ID2D1GradientStopCollection.Vtbl {
        GetGradientStops1         : IntPtr
        GetPreInterpolationSpace  : IntPtr
        GetPostInterpolationSpace : IntPtr
        GetBufferPrecision        : IntPtr
        GetColorInterpolationMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GradientStopCollection1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Copies the gradient stops from the collection into memory.
     * @remarks
     * If the [ID2D1DeviceContext::CreateGradientStopCollection](./nf-d2d1_1-id2d1devicecontext-creategradientstopcollection.md), this method returns the same values specified in the creation method. If the <b>ID2D1GradientStopCollection1</b> object was created using <b>ID2D1RenderTarget::CreateGradientStopCollection</b>, the stops returned here will first be transformed into the gamma space specified by the <i>colorInterpolationGamma</i> parameter. See the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-creategradientstopcollection">ID2D1DeviceContext::CreateGradientStopCollection</a>  method for more info about color space and gamma space.
     * 
     * If <i>gradientStopsCount</i> is less than the number of gradient stops in the collection, the remaining gradient stops are omitted. If <i>gradientStopsCount</i> is larger than the number of gradient stops in the collection, the extra gradient stops are set to <b>NULL</b>. To obtain the number of gradient stops in the collection, use the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount">GetGradientStopCount</a> method.
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a>*</b>
     * 
     * When this method returns, contains a pointer to a one-dimensional array of <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a> structures.
     * @param {Integer} gradientStopsCount Type: <b>UINT</b>
     * 
     * The number of gradient stops to copy.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getgradientstops1
     */
    GetGradientStops1(gradientStops, gradientStopsCount) {
        ComCall(8, this, D2D1_GRADIENT_STOP.Ptr, gradientStops, "uint", gradientStopsCount)
    }

    /**
     * Gets the color space of the input colors as well as the space in which gradient stops are interpolated.
     * @remarks
     * If this object was created using <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-creategradientstopcollection(constd2d1_gradient_stop_uint32_d2d1_gamma_d2d1_extend_mode_id2d1gradientstopcollection)">ID2D1RenderTarget::CreateGradientStopCollection</a>, this method  returns the color space related to the color interpolation gamma.
     * @returns {D2D1_COLOR_SPACE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * This method returns the color space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getpreinterpolationspace
     */
    GetPreInterpolationSpace() {
        result := ComCall(9, this, D2D1_COLOR_SPACE)
        return result
    }

    /**
     * Gets the color space after interpolation has occurred.
     * @remarks
     * If you create using <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-creategradientstopcollection(constd2d1_gradient_stop_uint32_d2d1_gamma_d2d1_extend_mode_id2d1gradientstopcollection)">ID2D1RenderTarget::CreateGradientStopCollection</a>, this method returns <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE_SRGB</a>.
     * @returns {D2D1_COLOR_SPACE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * This method returns the color space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getpostinterpolationspace
     */
    GetPostInterpolationSpace() {
        result := ComCall(10, this, D2D1_COLOR_SPACE)
        return result
    }

    /**
     * Gets the precision of the gradient buffer.
     * @remarks
     * If this object was created using <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-creategradientstopcollection(constd2d1_gradient_stop_uint32_d2d1_gamma_d2d1_extend_mode_id2d1gradientstopcollection)">ID2D1RenderTarget::CreateGradientStopCollection</a>, this method returns D2D1_BUFFER_PRECISION_8BPC_UNORM.
     * @returns {D2D1_BUFFER_PRECISION} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The buffer precision of the gradient buffer.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getbufferprecision
     */
    GetBufferPrecision() {
        result := ComCall(11, this, D2D1_BUFFER_PRECISION)
        return result
    }

    /**
     * Retrieves the color interpolation mode that the gradient stop collection uses.
     * @returns {D2D1_COLOR_INTERPOLATION_MODE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_interpolation_mode">D2D1_COLOR_INTERPOLATION_MODE</a></b>
     * 
     * The color interpolation mode.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gradientstopcollection1-getcolorinterpolationmode
     */
    GetColorInterpolationMode() {
        result := ComCall(12, this, D2D1_COLOR_INTERPOLATION_MODE)
        return result
    }

    Query(iid) {
        if (ID2D1GradientStopCollection1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGradientStops1 := CallbackCreate(GetMethod(implObj, "GetGradientStops1"), flags, 3)
        this.vtbl.GetPreInterpolationSpace := CallbackCreate(GetMethod(implObj, "GetPreInterpolationSpace"), flags, 1)
        this.vtbl.GetPostInterpolationSpace := CallbackCreate(GetMethod(implObj, "GetPostInterpolationSpace"), flags, 1)
        this.vtbl.GetBufferPrecision := CallbackCreate(GetMethod(implObj, "GetBufferPrecision"), flags, 1)
        this.vtbl.GetColorInterpolationMode := CallbackCreate(GetMethod(implObj, "GetColorInterpolationMode"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGradientStops1)
        CallbackFree(this.vtbl.GetPreInterpolationSpace)
        CallbackFree(this.vtbl.GetPostInterpolationSpace)
        CallbackFree(this.vtbl.GetBufferPrecision)
        CallbackFree(this.vtbl.GetColorInterpolationMode)
    }
}
