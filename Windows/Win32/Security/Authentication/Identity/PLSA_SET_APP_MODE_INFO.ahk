#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_SET_APP_MODE_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_SET_APP_MODE_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * @param {Integer} UserFunction 
     * @param {Pointer} Argument1 
     * @param {Pointer} Argument2 
     * @param {Pointer<SecBuffer>} _UserData 
     * @param {BOOLEAN} ReturnToLsa 
     * @returns {NTSTATUS} 
     */
    Call(UserFunction, Argument1, Argument2, _UserData, ReturnToLsa) {
        Argument1Marshal := Argument1 == 0 ? IntPtr : IntPtr
        Argument2Marshal := Argument2 == 0 ? IntPtr : IntPtr
        _UserDataMarshal := _UserData == 0 ? IntPtr : SecBuffer.Ptr
        ReturnToLsaMarshal := ReturnToLsa == 0 ? IntPtr : BOOLEAN

        result := DllCall(this.value, UInt32, UserFunction, Argument1Marshal, Argument1, Argument2Marshal, Argument2, _UserDataMarshal, _UserData, ReturnToLsaMarshal, ReturnToLsa, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_SET_APP_MODE_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_SET_APP_MODE_INFO {
        /**
         * Creates a PLSA_SET_APP_MODE_INFO pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, IntPtr, IntPtr, SecBuffer, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, IntPtr, IntPtr, SecBuffer.Ptr, BOOLEAN, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
