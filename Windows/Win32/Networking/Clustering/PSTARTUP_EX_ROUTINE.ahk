#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLRES_CALLBACK_FUNCTION_TABLE.ahk" { CLRES_CALLBACK_FUNCTION_TABLE }
#Import ".\CLRES_FUNCTION_TABLE.ahk" { CLRES_FUNCTION_TABLE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSTARTUP_EX_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSTARTUP_EX_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} _ResourceType 
     * @param {Integer} MinVersionSupported 
     * @param {Integer} MaxVersionSupported 
     * @param {Pointer<CLRES_CALLBACK_FUNCTION_TABLE>} MonitorCallbackFunctions 
     * @param {Pointer<Pointer<CLRES_FUNCTION_TABLE>>} ResourceDllInterfaceFunctions 
     * @returns {Integer} 
     */
    Call(_ResourceType, MinVersionSupported, MaxVersionSupported, MonitorCallbackFunctions, ResourceDllInterfaceFunctions) {
        _ResourceType := _ResourceType is String ? StrPtr(_ResourceType) : _ResourceType

        ResourceDllInterfaceFunctionsMarshal := ResourceDllInterfaceFunctions is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", _ResourceType, UInt32, MinVersionSupported, UInt32, MaxVersionSupported, CLRES_CALLBACK_FUNCTION_TABLE.Ptr, MonitorCallbackFunctions, ResourceDllInterfaceFunctionsMarshal, ResourceDllInterfaceFunctions, UInt32)
        return result
    }

    /**
     * A PSTARTUP_EX_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSTARTUP_EX_ROUTINE {
        /**
         * Creates a PSTARTUP_EX_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, UInt32, CLRES_CALLBACK_FUNCTION_TABLE, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, UInt32, CLRES_CALLBACK_FUNCTION_TABLE.Ptr, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
