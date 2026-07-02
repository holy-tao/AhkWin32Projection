#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_BLTDATA.ahk" { DD_BLTDATA }

/**
 * The DdBlt callback function performs a bit-block transfer.
 * @remarks
 * <i>DdBlt</i> can be optionally implemented in DirectDraw drivers.
 * 
 * Before performing the bit block transfer, the driver should ensure that a flip involving the destination surface is not in progress. If the destination surface is involved in a flip, the driver should set the <b>ddRVal</b> member of the DD_BLTDATA structure at <i>lpBlt</i> to DDERR_WASSTILLDRAWING and return DDHAL_DRIVER_HANDLED.
 * 
 * The driver should check <b>dwFlags</b> to determine the type of blit operation to perform. The driver should not check for flags that are undocumented.
 * 
 * When performing transparent (color keyed) blts, drivers should ignore any unused pixel bits in their comparisons. (For instance in 32bpp modes, the high byte is typically unused. This byte should not be used in the color key comparison.)
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_blt
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_BLT {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_BLT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_BLTDATA>} param0 Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_bltdata">DD_BLTDATA</a> structure that contains the information required for the driver to perform the blit.
     * @returns {Integer} <i>DdBlt</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_BLTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_BLT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_BLT {
        /**
         * Creates a PDD_SURFCB_BLT pointer that invokes the given AHK function when called.
         * @param {Func(DD_BLTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_BLTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
