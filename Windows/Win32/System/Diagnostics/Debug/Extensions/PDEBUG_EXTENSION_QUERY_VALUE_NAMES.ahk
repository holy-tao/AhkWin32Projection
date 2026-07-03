#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_QUERY_VALUE_NAMES {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_QUERY_VALUE_NAMES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Flags 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferChars 
     * @returns {Integer} 
     */
    Call(Client, Flags, _Buffer, BufferChars) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := DllCall(this.value, "ptr", Client, UInt32, Flags, "ptr", _Buffer, UInt32, BufferChars, "uint*", &BufferNeeded := 0, "HRESULT")
        return BufferNeeded
    }

    /**
     * A PDEBUG_EXTENSION_QUERY_VALUE_NAMES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_QUERY_VALUE_NAMES {
        /**
         * Creates a PDEBUG_EXTENSION_QUERY_VALUE_NAMES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, PWSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, PWSTR, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
