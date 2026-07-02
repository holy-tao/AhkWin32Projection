#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_WEB_CORE_SET_METADATA_DLL_ENTRY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WEB_CORE_SET_METADATA_DLL_ENTRY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszMetadataType 
     * @param {PWSTR} pszValue 
     * @returns {HRESULT} 
     */
    Call(pszMetadataType, pszValue) {
        pszMetadataType := pszMetadataType is String ? StrPtr(pszMetadataType) : pszMetadataType
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := DllCall(this.value, "ptr", pszMetadataType, "ptr", pszValue, "HRESULT")
        return result
    }

    /**
     * A PFN_WEB_CORE_SET_METADATA_DLL_ENTRY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WEB_CORE_SET_METADATA_DLL_ENTRY {
        /**
         * Creates a PFN_WEB_CORE_SET_METADATA_DLL_ENTRY pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
