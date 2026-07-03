#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_PROVIDE_VALUE {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_PROVIDE_VALUE) {
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
     * @param {PWSTR} Name 
     * @param {Pointer<Integer>} Value 
     * @param {Pointer<Integer>} TypeModBase 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} _TypeFlags 
     * @returns {HRESULT} 
     */
    Call(Client, Flags, Name, Value, TypeModBase, TypeId, _TypeFlags) {
        Name := Name is String ? StrPtr(Name) : Name

        ValueMarshal := Value is VarRef ? "uint*" : "ptr"
        TypeModBaseMarshal := TypeModBase is VarRef ? "uint*" : "ptr"
        TypeIdMarshal := TypeId is VarRef ? "uint*" : "ptr"
        _TypeFlagsMarshal := _TypeFlags is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", Client, UInt32, Flags, "ptr", Name, ValueMarshal, Value, TypeModBaseMarshal, TypeModBase, TypeIdMarshal, TypeId, _TypeFlagsMarshal, _TypeFlags, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_EXTENSION_PROVIDE_VALUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_PROVIDE_VALUE {
        /**
         * Creates a PDEBUG_EXTENSION_PROVIDE_VALUE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, PWSTR, "uint*", "uint*", "uint*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, PWSTR, "uint*", "uint*", "uint*", "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
