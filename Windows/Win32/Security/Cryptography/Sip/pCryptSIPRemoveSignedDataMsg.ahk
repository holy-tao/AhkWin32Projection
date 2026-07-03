#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPRemoveSignedDataMsg {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPRemoveSignedDataMsg) {
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
     * @param {Integer} dwIndex 
     * @returns {BOOL} 
     */
    Call(pSubjectInfo, dwIndex) {
        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjectInfo, UInt32, dwIndex, BOOL)
        return result
    }

    /**
     * A pCryptSIPRemoveSignedDataMsg that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPRemoveSignedDataMsg {
        /**
         * Creates a pCryptSIPRemoveSignedDataMsg pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
