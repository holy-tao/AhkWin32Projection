#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POWER_SETTING_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is POWER_SETTING_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} SettingGuid 
     * @param {Integer} Value 
     * @param {Integer} ValueLength 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(SettingGuid, Value, ValueLength, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, SettingGuid, IntPtr, Value, UInt32, ValueLength, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A POWER_SETTING_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POWER_SETTING_CALLBACK {
        /**
         * Creates a POWER_SETTING_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Guid, IntPtr, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, IntPtr, UInt32, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
