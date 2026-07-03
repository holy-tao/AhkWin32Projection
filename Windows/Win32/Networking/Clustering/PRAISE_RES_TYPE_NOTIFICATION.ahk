#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRAISE_RES_TYPE_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PRAISE_RES_TYPE_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} _ResourceType 
     * @param {Integer} pPayload 
     * @param {Integer} payloadSize 
     * @returns {Integer} 
     */
    Call(_ResourceType, pPayload, payloadSize) {
        _ResourceType := _ResourceType is String ? StrPtr(_ResourceType) : _ResourceType

        result := DllCall(this.value, "ptr", _ResourceType, IntPtr, pPayload, UInt32, payloadSize, UInt32)
        return result
    }

    /**
     * A PRAISE_RES_TYPE_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRAISE_RES_TYPE_NOTIFICATION {
        /**
         * Creates a PRAISE_RES_TYPE_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, IntPtr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
