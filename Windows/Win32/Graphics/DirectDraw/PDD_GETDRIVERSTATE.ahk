#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_GETDRIVERSTATEDATA.ahk" { DD_GETDRIVERSTATEDATA }

/**
 * The D3dGetDriverState function is used by both the Microsoft DirectDraw and Microsoft Direct3D runtimes to obtain information from the driver about its current state.
 * @remarks
 * All Direct3D drivers must support <i>D3dGetDriverState</i>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_getdriverstate
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_GETDRIVERSTATE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_GETDRIVERSTATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_GETDRIVERSTATEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getdriverstatedata">DD_GETDRIVERSTATEDATA</a> structure that describes the state of the driver.
     * @returns {Integer} <i>D3dGetDriverState</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_GETDRIVERSTATEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_GETDRIVERSTATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_GETDRIVERSTATE {
        /**
         * Creates a PDD_GETDRIVERSTATE pointer that invokes the given AHK function when called.
         * @param {Func(DD_GETDRIVERSTATEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_GETDRIVERSTATEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
