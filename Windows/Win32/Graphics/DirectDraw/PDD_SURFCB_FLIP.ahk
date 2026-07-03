#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_FLIPDATA.ahk" { DD_FLIPDATA }

/**
 * The DdFlip callback function causes the surface memory associated with the target surface to become the primary surface, and the current surface to become the nonprimary surface.
 * @remarks
 * <b>DdFlip</b> allows a display driver to perform multibuffering. DirectDraw drivers must implement this function.
 * 
 * The driver should update its surface pointers so that the next frame will be written to the surface to which the <b>lpSurfTarg</b> member of the DD_FLIPDATA structure at <b>lpFlip</b> points. If a previous flip request is still pending, the driver should fail the call by setting the <b>ddRVal</b> member of DD_FLIPDATA to DDERR_WASSTILLDRAWING and returning DDHAL_DRIVER_HANDLED. The driver should ensure that the scan line is not in the vertical blank before performing the flip. <b>DdFlip</b> does not affect the actual display of the video data.
 * 
 * If the driver's hardware supports overlays or textures, <b>DdFlip</b> should make any necessary checks based on the surface type before performing the flip.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_flip
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_FLIP {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_FLIP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_FLIPDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_flipdata">DD_FLIPDATA</a> structure that contains the information required to perform the flip.
     * @returns {Integer} <b>DdFlip</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_FLIPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_FLIP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_FLIP {
        /**
         * Creates a PDD_SURFCB_FLIP pointer that invokes the given AHK function when called.
         * @param {Func(DD_FLIPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_FLIPDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
