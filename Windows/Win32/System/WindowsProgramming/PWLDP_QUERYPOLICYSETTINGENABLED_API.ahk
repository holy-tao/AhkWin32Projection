#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WLDP_POLICY_SETTING.ahk" { WLDP_POLICY_SETTING }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYPOLICYSETTINGENABLED_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYPOLICYSETTINGENABLED_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WLDP_POLICY_SETTING} Setting 
     * @returns {BOOL} 
     */
    Call(Setting) {
        result := DllCall(this.value, WLDP_POLICY_SETTING, Setting, BOOL.Ptr, &Enabled := 0, "HRESULT")
        return Enabled
    }

    /**
     * A PWLDP_QUERYPOLICYSETTINGENABLED_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYPOLICYSETTINGENABLED_API {
        /**
         * Creates a PWLDP_QUERYPOLICYSETTINGENABLED_API pointer that invokes the given AHK function when called.
         * @param {Func(WLDP_POLICY_SETTING) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WLDP_POLICY_SETTING, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
