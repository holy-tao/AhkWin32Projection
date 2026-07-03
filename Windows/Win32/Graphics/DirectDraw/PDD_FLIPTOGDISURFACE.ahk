#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_FLIPTOGDISURFACEDATA.ahk" { DD_FLIPTOGDISURFACEDATA }

/**
 * The DdFlipToGDISurface callback function notifies the driver when DirectDraw is flipping to or from a GDI surface.
 * @remarks
 * <i>DdFlipToGDISurface</i> can be implemented in drivers with hardware that needs to be enabled or disabled, depending on whether a GDI surface is being flipped to.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_fliptogdisurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_FLIPTOGDISURFACE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_FLIPTOGDISURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_FLIPTOGDISURFACEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_fliptogdisurfacedata">DD_FLIPTOGDISURFACEDATA</a> structure that contains the notification information.
     * @returns {Integer} <i>DdFlipToGDISurface</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_FLIPTOGDISURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_FLIPTOGDISURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_FLIPTOGDISURFACE {
        /**
         * Creates a PDD_FLIPTOGDISURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DD_FLIPTOGDISURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_FLIPTOGDISURFACEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
