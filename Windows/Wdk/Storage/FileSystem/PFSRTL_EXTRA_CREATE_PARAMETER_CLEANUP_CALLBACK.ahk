#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} EcpContext 
     * @param {Pointer<Guid>} EcpType 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(EcpContext, EcpType) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, EcpContextMarshal, EcpContext, Guid.Ptr, EcpType)
    }

    /**
     * A PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK {
        /**
         * Creates a PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Guid) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Guid.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
