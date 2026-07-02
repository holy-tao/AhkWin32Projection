#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS {
    value : IntPtr

    __value {
        set {
            if (value is PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} resourceTypeName 
     * @param {PWSTR} processName 
     * @param {Integer} processId 
     * @param {BOOL} isAdd 
     * @returns {Integer} 
     */
    Call(resourceTypeName, processName, processId, isAdd) {
        resourceTypeName := resourceTypeName is String ? StrPtr(resourceTypeName) : resourceTypeName
        processName := processName is String ? StrPtr(processName) : processName

        result := DllCall(this.value, "ptr", resourceTypeName, "ptr", processName, UInt32, processId, BOOL, isAdd, UInt32)
        return result
    }

    /**
     * A PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS {
        /**
         * Creates a PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, BOOL, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
