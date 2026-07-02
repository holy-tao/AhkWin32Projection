#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETMODULESELECTORPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETMODULESELECTORPROC) {
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
     * @param {PSTR} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param3 := param3 is String ? StrPtr(param3) : param3

        param4Marshal := param4 is VarRef ? "ushort*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, UInt32, param2, "ptr", param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A VDMGETMODULESELECTORPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETMODULESELECTORPROC {
        /**
         * Creates a VDMGETMODULESELECTORPROC pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, PSTR, "ushort*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, PSTR, "ushort*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
