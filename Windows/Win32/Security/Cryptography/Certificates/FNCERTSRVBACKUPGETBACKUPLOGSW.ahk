#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVBACKUPGETBACKUPLOGSW {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVBACKUPGETBACKUPLOGSW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hbc 
     * @param {Pointer<Pointer<Integer>>} ppwszzBackupLogFiles 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    Call(hbc, ppwszzBackupLogFiles, pcbSize) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        ppwszzBackupLogFilesMarshal := ppwszzBackupLogFiles is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, hbcMarshal, hbc, ppwszzBackupLogFilesMarshal, ppwszzBackupLogFiles, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVBACKUPGETBACKUPLOGSW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVBACKUPGETBACKUPLOGSW {
        /**
         * Creates a FNCERTSRVBACKUPGETBACKUPLOGSW pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
