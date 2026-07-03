#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\POWER_POLICY.ahk" { POWER_POLICY }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PWRSCHEMESENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is PWRSCHEMESENUMPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} NameSize 
     * @param {Integer} Name 
     * @param {Integer} DescriptionSize 
     * @param {Integer} Description 
     * @param {Pointer<POWER_POLICY>} Policy 
     * @param {LPARAM} _Context 
     * @returns {BOOLEAN} 
     */
    Call(Index, NameSize, Name, DescriptionSize, Description, Policy, _Context) {
        result := DllCall(this.value, UInt32, Index, UInt32, NameSize, IntPtr, Name, UInt32, DescriptionSize, IntPtr, Description, POWER_POLICY.Ptr, Policy, LPARAM, _Context, BOOLEAN)
        return result
    }

    /**
     * A PWRSCHEMESENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWRSCHEMESENUMPROC {
        /**
         * Creates a PWRSCHEMESENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, IntPtr, UInt32, IntPtr, POWER_POLICY, LPARAM) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, IntPtr, UInt32, IntPtr, POWER_POLICY.Ptr, LPARAM, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
