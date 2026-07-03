#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\IFIMETRICS.ahk" { IFIMETRICS }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryFont {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryFont) {
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
     * @param {Pointer<Pointer>} param3 
     * @returns {Pointer<IFIMETRICS>} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, IntPtr, param1, UInt32, param2, param3Marshal, param3, IFIMETRICS.Ptr)
        return result
    }

    /**
     * A PFN_DrvQueryFont that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryFont {
        /**
         * Creates a PFN_DrvQueryFont pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, IntPtr, UInt32, "ptr*") => IFIMETRICS.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, IntPtr, UInt32, "ptr*", IFIMETRICS.Ptr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
