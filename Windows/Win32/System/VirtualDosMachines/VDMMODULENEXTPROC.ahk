#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MODULEENTRY.ahk" { MODULEENTRY }
#Import ".\DEBUGEVENTPROC.ahk" { DEBUGEVENTPROC }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMMODULENEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMMODULENEXTPROC) {
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
     * @param {Pointer<MODULEENTRY>} param2 
     * @param {Pointer<DEBUGEVENTPROC>} param3 
     * @param {Pointer<Void>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, MODULEENTRY.Ptr, param2, DEBUGEVENTPROC, param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A VDMMODULENEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMMODULENEXTPROC {
        /**
         * Creates a VDMMODULENEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, MODULEENTRY, DEBUGEVENTPROC, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, MODULEENTRY.Ptr, DEBUGEVENTPROC, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
