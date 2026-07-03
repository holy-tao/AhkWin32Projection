#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Gdi\DEVMODEW.ahk" { DEVMODEW }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvGetModes {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvGetModes) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Integer} param1 
     * @param {Pointer<DEVMODEW>} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HANDLE, param0, UInt32, param1, DEVMODEW.Ptr, param2, UInt32)
        return result
    }

    /**
     * A PFN_DrvGetModes that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvGetModes {
        /**
         * Creates a PFN_DrvGetModes pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, DEVMODEW) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, DEVMODEW.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
