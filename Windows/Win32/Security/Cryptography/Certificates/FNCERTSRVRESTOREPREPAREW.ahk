#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVRESTOREPREPAREW {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVRESTOREPREPAREW) {
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
     * @param {Integer} dwRestoreFlags 
     * @param {Pointer<Pointer<Void>>} phbc 
     * @returns {HRESULT} 
     */
    Call(pwszServerName, dwRestoreFlags, phbc) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        phbcMarshal := phbc is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pwszServerName, UInt32, dwRestoreFlags, phbcMarshal, phbc, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVRESTOREPREPAREW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVRESTOREPREPAREW {
        /**
         * Creates a FNCERTSRVRESTOREPREPAREW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
