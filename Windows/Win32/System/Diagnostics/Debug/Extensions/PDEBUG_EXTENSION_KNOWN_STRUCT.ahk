#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_KNOWN_STRUCT {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_KNOWN_STRUCT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Offset 
     * @param {PSTR} TypeName 
     * @param {PSTR} _Buffer 
     * @param {Pointer<Integer>} BufferChars 
     * @returns {HRESULT} 
     */
    Call(Flags, Offset, TypeName, _Buffer, BufferChars) {
        TypeName := TypeName is String ? StrPtr(TypeName) : TypeName
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        BufferCharsMarshal := BufferChars is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, Flags, Int64, Offset, "ptr", TypeName, "ptr", _Buffer, BufferCharsMarshal, BufferChars, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_EXTENSION_KNOWN_STRUCT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_KNOWN_STRUCT {
        /**
         * Creates a PDEBUG_EXTENSION_KNOWN_STRUCT pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Int64, PSTR, PSTR, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int64, PSTR, PSTR, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
