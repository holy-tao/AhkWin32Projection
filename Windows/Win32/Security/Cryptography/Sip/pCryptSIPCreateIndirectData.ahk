#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_INDIRECT_DATA.ahk" { SIP_INDIRECT_DATA }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPCreateIndirectData {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPCreateIndirectData) {
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
     * @param {Pointer<Integer>} pcbIndirectData 
     * @param {Pointer<SIP_INDIRECT_DATA>} pIndirectData 
     * @returns {BOOL} 
     */
    Call(pSubjectInfo, pcbIndirectData, pIndirectData) {
        pcbIndirectDataMarshal := pcbIndirectData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjectInfo, pcbIndirectDataMarshal, pcbIndirectData, SIP_INDIRECT_DATA.Ptr, pIndirectData, BOOL)
        return result
    }

    /**
     * A pCryptSIPCreateIndirectData that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPCreateIndirectData {
        /**
         * Creates a pCryptSIPCreateIndirectData pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, "uint*", SIP_INDIRECT_DATA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, "uint*", SIP_INDIRECT_DATA.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
