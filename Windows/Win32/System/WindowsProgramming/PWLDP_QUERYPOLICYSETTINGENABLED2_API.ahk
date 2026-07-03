#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYPOLICYSETTINGENABLED2_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYPOLICYSETTINGENABLED2_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} Setting 
     * @returns {BOOL} 
     */
    Call(Setting) {
        Setting := Setting is String ? StrPtr(Setting) : Setting

        result := DllCall(this.value, "ptr", Setting, BOOL.Ptr, &Enabled := 0, "HRESULT")
        return Enabled
    }

    /**
     * A PWLDP_QUERYPOLICYSETTINGENABLED2_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYPOLICYSETTINGENABLED2_API {
        /**
         * Creates a PWLDP_QUERYPOLICYSETTINGENABLED2_API pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
