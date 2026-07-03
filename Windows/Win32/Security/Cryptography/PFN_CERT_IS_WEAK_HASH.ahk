#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_IS_WEAK_HASH {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_IS_WEAK_HASH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwHashUseType 
     * @param {PWSTR} pwszCNGHashAlgid 
     * @param {Integer} dwChainFlags 
     * @param {Pointer<CERT_CHAIN_CONTEXT>} pSignerChainContext 
     * @param {Pointer<FILETIME>} pTimeStamp 
     * @param {PWSTR} pwszFileName 
     * @returns {BOOL} 
     */
    Call(dwHashUseType, pwszCNGHashAlgid, dwChainFlags, pSignerChainContext, pTimeStamp, pwszFileName) {
        pwszCNGHashAlgid := pwszCNGHashAlgid is String ? StrPtr(pwszCNGHashAlgid) : pwszCNGHashAlgid
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := DllCall(this.value, UInt32, dwHashUseType, "ptr", pwszCNGHashAlgid, UInt32, dwChainFlags, CERT_CHAIN_CONTEXT.Ptr, pSignerChainContext, FILETIME.Ptr, pTimeStamp, "ptr", pwszFileName, BOOL)
        return result
    }

    /**
     * A PFN_CERT_IS_WEAK_HASH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_IS_WEAK_HASH {
        /**
         * Creates a PFN_CERT_IS_WEAK_HASH pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, UInt32, CERT_CHAIN_CONTEXT, FILETIME, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, UInt32, CERT_CHAIN_CONTEXT.Ptr, FILETIME.Ptr, PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
