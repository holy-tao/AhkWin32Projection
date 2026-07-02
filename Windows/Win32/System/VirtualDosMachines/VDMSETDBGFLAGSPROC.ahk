#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMSETDBGFLAGSPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMSETDBGFLAGSPROC) {
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
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, HANDLE, param0, UInt32, param1, BOOL)
        return result
    }

    /**
     * A VDMSETDBGFLAGSPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMSETDBGFLAGSPROC {
        /**
         * Creates a VDMSETDBGFLAGSPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
