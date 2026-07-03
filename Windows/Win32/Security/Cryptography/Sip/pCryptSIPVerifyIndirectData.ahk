#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_INDIRECT_DATA.ahk" { SIP_INDIRECT_DATA }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPVerifyIndirectData {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPVerifyIndirectData) {
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
     * @param {Pointer<SIP_INDIRECT_DATA>} pIndirectData 
     * @returns {BOOL} 
     */
    Call(pSubjectInfo, pIndirectData) {
        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjectInfo, SIP_INDIRECT_DATA.Ptr, pIndirectData, BOOL)
        return result
    }

    /**
     * A pCryptSIPVerifyIndirectData that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPVerifyIndirectData {
        /**
         * Creates a pCryptSIPVerifyIndirectData pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, SIP_INDIRECT_DATA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, SIP_INDIRECT_DATA.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
