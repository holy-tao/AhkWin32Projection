#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @charset ANSI
 */
export default struct DTC_GET_TRANSACTION_MANAGER_EX_A {
    value : IntPtr

    __value {
        set {
            if (value is DTC_GET_TRANSACTION_MANAGER_EX_A) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} i_pszHost 
     * @param {PSTR} i_pszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_grfOptions 
     * @param {Pointer<Void>} i_pvConfigParams 
     * @param {Pointer<Pointer<Void>>} o_ppvObject 
     * @returns {HRESULT} 
     */
    Call(i_pszHost, i_pszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
        i_pszHost := i_pszHost is String ? StrPtr(i_pszHost) : i_pszHost
        i_pszTmName := i_pszTmName is String ? StrPtr(i_pszTmName) : i_pszTmName

        i_pvConfigParamsMarshal := i_pvConfigParams is VarRef ? "ptr" : "ptr"
        o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", i_pszHost, "ptr", i_pszTmName, Guid.Ptr, i_riid, UInt32, i_grfOptions, i_pvConfigParamsMarshal, i_pvConfigParams, o_ppvObjectMarshal, o_ppvObject, "HRESULT")
        return result
    }

    /**
     * A DTC_GET_TRANSACTION_MANAGER_EX_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DTC_GET_TRANSACTION_MANAGER_EX_A {
        /**
         * Creates a DTC_GET_TRANSACTION_MANAGER_EX_A pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, Guid, UInt32, "ptr", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, PSTR, Guid.Ptr, UInt32, "ptr", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
