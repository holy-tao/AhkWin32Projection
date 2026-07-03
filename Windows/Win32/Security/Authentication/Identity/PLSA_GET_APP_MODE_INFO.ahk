#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_APP_MODE_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_APP_MODE_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} UserFunction 
     * @param {Pointer<Pointer>} Argument1 
     * @param {Pointer<Pointer>} Argument2 
     * @param {Pointer<SecBuffer>} _UserData 
     * @param {Pointer<BOOLEAN>} ReturnToLsa 
     * @returns {NTSTATUS} 
     */
    Call(UserFunction, Argument1, Argument2, _UserData, ReturnToLsa) {
        UserFunctionMarshal := UserFunction is VarRef ? "uint*" : "ptr"
        Argument1Marshal := Argument1 is VarRef ? "ptr*" : "ptr"
        Argument2Marshal := Argument2 is VarRef ? "ptr*" : "ptr"
        ReturnToLsaMarshal := ReturnToLsa is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UserFunctionMarshal, UserFunction, Argument1Marshal, Argument1, Argument2Marshal, Argument2, SecBuffer.Ptr, _UserData, ReturnToLsaMarshal, ReturnToLsa, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_GET_APP_MODE_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_APP_MODE_INFO {
        /**
         * Creates a PLSA_GET_APP_MODE_INFO pointer that invokes the given AHK function when called.
         * @param {Func("uint*", "ptr*", "ptr*", SecBuffer, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", "ptr*", "ptr*", SecBuffer.Ptr, BOOLEAN.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
