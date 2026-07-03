#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NTFS_DEREF_EXPORTED_SECURITY_DESCRIPTOR {
    value : IntPtr

    __value {
        set {
            if (value is NTFS_DEREF_EXPORTED_SECURITY_DESCRIPTOR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Vcb 
     * @param {PSECURITY_DESCRIPTOR} _SecurityDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Vcb, _SecurityDescriptor) {
        VcbMarshal := Vcb is VarRef ? "ptr" : "ptr"

        DllCall(this.value, VcbMarshal, Vcb, PSECURITY_DESCRIPTOR, _SecurityDescriptor)
    }

    /**
     * A NTFS_DEREF_EXPORTED_SECURITY_DESCRIPTOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NTFS_DEREF_EXPORTED_SECURITY_DESCRIPTOR {
        /**
         * Creates a NTFS_DEREF_EXPORTED_SECURITY_DESCRIPTOR pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSECURITY_DESCRIPTOR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSECURITY_DESCRIPTOR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
