#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCREATE_PROCESS_NOTIFY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PCREATE_PROCESS_NOTIFY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} ParentId 
     * @param {HANDLE} ProcessId 
     * @param {BOOLEAN} Create 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ParentId, ProcessId, Create) {
        DllCall(this.value, HANDLE, ParentId, HANDLE, ProcessId, BOOLEAN, Create)
    }

    /**
     * A PCREATE_PROCESS_NOTIFY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCREATE_PROCESS_NOTIFY_ROUTINE {
        /**
         * Creates a PCREATE_PROCESS_NOTIFY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, BOOLEAN, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
