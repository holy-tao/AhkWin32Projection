#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RASCOMMSETTINGS.ahk" { RASCOMMSETTINGS }

/**
 * Call RasSetCommSettings from a custom-scripting DLL to change the settings on the port for the connection.
 * @remarks
 * RAS passes the custom-scripting DLL a pointer to the 
 * <b>RasSetCommSettings</b> function when RAS calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>. The pointer is stored in the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376738(v=vs.85)">RASCUSTOMSCRIPTEXTENSIONS</a> structure that is passed as the last parameter of 
 * <b>RasCustomScriptExecute</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-pfnrassetcommsettings
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PFNRASSETCOMMSETTINGS {
    value : IntPtr

    __value {
        set {
            if (value is PFNRASSETCOMMSETTINGS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hPort Handle to the port on which to apply the settings. This handle is passed to the custom-scripting DLL in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a> function.
     * @param {Pointer<RASCOMMSETTINGS>} pRasCommSettings Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376724(v=vs.85)">RASCOMMSETTINGS</a> structure that specifies the settings to be applied to the port.
     * @param {Pointer<Void>} pvReserved Reserved for future use. This parameter must be <b>NULL</b>.
     * @returns {Integer} This callback function does not return a value.
     */
    Call(hPort, pRasCommSettings, pvReserved) {
        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, hPort, RASCOMMSETTINGS.Ptr, pRasCommSettings, pvReservedMarshal, pvReserved, UInt32)
        return result
    }

    /**
     * A PFNRASSETCOMMSETTINGS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNRASSETCOMMSETTINGS {
        /**
         * Creates a PFNRASSETCOMMSETTINGS pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, RASCOMMSETTINGS, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, RASCOMMSETTINGS.Ptr, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
