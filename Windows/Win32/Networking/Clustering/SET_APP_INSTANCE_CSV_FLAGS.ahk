#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SET_APP_INSTANCE_CSV_FLAGS {
    value : IntPtr

    __value {
        set {
            if (value is SET_APP_INSTANCE_CSV_FLAGS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} Mask 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    Call(ProcessHandle, Mask, Flags) {
        result := DllCall(this.value, HANDLE, ProcessHandle, UInt32, Mask, UInt32, Flags, UInt32)
        return result
    }

    /**
     * A SET_APP_INSTANCE_CSV_FLAGS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SET_APP_INSTANCE_CSV_FLAGS {
        /**
         * Creates a SET_APP_INSTANCE_CSV_FLAGS pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
