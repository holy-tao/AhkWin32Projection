#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_PROVIDER_DEFUSAGE.ahk" { CRYPT_PROVIDER_DEFUSAGE }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_ALLOCANDFILLDEFUSAGE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_ALLOCANDFILLDEFUSAGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pszUsageOID 
     * @param {Pointer<CRYPT_PROVIDER_DEFUSAGE>} psDefUsage 
     * @returns {BOOL} 
     */
    Call(pszUsageOID, psDefUsage) {
        pszUsageOID := pszUsageOID is String ? StrPtr(pszUsageOID) : pszUsageOID

        result := DllCall(this.value, "ptr", pszUsageOID, CRYPT_PROVIDER_DEFUSAGE.Ptr, psDefUsage, BOOL)
        return result
    }

    /**
     * A PFN_ALLOCANDFILLDEFUSAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_ALLOCANDFILLDEFUSAGE {
        /**
         * Creates a PFN_ALLOCANDFILLDEFUSAGE pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, CRYPT_PROVIDER_DEFUSAGE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, CRYPT_PROVIDER_DEFUSAGE.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
