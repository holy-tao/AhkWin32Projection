#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PGET_RESOURCE_STRING_FN {
    value : IntPtr

    __value {
        set {
            if (value is PGET_RESOURCE_STRING_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwMsgID 
     * @param {PWSTR} lpBuffer 
     * @param {Integer} nBufferMax 
     * @returns {Integer} 
     */
    Call(dwMsgID, lpBuffer, nBufferMax) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall(this.value, UInt32, dwMsgID, "ptr", lpBuffer, UInt32, nBufferMax, UInt32)
        return result
    }

    /**
     * A PGET_RESOURCE_STRING_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_RESOURCE_STRING_FN {
        /**
         * Creates a PGET_RESOURCE_STRING_FN pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
