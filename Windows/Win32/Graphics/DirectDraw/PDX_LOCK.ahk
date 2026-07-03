#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDLOCKININFO.ahk" { DDLOCKININFO }
#Import ".\DDLOCKOUTINFO.ahk" { DDLOCKOUTINFO }

/**
 * The DxLock callback function is called when a client of the video miniport driver wants access to the frame buffer.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddlockininfo">DDLOCKININFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddlockoutinfo">DDLOCKOUTINFO</a> structures contain surface information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/nc-dxmini-pdx_lock
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDX_LOCK {
    value : IntPtr

    __value {
        set {
            if (value is PDX_LOCK) {
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
     * @param {Pointer<DDLOCKININFO>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddlockininfo">DDLOCKININFO</a> structure that contains the surface information for the lock.
     * @param {Pointer<DDLOCKOUTINFO>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddlockoutinfo">DDLOCKOUTINFO</a> structure that contains the surface in the frame buffer.
     * @returns {Integer} <i>DxLock</i> returns DX_OK if it succeeds; otherwise, it returns one of the following error values:
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, DDLOCKININFO.Ptr, param1, DDLOCKOUTINFO.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PDX_LOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDX_LOCK {
        /**
         * Creates a PDX_LOCK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDLOCKININFO, DDLOCKOUTINFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDLOCKININFO.Ptr, DDLOCKOUTINFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
