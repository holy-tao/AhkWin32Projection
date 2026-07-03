#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_QUERY_REGISTRY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_QUERY_REGISTRY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} _ValueName 
     * @param {Integer} ValueType 
     * @param {Integer} ValueData 
     * @param {Integer} ValueLength 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Void>} EntryContext 
     * @returns {NTSTATUS} 
     */
    Call(_ValueName, ValueType, ValueData, ValueLength, _Context, EntryContext) {
        _ValueName := _ValueName is String ? StrPtr(_ValueName) : _ValueName

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        EntryContextMarshal := EntryContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", _ValueName, UInt32, ValueType, IntPtr, ValueData, UInt32, ValueLength, _ContextMarshal, _Context, EntryContextMarshal, EntryContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A RTL_QUERY_REGISTRY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_QUERY_REGISTRY_ROUTINE {
        /**
         * Creates a RTL_QUERY_REGISTRY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, IntPtr, UInt32, "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, IntPtr, UInt32, "ptr", "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
