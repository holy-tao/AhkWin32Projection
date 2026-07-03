#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct LPFNGETCLASSOBJECT {
    value : IntPtr

    __value {
        set {
            if (value is LPFNGETCLASSOBJECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Guid>} param1 
     * @param {Pointer<Pointer<Void>>} param2 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, param0, Guid.Ptr, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * A LPFNGETCLASSOBJECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNGETCLASSOBJECT {
        /**
         * Creates a LPFNGETCLASSOBJECT pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Guid, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Guid.Ptr, "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
