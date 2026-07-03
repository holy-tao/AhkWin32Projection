#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETPOINTERPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETPOINTERPROC) {
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
     * @param {HANDLE} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {BOOL} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, UInt16, param2, UInt32, param3, BOOL, param4, UInt32)
        return result
    }

    /**
     * A VDMGETPOINTERPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETPOINTERPROC {
        /**
         * Creates a VDMGETPOINTERPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt16, UInt32, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt16, UInt32, BOOL, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
