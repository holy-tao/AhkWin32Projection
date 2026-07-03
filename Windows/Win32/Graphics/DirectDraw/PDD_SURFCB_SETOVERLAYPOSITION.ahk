#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SETOVERLAYPOSITIONDATA.ahk" { DD_SETOVERLAYPOSITIONDATA }

/**
 * The DdSetOverlayPosition callback function sets the position for an overlay.
 * @remarks
 * When the overlay is visible, the driver should cause the overlay to be displayed on the primary surface. The upper left corner of the overlay should be anchored at the position specified by the <b>lXPos</b> and <b>lYPos</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_setoverlaypositiondata">DD_SETOVERLAYPOSITIONDATA</a> structure at <i>lpSetOverlayPosition</i>. For example, values of (0,0) indicate that the upper left corner of the overlay should appear in the upper left corner of the surface identified by the <b>lpDDDestSurface</b> member of DD_SETOVERLAYPOSITIONDATA.
 * 
 * When the overlay is invisible, the driver should set an error code in the <b>ddRVal</b> member of DD_SETOVERLAYPOSITIONDATA and return DDHAL_DRIVER_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_setoverlayposition
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_SETOVERLAYPOSITION {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_SETOVERLAYPOSITION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SETOVERLAYPOSITIONDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_setoverlaypositiondata">DD_SETOVERLAYPOSITIONDATA</a> structure that contains the information required to set the overlay position.
     * @returns {Integer} <b>DdSetOverlayPosition</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SETOVERLAYPOSITIONDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_SETOVERLAYPOSITION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_SETOVERLAYPOSITION {
        /**
         * Creates a PDD_SURFCB_SETOVERLAYPOSITION pointer that invokes the given AHK function when called.
         * @param {Func(DD_SETOVERLAYPOSITIONDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SETOVERLAYPOSITIONDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
