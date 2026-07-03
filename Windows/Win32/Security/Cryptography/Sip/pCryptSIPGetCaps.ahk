#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SIP_CAP_SET_V3.ahk" { SIP_CAP_SET_V3 }
#Import ".\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }

/**
 * Is implemented by a subject interface package (SIP) to report capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/nc-mssip-pcryptsipgetcaps
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pCryptSIPGetCaps {
    value : IntPtr

    __value {
        set {
            if (value is pCryptSIPGetCaps) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjInfo Pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that specifies subject information data to the SIP APIs.
     * @param {Pointer<SIP_CAP_SET_V3>} pCaps Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mssip/ns-mssip-sip_cap_set_v2">SIP_CAP_SET</a> structure that defines the capabilities of an SIP.
     * @returns {BOOL} 
     */
    Call(pSubjInfo, pCaps) {
        result := DllCall(this.value, SIP_SUBJECTINFO.Ptr, pSubjInfo, SIP_CAP_SET_V3.Ptr, pCaps, BOOL)
        return result
    }

    /**
     * A pCryptSIPGetCaps that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pCryptSIPGetCaps {
        /**
         * Creates a pCryptSIPGetCaps pointer that invokes the given AHK function when called.
         * @param {Func(SIP_SUBJECTINFO, SIP_CAP_SET_V3) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SIP_SUBJECTINFO.Ptr, SIP_CAP_SET_V3.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
