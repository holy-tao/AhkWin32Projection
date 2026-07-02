#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_WEB_CORE_ACTIVATE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WEB_CORE_ACTIVATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszAppHostConfigFile 
     * @param {PWSTR} pszRootWebConfigFile 
     * @param {PWSTR} pszInstanceName 
     * @returns {HRESULT} 
     */
    Call(pszAppHostConfigFile, pszRootWebConfigFile, pszInstanceName) {
        pszAppHostConfigFile := pszAppHostConfigFile is String ? StrPtr(pszAppHostConfigFile) : pszAppHostConfigFile
        pszRootWebConfigFile := pszRootWebConfigFile is String ? StrPtr(pszRootWebConfigFile) : pszRootWebConfigFile
        pszInstanceName := pszInstanceName is String ? StrPtr(pszInstanceName) : pszInstanceName

        result := DllCall(this.value, "ptr", pszAppHostConfigFile, "ptr", pszRootWebConfigFile, "ptr", pszInstanceName, "HRESULT")
        return result
    }

    /**
     * A PFN_WEB_CORE_ACTIVATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WEB_CORE_ACTIVATE {
        /**
         * Creates a PFN_WEB_CORE_ACTIVATE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
