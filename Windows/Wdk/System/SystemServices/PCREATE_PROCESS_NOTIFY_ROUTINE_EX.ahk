#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }
#Import ".\PS_CREATE_NOTIFY_INFO.ahk" { PS_CREATE_NOTIFY_INFO }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCREATE_PROCESS_NOTIFY_ROUTINE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCREATE_PROCESS_NOTIFY_ROUTINE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {HANDLE} ProcessId 
     * @param {Pointer<PS_CREATE_NOTIFY_INFO>} CreateInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Process, ProcessId, CreateInfo) {
        DllCall(this.value, PEPROCESS, Process, HANDLE, ProcessId, PS_CREATE_NOTIFY_INFO.Ptr, CreateInfo)
    }

    /**
     * A PCREATE_PROCESS_NOTIFY_ROUTINE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCREATE_PROCESS_NOTIFY_ROUTINE_EX {
        /**
         * Creates a PCREATE_PROCESS_NOTIFY_ROUTINE_EX pointer that invokes the given AHK function when called.
         * @param {Func(PEPROCESS, HANDLE, PS_CREATE_NOTIFY_INFO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PEPROCESS, HANDLE, PS_CREATE_NOTIFY_INFO.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
