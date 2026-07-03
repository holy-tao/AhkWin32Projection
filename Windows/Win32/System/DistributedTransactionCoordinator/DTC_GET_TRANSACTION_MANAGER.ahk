#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct DTC_GET_TRANSACTION_MANAGER {
    value : IntPtr

    __value {
        set {
            if (value is DTC_GET_TRANSACTION_MANAGER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pszHost 
     * @param {PSTR} pszTmName 
     * @param {Pointer<Guid>} rid 
     * @param {Integer} dwReserved1 
     * @param {Integer} wcbReserved2 
     * @param {Pointer<Void>} pvReserved2 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    Call(pszHost, pszTmName, rid, dwReserved1, wcbReserved2, pvReserved2, ppvObject) {
        pszHost := pszHost is String ? StrPtr(pszHost) : pszHost
        pszTmName := pszTmName is String ? StrPtr(pszTmName) : pszTmName

        pvReserved2Marshal := pvReserved2 is VarRef ? "ptr" : "ptr"
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pszHost, "ptr", pszTmName, Guid.Ptr, rid, UInt32, dwReserved1, UInt16, wcbReserved2, pvReserved2Marshal, pvReserved2, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * A DTC_GET_TRANSACTION_MANAGER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DTC_GET_TRANSACTION_MANAGER {
        /**
         * Creates a DTC_GET_TRANSACTION_MANAGER pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, Guid, UInt32, UInt16, "ptr", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, PSTR, Guid.Ptr, UInt32, UInt16, "ptr", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
