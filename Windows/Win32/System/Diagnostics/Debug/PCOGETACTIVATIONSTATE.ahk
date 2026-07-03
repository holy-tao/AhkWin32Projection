#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PCOGETACTIVATIONSTATE {
    value : IntPtr

    __value {
        set {
            if (value is PCOGETACTIVATIONSTATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, Guid, param0, UInt32, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * A PCOGETACTIVATIONSTATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCOGETACTIVATIONSTATE {
        /**
         * Creates a PCOGETACTIVATIONSTATE pointer that invokes the given AHK function when called.
         * @param {Func(Guid, UInt32, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, UInt32, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
