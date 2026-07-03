#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_VPORTCOLORDATA.ahk" { DD_VPORTCOLORDATA }

/**
 * The DdVideoPortColorControl callback function gets or sets the VPE object color controls.
 * @remarks
 * DirectDraw drivers that set the DDVPCAPS_COLORCONTROL flag in the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure must implement <b>DdVideoPortColorControl</b>.
 * 
 * Depending on the value of the <b>dwFlags</b> member of the DD_VPORTCOLORDATA structure at <i>lpColorControl</i>, the driver should do the following:
 * 
 * <ul>
 * <li>
 * When <b>dwFlags</b> is DDRAWI_VPORTGETCOLOR, the driver should fill in each member of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549237(v=vs.85)">DDCOLORCONTROL</a> structure that it supports with the VPE object's current color control setting. The driver must set the corresponding bit in the <b>dwFlags</b> member of DDCOLORCONTROL for every color control member in which it writes data.
 * 
 * <b>DdVideoPortColorControl</b> can be called to determine the color control capabilities of the VPE object. The driver should therefore fail the call if it does not support a requested color control capability.
 * 
 * </li>
 * <li>
 * When <b>dwFlags</b> is DDRAWI_VPORTSETCOLOR, the driver should set the VPE object's color control settings to the values specified in the DDCOLORCONTROL structure. The driver should check the <b>dwFlags</b> member of DDCOLORCONTROL to determine which structure members contain valid data.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_vportcb_colorcontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_VPORTCB_COLORCONTROL {
    value : IntPtr

    __value {
        set {
            if (value is PDD_VPORTCB_COLORCONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_VPORTCOLORDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_vportcolordata">DD_VPORTCOLORDATA</a> structure that contains the information required for the driver to get the current VPE object color controls or to set new values.
     * @returns {Integer} <b>DdVideoPortColorControl</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_VPORTCOLORDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_VPORTCB_COLORCONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_VPORTCB_COLORCONTROL {
        /**
         * Creates a PDD_VPORTCB_COLORCONTROL pointer that invokes the given AHK function when called.
         * @param {Func(DD_VPORTCOLORDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_VPORTCOLORDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
