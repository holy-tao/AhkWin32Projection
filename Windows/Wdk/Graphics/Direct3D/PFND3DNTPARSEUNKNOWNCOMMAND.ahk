#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DNTPARSEUNKNOWNCOMMAND {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DNTPARSEUNKNOWNCOMMAND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpvCommands 
     * @param {Pointer<Pointer<Void>>} lplpvReturnedCommand 
     * @returns {HRESULT} 
     */
    Call(lpvCommands, lplpvReturnedCommand) {
        lpvCommandsMarshal := lpvCommands is VarRef ? "ptr" : "ptr"
        lplpvReturnedCommandMarshal := lplpvReturnedCommand is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, lpvCommandsMarshal, lpvCommands, lplpvReturnedCommandMarshal, lplpvReturnedCommand, "HRESULT")
        return result
    }

    /**
     * A PFND3DNTPARSEUNKNOWNCOMMAND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DNTPARSEUNKNOWNCOMMAND {
        /**
         * Creates a PFND3DNTPARSEUNKNOWNCOMMAND pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
