#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVISSERVERONLINEW {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVISSERVERONLINEW) {
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
     * @param {Pointer<BOOL>} pfServerOnline 
     * @returns {HRESULT} 
     */
    Call(pwszServerName, pfServerOnline) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        pfServerOnlineMarshal := pfServerOnline is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", pwszServerName, pfServerOnlineMarshal, pfServerOnline, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVISSERVERONLINEW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVISSERVERONLINEW {
        /**
         * Creates a FNCERTSRVISSERVERONLINEW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, BOOL) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
