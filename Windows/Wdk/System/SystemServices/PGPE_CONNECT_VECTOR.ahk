#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\KINTERRUPT_MODE.ahk" { KINTERRUPT_MODE }
#Import ".\PGPE_SERVICE_ROUTINE.ahk" { PGPE_SERVICE_ROUTINE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGPE_CONNECT_VECTOR {
    value : IntPtr

    __value {
        set {
            if (value is PGPE_CONNECT_VECTOR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} param0 
     * @param {Integer} param1 
     * @param {KINTERRUPT_MODE} param2 
     * @param {BOOLEAN} param3 
     * @param {Pointer<PGPE_SERVICE_ROUTINE>} param4 
     * @param {Pointer<Void>} param5 
     * @param {Pointer<Void>} param6 
     * @returns {NTSTATUS} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, param0, UInt32, param1, KINTERRUPT_MODE, param2, BOOLEAN, param3, PGPE_SERVICE_ROUTINE, param4, param5Marshal, param5, param6Marshal, param6, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGPE_CONNECT_VECTOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGPE_CONNECT_VECTOR {
        /**
         * Creates a PGPE_CONNECT_VECTOR pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, UInt32, KINTERRUPT_MODE, BOOLEAN, PGPE_SERVICE_ROUTINE, "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, UInt32, KINTERRUPT_MODE, BOOLEAN, PGPE_SERVICE_ROUTINE, "ptr", "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
