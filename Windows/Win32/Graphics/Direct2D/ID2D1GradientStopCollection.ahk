#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import "Common\D2D1_GRADIENT_STOP.ahk" { D2D1_GRADIENT_STOP }
#Import ".\D2D1_GAMMA.ahk" { D2D1_GAMMA }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a collection of D2D1_GRADIENT_STOP objects for linear and radial gradient brushes.
 * @remarks
 * <h3><a id="Creating_ID2D1GradientStopCollection_Objects"></a><a id="creating_id2d1gradientstopcollection_objects"></a><a id="CREATING_ID2D1GRADIENTSTOPCOLLECTION_OBJECTS"></a>Creating ID2D1GradientStopCollection Objects</h3>
 * To create an <b>ID2D1GradientStopCollection</b>, use the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-creategradientstopcollection(constd2d1_gradient_stop_uint32_d2d1_gamma_d2d1_extend_mode_id2d1gradientstopcollection)">ID2D1RenderTarget::CreateGradientStopCollection</a> method.  
 * 
 * A gradient stop collection is a device-dependent resource: your application should create gradient stop collections after it initializes the render target with which the gradient stop collection will be used, and recreate the gradient stop collection whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GradientStopCollection extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1GradientStopCollection
     * @type {Guid}
     */
    static IID := Guid("{2cd906a7-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GradientStopCollection interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetGradientStopCount       : IntPtr
        GetGradientStops           : IntPtr
        GetColorInterpolationGamma : IntPtr
        GetExtendMode              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GradientStopCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of gradient stops in the collection.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of gradient stops in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount
     */
    GetGradientStopCount() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * Copies the gradient stops from the collection into an array of D2D1_GRADIENT_STOP structures.
     * @remarks
     * Gradient stops are copied in order of position, starting with the gradient stop with the smallest position value and progressing to the gradient stop with the largest position value.
     * @param {Pointer<D2D1_GRADIENT_STOP>} gradientStops Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a>*</b>
     * 
     * A pointer to a one-dimensional array of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a> structures. When this method returns, the array contains copies of the collection's gradient stops. You must allocate the memory for this array.
     * @param {Integer} gradientStopsCount Type: <b>UINT</b>
     * 
     * A value indicating the number of gradient stops to copy. If the value is less than the number of gradient stops in the collection, the remaining gradient stops are omitted. If the value is larger than the number of gradient stops in the collection, the extra gradient stops are set to <b>NULL</b>. To obtain the number of gradient stops in the collection, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstopcount">GetGradientStopCount</a> method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstops
     */
    GetGradientStops(gradientStops, gradientStopsCount) {
        ComCall(5, this, D2D1_GRADIENT_STOP.Ptr, gradientStops, "uint", gradientStopsCount)
    }

    /**
     * Indicates the gamma space in which the gradient stops are interpolated.
     * @returns {D2D1_GAMMA} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_gamma">D2D1_GAMMA</a></b>
     * 
     * The gamma space in which the gradient stops are interpolated.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getcolorinterpolationgamma
     */
    GetColorInterpolationGamma() {
        result := ComCall(6, this, D2D1_GAMMA)
        return result
    }

    /**
     * Indicates the behavior of the gradient outside the normalized gradient range.
     * @returns {D2D1_EXTEND_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The behavior of the gradient outside the [0,1] normalized gradient range.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getextendmode
     */
    GetExtendMode() {
        result := ComCall(7, this, D2D1_EXTEND_MODE)
        return result
    }

    Query(iid) {
        if (ID2D1GradientStopCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGradientStopCount := CallbackCreate(GetMethod(implObj, "GetGradientStopCount"), flags, 1)
        this.vtbl.GetGradientStops := CallbackCreate(GetMethod(implObj, "GetGradientStops"), flags, 3)
        this.vtbl.GetColorInterpolationGamma := CallbackCreate(GetMethod(implObj, "GetColorInterpolationGamma"), flags, 1)
        this.vtbl.GetExtendMode := CallbackCreate(GetMethod(implObj, "GetExtendMode"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGradientStopCount)
        CallbackFree(this.vtbl.GetGradientStops)
        CallbackFree(this.vtbl.GetColorInterpolationGamma)
        CallbackFree(this.vtbl.GetExtendMode)
    }
}
