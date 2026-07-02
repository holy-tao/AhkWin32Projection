#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROG_INVOKE_SETTING.ahk" { PROG_INVOKE_SETTING }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct FN_PROGRESS {
    value : IntPtr

    __value {
        set {
            if (value is FN_PROGRESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pObjectName 
     * @param {Integer} _Status 
     * @param {Pointer<PROG_INVOKE_SETTING>} pInvokeSetting 
     * @param {Pointer<Void>} Args 
     * @param {BOOL} SecuritySet 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pObjectName, _Status, pInvokeSetting, Args, SecuritySet) {
        pObjectName := pObjectName is String ? StrPtr(pObjectName) : pObjectName

        pInvokeSettingMarshal := pInvokeSetting is VarRef ? "int*" : "ptr"
        ArgsMarshal := Args is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "ptr", pObjectName, UInt32, _Status, pInvokeSettingMarshal, pInvokeSetting, ArgsMarshal, Args, BOOL, SecuritySet)
    }

    /**
     * A FN_PROGRESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FN_PROGRESS {
        /**
         * Creates a FN_PROGRESS pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "int*", "ptr", BOOL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "int*", "ptr", BOOL, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
