#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPPutSignedDataMsg {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPPutSignedDataMsg) {
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
     * @param {Integer} dwEncodingType 
     * @param {Pointer<Integer>} pdwIndex 
     * @param {Integer} cbSignedDataMsg 
     * @param {Pointer<Integer>} pbSignedDataMsg 
     * @returns {BOOL} 
     */
    Call(pSubjectInfo, dwEncodingType, pdwIndex, cbSignedDataMsg, pbSignedDataMsg) {
        pdwIndexMarshal := pdwIndex is VarRef ? "uint*" : "ptr"
        pbSignedDataMsgMarshal := pbSignedDataMsg is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjectInfo, UInt32, dwEncodingType, pdwIndexMarshal, pdwIndex, UInt32, cbSignedDataMsg, pbSignedDataMsgMarshal, pbSignedDataMsg, BOOL)
        return result
    }

    /**
     * A pCryptSIPPutSignedDataMsg that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPPutSignedDataMsg {
        /**
         * Creates a pCryptSIPPutSignedDataMsg pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, UInt32, "uint*", UInt32, "char*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, UInt32, "uint*", UInt32, "char*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
