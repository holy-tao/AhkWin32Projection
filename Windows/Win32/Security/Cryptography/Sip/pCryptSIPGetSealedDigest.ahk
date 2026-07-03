#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPGetSealedDigest {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPGetSealedDigest) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo 
     * @param {Pointer<Integer>} pSig 
     * @param {Integer} dwSig 
     * @param {Pointer<Integer>} pbDigest 
     * @param {Pointer<Integer>} pcbDigest 
     * @returns {BOOL} 
     */
    Call(pSubjectInfo, pSig, dwSig, pbDigest, pcbDigest) {
        pSigMarshal := pSig is VarRef ? "char*" : "ptr"
        pbDigestMarshal := pbDigest is VarRef ? "char*" : "ptr"
        pcbDigestMarshal := pcbDigest is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjectInfo, pSigMarshal, pSig, UInt32, dwSig, pbDigestMarshal, pbDigest, pcbDigestMarshal, pcbDigest, BOOL)
        return result
    }

    /**
     * A pCryptSIPGetSealedDigest that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPGetSealedDigest {
        /**
         * Creates a pCryptSIPGetSealedDigest pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, "char*", UInt32, "char*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, "char*", UInt32, "char*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
