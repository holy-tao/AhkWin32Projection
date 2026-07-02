#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct DTC_INSTALL_CLIENT {
    value : IntPtr

    __value {
        set {
            if (value is DTC_INSTALL_CLIENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} i_pszRemoteTmHostName 
     * @param {Integer} i_dwProtocol 
     * @param {Integer} i_dwOverwrite 
     * @returns {HRESULT} 
     */
    Call(i_pszRemoteTmHostName, i_dwProtocol, i_dwOverwrite) {
        i_pszRemoteTmHostNameMarshal := i_pszRemoteTmHostName is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, i_pszRemoteTmHostNameMarshal, i_pszRemoteTmHostName, UInt32, i_dwProtocol, UInt32, i_dwOverwrite, "HRESULT")
        return result
    }

    /**
     * A DTC_INSTALL_CLIENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DTC_INSTALL_CLIENT {
        /**
         * Creates a DTC_INSTALL_CLIENT pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
