#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCONN.ahk" { HCONN }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_IIS_READCLIENT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IIS_READCLIENT) {
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
     * @param {Pointer<Void>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCONN, param0, param1Marshal, param1, param2Marshal, param2, BOOL)
        return result
    }

    /**
     * A PFN_IIS_READCLIENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IIS_READCLIENT {
        /**
         * Creates a PFN_IIS_READCLIENT pointer that invokes the given AHK function when called.
         * @param {Func(HCONN, "ptr", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCONN, "ptr", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
