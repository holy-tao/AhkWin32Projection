#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCONN.ahk" { HCONN }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_IIS_WRITECLIENT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IIS_WRITECLIENT) {
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
     * @param {Integer} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCONN, param0, param1Marshal, param1, param2Marshal, param2, UInt32, param3, BOOL)
        return result
    }

    /**
     * A PFN_IIS_WRITECLIENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IIS_WRITECLIENT {
        /**
         * Creates a PFN_IIS_WRITECLIENT pointer that invokes the given AHK function when called.
         * @param {Func(HCONN, "ptr", "uint*", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCONN, "ptr", "uint*", UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
