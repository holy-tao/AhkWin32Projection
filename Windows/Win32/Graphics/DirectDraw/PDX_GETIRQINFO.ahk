#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDGETIRQINFO.ahk" { DDGETIRQINFO }

/**
 * The DxGetIRQInfo callback function indicates that the driver manages the interrupt request.
 * @remarks
 * Because the miniport driver must always manage the IRQ, this function must always set the <b>dwFlags</b> member of the DDGETIRQINFO structure at <i>GetIrqInfo</i> to IRQINFO_HANDLED. If any other flag is set, this function will fail.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_getirqinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_GETIRQINFO {
    value : IntPtr

    __value {
        set {
            if (value is PDX_GETIRQINFO) {
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
     * @param {Pointer<Void>} param1 Reserved for system use.
     * @param {Pointer<DDGETIRQINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgetirqinfo">DDGETIRQINFO</a> structure that contains the interrupt request information.
     * @returns {Integer} <i>DxGetIrqInfo</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, DDGETIRQINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_GETIRQINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_GETIRQINFO {
        /**
         * Creates a PDX_GETIRQINFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", DDGETIRQINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", DDGETIRQINFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
