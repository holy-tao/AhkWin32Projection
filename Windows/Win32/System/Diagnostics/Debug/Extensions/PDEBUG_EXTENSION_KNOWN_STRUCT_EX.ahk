#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_KNOWN_STRUCT_EX {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_KNOWN_STRUCT_EX) {
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
     * @param {Integer} Offset 
     * @param {PSTR} TypeName 
     * @param {PSTR} _Buffer 
     * @param {Pointer<Integer>} BufferChars 
     * @returns {HRESULT} 
     */
    Call(Client, Flags, Offset, TypeName, _Buffer, BufferChars) {
        TypeName := TypeName is String ? StrPtr(TypeName) : TypeName
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        BufferCharsMarshal := BufferChars is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", Client, UInt32, Flags, Int64, Offset, "ptr", TypeName, "ptr", _Buffer, BufferCharsMarshal, BufferChars, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_EXTENSION_KNOWN_STRUCT_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_KNOWN_STRUCT_EX {
        /**
         * Creates a PDEBUG_EXTENSION_KNOWN_STRUCT_EX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, Int64, PSTR, PSTR, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, Int64, PSTR, PSTR, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
