#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETSCANLINEDATA.ahk" { DD_GETSCANLINEDATA }

/**
 * The DdGetScanLine callback function returns the number of the current physical scan line.
 * @remarks
 * If the monitor is not in vertical blank, the driver should write the scan line value in the <b>dwScanLine</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getscanlinedata">DD_GETSCANLINEDATA</a> structure at <i>pGetScanLine</i>. The number must be in the range [0, <i>n</i>], where scan line 0 is the first visible scan line and scan line <i>n</i> is the last visible scan line on the screen. The driver should then set DD_OK in the <b>ddRVal</b> member of <b>DD_GETSCANLINEDATA</b> and return DDHAL_DRIVER_HANDLED.
 * 
 * The scan line is indeterminate if a vertical blank is in progress. In this situation, the driver should set <b>ddRVal</b> to DDERR_VERTICALBLANKINPROGRESS and return DDHAL_DRIVER_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_getscanline
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_GETSCANLINE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_GETSCANLINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETSCANLINEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getscanlinedata">DD_GETSCANLINEDATA</a> structure in which the driver returns the number of the current scan line.
     * @returns {Integer} <i>DdGetScanLine</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETSCANLINEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_GETSCANLINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_GETSCANLINE {
        /**
         * Creates a PDD_GETSCANLINE pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETSCANLINEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETSCANLINEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
