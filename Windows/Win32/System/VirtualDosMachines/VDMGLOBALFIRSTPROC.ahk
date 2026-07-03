#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DEBUGEVENTPROC.ahk" { DEBUGEVENTPROC }
#Import ".\GLOBALENTRY.ahk" { GLOBALENTRY }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGLOBALFIRSTPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGLOBALFIRSTPROC) {
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
     * @param {Pointer<GLOBALENTRY>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DEBUGEVENTPROC>} param4 
     * @param {Pointer<Void>} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, GLOBALENTRY.Ptr, param2, UInt16, param3, DEBUGEVENTPROC, param4, param5Marshal, param5, BOOL)
        return result
    }

    /**
     * A VDMGLOBALFIRSTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGLOBALFIRSTPROC {
        /**
         * Creates a VDMGLOBALFIRSTPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, GLOBALENTRY, UInt16, DEBUGEVENTPROC, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, GLOBALENTRY.Ptr, UInt16, DEBUGEVENTPROC, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
