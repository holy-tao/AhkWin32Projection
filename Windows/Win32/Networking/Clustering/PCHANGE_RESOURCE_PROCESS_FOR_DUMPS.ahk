#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCHANGE_RESOURCE_PROCESS_FOR_DUMPS {
    value : IntPtr

    __value {
        set {
            if (value is PCHANGE_RESOURCE_PROCESS_FOR_DUMPS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} resource 
     * @param {PWSTR} processName 
     * @param {Integer} processId 
     * @param {BOOL} isAdd 
     * @returns {Integer} 
     */
    Call(resource, processName, processId, isAdd) {
        processName := processName is String ? StrPtr(processName) : processName

        result := DllCall(this.value, IntPtr, resource, "ptr", processName, UInt32, processId, BOOL, isAdd, UInt32)
        return result
    }

    /**
     * A PCHANGE_RESOURCE_PROCESS_FOR_DUMPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCHANGE_RESOURCE_PROCESS_FOR_DUMPS {
        /**
         * Creates a PCHANGE_RESOURCE_PROCESS_FOR_DUMPS pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, PWSTR, UInt32, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, PWSTR, UInt32, BOOL, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
