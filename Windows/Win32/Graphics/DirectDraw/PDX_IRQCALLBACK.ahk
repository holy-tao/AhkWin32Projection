#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DX_IRQDATA.ahk" { DX_IRQDATA }

/**
 * The IRQCallback function performs operations related to the IRQ that occurred.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows-hardware/drivers/display/video-miniport-drivers-in-the-windows-2000-display-driver-model">video miniport driver</a> calls the <i>IRQCallback</i> function when an IRQ occurs.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_irqcallback
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_IRQCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDX_IRQCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DX_IRQDATA>} pIrqData Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-dx_irqdata">DX_IRQDATA</a> structure that is filled in with the video miniport driver's IRQ information.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pIrqData) {
        DllCall(this.value, DX_IRQDATA.Ptr, pIrqData)
    }

    /**
     * A PDX_IRQCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_IRQCALLBACK {
        /**
         * Creates a PDX_IRQCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DX_IRQDATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DX_IRQDATA.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
