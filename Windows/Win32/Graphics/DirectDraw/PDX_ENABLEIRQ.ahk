#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDENABLEIRQINFO.ahk" { DDENABLEIRQINFO }

/**
 * The DxEnableIRQ callback function indicates to the video miniport driver which IRQs should be enabled or disabled.
 * @remarks
 * The <b>dwIRQSources</b> member of the DDENABLEIRQINFO structure at <i>EnableIrqInfo</i> contains the DDIRQ_<i>Xxx</i> flags that are set for every IRQ that should be enabled. If an IRQ is not specified in this call, it should be disabled. If the requested combination cannot be supported, this function fails. 
 * 
 * Because the video miniport driver must always manage its own IRQ, it must call the specified <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_irqcallback">IRQCallback</a> when an IRQ occurs. When calling <b>IRQCallback</b>, the <b>dwIRQFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-dx_irqdata">DX_IRQDATA</a> structure passed to <b>IRQCallback</b> contains the DDIRQ_<i>Xxx</i> flags that indicate what caused the IRQ.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_enableirq
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_ENABLEIRQ {
    value : IntPtr

    __value {
        set {
            if (value is PDX_ENABLEIRQ) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 Points to the miniport driver's device extension.
     * @param {Pointer<DDENABLEIRQINFO>} param1 Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddenableirqinfo">DDENABLEIRQINFO</a> structure that contains the information required to enable interrupts.
     * @param {Pointer<Void>} param2 Reserved for system use.
     * @returns {Integer} <i>DxEnableIRQ</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDENABLEIRQINFO.Ptr, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A PDX_ENABLEIRQ that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_ENABLEIRQ {
        /**
         * Creates a PDX_ENABLEIRQ pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDENABLEIRQINFO, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDENABLEIRQINFO.Ptr, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
