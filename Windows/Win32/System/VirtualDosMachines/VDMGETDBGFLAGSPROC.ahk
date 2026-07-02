#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETDBGFLAGSPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETDBGFLAGSPROC) {
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
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, HANDLE, param0, UInt32)
        return result
    }

    /**
     * A VDMGETDBGFLAGSPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETDBGFLAGSPROC {
        /**
         * Creates a VDMGETDBGFLAGSPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
