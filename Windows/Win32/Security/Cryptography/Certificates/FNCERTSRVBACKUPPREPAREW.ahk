#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVBACKUPPREPAREW {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVBACKUPPREPAREW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pwszServerName 
     * @param {Integer} grbitJet 
     * @param {Integer} dwBackupFlags 
     * @param {Pointer<Pointer<Void>>} phbc 
     * @returns {HRESULT} 
     */
    Call(pwszServerName, grbitJet, dwBackupFlags, phbc) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        phbcMarshal := phbc is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pwszServerName, UInt32, grbitJet, UInt32, dwBackupFlags, phbcMarshal, phbc, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVBACKUPPREPAREW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVBACKUPPREPAREW {
        /**
         * Creates a FNCERTSRVBACKUPPREPAREW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, UInt32, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, UInt32, "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
