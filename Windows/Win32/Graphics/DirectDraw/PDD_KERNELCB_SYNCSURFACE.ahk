#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SYNCSURFACEDATA.ahk" { DD_SYNCSURFACEDATA }

/**
 * The DdSyncSurfaceData callback function sets and modifies surface data before it is passed to the video miniport driver.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncsurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_KERNELCB_SYNCSURFACE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_KERNELCB_SYNCSURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SYNCSURFACEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_syncsurfacedata">DD_SYNCSURFACEDATA</a> structure that contains the surface data.
     * @returns {Integer} <i>DdSyncSurfaceData</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SYNCSURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_KERNELCB_SYNCSURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_KERNELCB_SYNCSURFACE {
        /**
         * Creates a PDD_KERNELCB_SYNCSURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DD_SYNCSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SYNCSURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
