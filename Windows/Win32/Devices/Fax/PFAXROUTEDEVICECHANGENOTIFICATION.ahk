#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEDEVICECHANGENOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEDEVICECHANGENOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {BOOL} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, UInt32, param0, BOOL, param1, BOOL)
        return result
    }

    /**
     * A PFAXROUTEDEVICECHANGENOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEDEVICECHANGENOTIFICATION {
        /**
         * Creates a PFAXROUTEDEVICECHANGENOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOL, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
