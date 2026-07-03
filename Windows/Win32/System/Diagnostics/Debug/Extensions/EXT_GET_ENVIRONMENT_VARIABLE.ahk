#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_GET_ENVIRONMENT_VARIABLE {
    value : IntPtr

    __value {
        set {
            if (value is EXT_GET_ENVIRONMENT_VARIABLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Peb 
     * @param {PSTR} Variable 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    Call(_Peb, Variable, _Buffer, BufferSize) {
        Variable := Variable is String ? StrPtr(Variable) : Variable
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := DllCall(this.value, Int64, _Peb, "ptr", Variable, "ptr", _Buffer, UInt32, BufferSize, "HRESULT")
        return result
    }

    /**
     * A EXT_GET_ENVIRONMENT_VARIABLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_GET_ENVIRONMENT_VARIABLE {
        /**
         * Creates a EXT_GET_ENVIRONMENT_VARIABLE pointer that invokes the given AHK function when called.
         * @param {Func(Int64, PSTR, PSTR, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, PSTR, PSTR, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
