#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_INITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_INITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} _Version 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    Call(_Version, Flags) {
        _VersionMarshal := _Version is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _VersionMarshal, _Version, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_EXTENSION_INITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_INITIALIZE {
        /**
         * Creates a PDEBUG_EXTENSION_INITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
