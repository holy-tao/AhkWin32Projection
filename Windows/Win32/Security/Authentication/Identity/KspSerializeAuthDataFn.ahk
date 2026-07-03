#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspSerializeAuthDataFn {
    value : IntPtr

    __value {
        set {
            if (value is KspSerializeAuthDataFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvAuthData 
     * @param {Pointer<Integer>} _Size 
     * @param {Pointer<Pointer<Void>>} SerializedData 
     * @returns {NTSTATUS} 
     */
    Call(pvAuthData, _Size, SerializedData) {
        pvAuthDataMarshal := pvAuthData is VarRef ? "ptr" : "ptr"
        _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"
        SerializedDataMarshal := SerializedData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, pvAuthDataMarshal, pvAuthData, _SizeMarshal, _Size, SerializedDataMarshal, SerializedData, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A KspSerializeAuthDataFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspSerializeAuthDataFn {
        /**
         * Creates a KspSerializeAuthDataFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
