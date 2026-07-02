#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SYNCVIDEOPORTDATA.ahk" { DD_SYNCVIDEOPORTDATA }

/**
 * The DdSyncVideoPortData callback function sets and modifies VPE object data before it is passed to the video miniport driver.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncvideoport
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_KERNELCB_SYNCVIDEOPORT {
    value : IntPtr

    __value {
        set {
            if (value is PDD_KERNELCB_SYNCVIDEOPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SYNCVIDEOPORTDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_syncvideoportdata">DD_SYNCVIDEOPORTDATA</a> structure that contains the VPE object data.
     * @returns {Integer} <b>DdSyncVideoPortData</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_SYNCVIDEOPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_KERNELCB_SYNCVIDEOPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_KERNELCB_SYNCVIDEOPORT {
        /**
         * Creates a PDD_KERNELCB_SYNCVIDEOPORT pointer that invokes the given AHK function when called.
         * @param {Func(DD_SYNCVIDEOPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SYNCVIDEOPORTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
