#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\PALOBJ.ahk" { PALOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSetPalette {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSetPalette) {
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
     * @param {Pointer<PALOBJ>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, DHPDEV, param0, PALOBJ.Ptr, param1, UInt32, param2, UInt32, param3, UInt32, param4, BOOL)
        return result
    }

    /**
     * A PFN_DrvSetPalette that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSetPalette {
        /**
         * Creates a PFN_DrvSetPalette pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, PALOBJ, UInt32, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, PALOBJ.Ptr, UInt32, UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
