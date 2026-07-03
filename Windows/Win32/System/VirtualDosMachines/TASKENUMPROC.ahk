#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct TASKENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is TASKENUMPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Integer} hMod16 
     * @param {Integer} hTask16 
     * @param {LPARAM} lpUserDefined 
     * @returns {BOOL} 
     */
    Call(dwThreadId, hMod16, hTask16, lpUserDefined) {
        result := DllCall(this.value, UInt32, dwThreadId, UInt16, hMod16, UInt16, hTask16, LPARAM, lpUserDefined, BOOL)
        return result
    }

    /**
     * A TASKENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TASKENUMPROC {
        /**
         * Creates a TASKENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt16, UInt16, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt16, UInt16, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
