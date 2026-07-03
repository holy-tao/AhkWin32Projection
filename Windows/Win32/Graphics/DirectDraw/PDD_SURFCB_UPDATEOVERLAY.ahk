#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_UPDATEOVERLAYDATA.ahk" { DD_UPDATEOVERLAYDATA }

/**
 * The DdUpdateOverlay callback function repositions or modifies the visual attributes of an overlay surface.
 * @remarks
 * <b>DdUpdateOverlay</b> shows, hides, or repositions an overlay surface on the screen. It also sets attributes of the overlay surface, such as the stretch factor or type of color key to be used.
 * 
 * The driver should determine whether it has the bandwidth to support the overlay update request. The driver should use the <b>dwFlags</b> member of the DD_UPDATEOVERLAYDATA structure at <b>lpUpdateOverlay</b> to determine the type of request and how to process it.
 * 
 * The driver/hardware must stretch or shrink the overlay accordingly when the rectangles specified by the <b>rDest</b> and <b>rSrc</b> members of DD_UPDATEOVERLAYDATA are different sizes.
 * 
 * Note that <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> is used for flipping between overlay surfaces, so performance for <b>DdUpdateOverlay</b> is not critical.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_UPDATEOVERLAY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_UPDATEOVERLAY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_UPDATEOVERLAYDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_updateoverlaydata">DD_UPDATEOVERLAYDATA</a> structure that contains the information required to update the overlay.
     * @returns {Integer} <b>DdUpdateOverlay</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_UPDATEOVERLAYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_UPDATEOVERLAY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_UPDATEOVERLAY {
        /**
         * Creates a PDD_SURFCB_UPDATEOVERLAY pointer that invokes the given AHK function when called.
         * @param {Func(DD_UPDATEOVERLAYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_UPDATEOVERLAYDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
