#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_HSE_GET_PROTOCOL_MANAGER_CUSTOM_INTERFACE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_HSE_GET_PROTOCOL_MANAGER_CUSTOM_INTERFACE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszProtocolManagerDll 
     * @param {PWSTR} pszProtocolManagerDllInitFunction 
     * @param {Integer} dwCustomInterfaceId 
     * @param {Pointer<Pointer<Void>>} ppCustomInterface 
     * @returns {HRESULT} 
     */
    Call(pszProtocolManagerDll, pszProtocolManagerDllInitFunction, dwCustomInterfaceId, ppCustomInterface) {
        pszProtocolManagerDll := pszProtocolManagerDll is String ? StrPtr(pszProtocolManagerDll) : pszProtocolManagerDll
        pszProtocolManagerDllInitFunction := pszProtocolManagerDllInitFunction is String ? StrPtr(pszProtocolManagerDllInitFunction) : pszProtocolManagerDllInitFunction

        ppCustomInterfaceMarshal := ppCustomInterface is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pszProtocolManagerDll, "ptr", pszProtocolManagerDllInitFunction, UInt32, dwCustomInterfaceId, ppCustomInterfaceMarshal, ppCustomInterface, "HRESULT")
        return result
    }

    /**
     * A PFN_HSE_GET_PROTOCOL_MANAGER_CUSTOM_INTERFACE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_HSE_GET_PROTOCOL_MANAGER_CUSTOM_INTERFACE_CALLBACK {
        /**
         * Creates a PFN_HSE_GET_PROTOCOL_MANAGER_CUSTOM_INTERFACE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
