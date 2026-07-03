#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PM_DISPATCH_TABLE.ahk" { PM_DISPATCH_TABLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalInitPowerManagement {
    value : IntPtr

    __value {
        set {
            if (value is pHalInitPowerManagement) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PM_DISPATCH_TABLE>} PmDriverDispatchTable 
     * @param {Pointer<Pointer<PM_DISPATCH_TABLE>>} PmHalDispatchTable 
     * @returns {NTSTATUS} 
     */
    Call(PmDriverDispatchTable, PmHalDispatchTable) {
        PmHalDispatchTableMarshal := PmHalDispatchTable is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, PM_DISPATCH_TABLE.Ptr, PmDriverDispatchTable, PmHalDispatchTableMarshal, PmHalDispatchTable, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pHalInitPowerManagement that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalInitPowerManagement {
        /**
         * Creates a pHalInitPowerManagement pointer that invokes the given AHK function when called.
         * @param {Func(PM_DISPATCH_TABLE, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PM_DISPATCH_TABLE.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
