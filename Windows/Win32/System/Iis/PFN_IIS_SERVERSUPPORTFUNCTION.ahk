#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCONN.ahk" { HCONN }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_IIS_SERVERSUPPORTFUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IIS_SERVERSUPPORTFUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCONN} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCONN, param0, UInt32, param1, param2Marshal, param2, param3Marshal, param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A PFN_IIS_SERVERSUPPORTFUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IIS_SERVERSUPPORTFUNCTION {
        /**
         * Creates a PFN_IIS_SERVERSUPPORTFUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(HCONN, UInt32, "ptr", "uint*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCONN, UInt32, "ptr", "uint*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
