#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPGetSignedDataMsg {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPGetSignedDataMsg) {
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
     * @param {Pointer<Integer>} pdwEncodingType 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} pcbSignedDataMsg 
     * @param {Pointer<Integer>} pbSignedDataMsg 
     * @returns {BOOL} 
     */
    Call(pSubjectInfo, pdwEncodingType, dwIndex, pcbSignedDataMsg, pbSignedDataMsg) {
        pdwEncodingTypeMarshal := pdwEncodingType is VarRef ? "uint*" : "ptr"
        pcbSignedDataMsgMarshal := pcbSignedDataMsg is VarRef ? "uint*" : "ptr"
        pbSignedDataMsgMarshal := pbSignedDataMsg is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjectInfo, pdwEncodingTypeMarshal, pdwEncodingType, UInt32, dwIndex, pcbSignedDataMsgMarshal, pcbSignedDataMsg, pbSignedDataMsgMarshal, pbSignedDataMsg, BOOL)
        return result
    }

    /**
     * A pCryptSIPGetSignedDataMsg that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPGetSignedDataMsg {
        /**
         * Creates a pCryptSIPGetSignedDataMsg pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, "uint*", UInt32, "uint*", "char*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, "uint*", UInt32, "uint*", "char*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
