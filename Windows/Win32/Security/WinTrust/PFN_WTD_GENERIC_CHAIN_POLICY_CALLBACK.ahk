#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }
#Import ".\WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO.ahk" { WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData 
     * @param {Integer} dwStepError 
     * @param {Integer} dwRegPolicySettings 
     * @param {Integer} cSigner 
     * @param {Pointer<Pointer<WTD_GENERIC_CHAIN_POLICY_SIGNER_INFO>>} rgpSigner 
     * @param {Pointer<Void>} pvPolicyArg 
     * @returns {HRESULT} 
     */
    Call(pProvData, dwStepError, dwRegPolicySettings, cSigner, rgpSigner, pvPolicyArg) {
        rgpSignerMarshal := rgpSigner is VarRef ? "ptr*" : "ptr"
        pvPolicyArgMarshal := pvPolicyArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, UInt32, dwStepError, UInt32, dwRegPolicySettings, UInt32, cSigner, rgpSignerMarshal, rgpSigner, pvPolicyArgMarshal, pvPolicyArg, "HRESULT")
        return result
    }

    /**
     * A PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK {
        /**
         * Creates a PFN_WTD_GENERIC_CHAIN_POLICY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA, UInt32, UInt32, UInt32, "ptr*", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, UInt32, UInt32, UInt32, "ptr*", "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
