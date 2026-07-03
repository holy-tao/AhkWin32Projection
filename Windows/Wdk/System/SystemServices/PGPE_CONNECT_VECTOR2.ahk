#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KINTERRUPT_MODE.ahk" { KINTERRUPT_MODE }
#Import ".\PGPE_SERVICE_ROUTINE.ahk" { PGPE_SERVICE_ROUTINE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGPE_CONNECT_VECTOR2 {
    value : IntPtr

    __value {
        set {
            if (value is PGPE_CONNECT_VECTOR2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} GpeNumber 
     * @param {KINTERRUPT_MODE} _Mode 
     * @param {BOOLEAN} Shareable 
     * @param {Pointer<PGPE_SERVICE_ROUTINE>} ServiceRoutine 
     * @param {Pointer<Void>} ServiceContext 
     * @param {Pointer<Pointer<Void>>} _ObjectContext 
     * @returns {NTSTATUS} 
     */
    Call(_Context, GpeNumber, _Mode, Shareable, ServiceRoutine, ServiceContext, _ObjectContext) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        ServiceContextMarshal := ServiceContext is VarRef ? "ptr" : "ptr"
        _ObjectContextMarshal := _ObjectContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, GpeNumber, KINTERRUPT_MODE, _Mode, BOOLEAN, Shareable, PGPE_SERVICE_ROUTINE, ServiceRoutine, ServiceContextMarshal, ServiceContext, _ObjectContextMarshal, _ObjectContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGPE_CONNECT_VECTOR2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGPE_CONNECT_VECTOR2 {
        /**
         * Creates a PGPE_CONNECT_VECTOR2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, KINTERRUPT_MODE, BOOLEAN, PGPE_SERVICE_ROUTINE, "ptr", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, KINTERRUPT_MODE, BOOLEAN, PGPE_SERVICE_ROUTINE, "ptr", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
