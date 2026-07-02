#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryFontTree {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryFontTree) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} param0 
     * @param {Pointer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Pointer>} param4 
     * @returns {Pointer<Void>} 
     */
    Call(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, IntPtr, param1, UInt32, param2, UInt32, param3, param4Marshal, param4, IntPtr)
        return result
    }

    /**
     * A PFN_DrvQueryFontTree that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryFontTree {
        /**
         * Creates a PFN_DrvQueryFontTree pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, IntPtr, UInt32, UInt32, "ptr*") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, IntPtr, UInt32, UInt32, "ptr*", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
