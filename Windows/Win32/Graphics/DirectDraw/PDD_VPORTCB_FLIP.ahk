#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_FLIPVPORTDATA.ahk" { DD_FLIPVPORTDATA }

/**
 * The DdVideoPortFlip callback function performs a physical flip, causing the VPE object to start writing data to the new surface.
 * @remarks
 * <i>DdVideoPortFlip</i> must be implemented in DirectDraw drivers that support VPE.
 * 
 * The driver should update its surface pointers so that the next frame of video will be written to the surface to which the <b>lpSurfTarg</b> member of the DD_FLIPVPORTDATA structure at <i>lpFlipVideoPort</i> points. If a previous flip request is still pending, the driver should fail the call by setting the <b>ddRVal</b> member of DD_FLIPVPORTDATA to DDERR_WASSTILLDRAWING and returning DDHAL_DRIVER_HANDLED. <i>DdVideoPortFlip</i> does not affect the actual display of the video data.
 * 
 * A call to <i>DdVideoPortFlip</i> typically accompanies a call to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> when an application is performing video streaming.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_flip
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_FLIP {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_FLIP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_FLIPVPORTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_flipvportdata">DD_FLIPVPORTDATA</a> structure that contains the information required for the driver to perform the flip.
     * @returns {Integer} <i>DdVideoPortFlip</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_FLIPVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_FLIP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_FLIP {
        /**
         * Creates a PDD_VPORTCB_FLIP pointer that invokes the given AHK function when called.
         * @param {Func(DD_FLIPVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_FLIPVPORTDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
