#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETSELECTORMODULEPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETSELECTORMODULEPROC) {
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
     * @param {Pointer<Integer>} param3 
     * @param {PSTR} param4 
     * @param {Integer} param5 
     * @param {PSTR} param6 
     * @param {Integer} param7 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param4 := param4 is String ? StrPtr(param4) : param4
        param6 := param6 is String ? StrPtr(param6) : param6

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, UInt16, param2, param3Marshal, param3, "ptr", param4, UInt32, param5, "ptr", param6, UInt32, param7, BOOL)
        return result
    }

    /**
     * A VDMGETSELECTORMODULEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETSELECTORMODULEPROC {
        /**
         * Creates a VDMGETSELECTORMODULEPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt16, "uint*", PSTR, UInt32, PSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt16, "uint*", PSTR, UInt32, PSTR, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
