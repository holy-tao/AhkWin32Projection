#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @charset Unicode
 */
export default struct DTC_GET_TRANSACTION_MANAGER_EX_W {
    value : IntPtr

    __value {
        set {
            if (value is DTC_GET_TRANSACTION_MANAGER_EX_W) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} i_pwszHost 
     * @param {PWSTR} i_pwszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_grfOptions 
     * @param {Pointer<Void>} i_pvConfigParams 
     * @param {Pointer<Pointer<Void>>} o_ppvObject 
     * @returns {HRESULT} 
     */
    Call(i_pwszHost, i_pwszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
        i_pwszHost := i_pwszHost is String ? StrPtr(i_pwszHost) : i_pwszHost
        i_pwszTmName := i_pwszTmName is String ? StrPtr(i_pwszTmName) : i_pwszTmName

        i_pvConfigParamsMarshal := i_pvConfigParams is VarRef ? "ptr" : "ptr"
        o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", i_pwszHost, "ptr", i_pwszTmName, Guid.Ptr, i_riid, UInt32, i_grfOptions, i_pvConfigParamsMarshal, i_pvConfigParams, o_ppvObjectMarshal, o_ppvObject, "HRESULT")
        return result
    }

    /**
     * A DTC_GET_TRANSACTION_MANAGER_EX_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DTC_GET_TRANSACTION_MANAGER_EX_W {
        /**
         * Creates a DTC_GET_TRANSACTION_MANAGER_EX_W pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, Guid, UInt32, "ptr", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PWSTR, PWSTR, Guid.Ptr, UInt32, "ptr", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
