#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SslGetServerIdentityFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGetServerIdentityFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ClientHello 
     * @param {Integer} ClientHelloSize 
     * @param {Pointer<Pointer<Integer>>} ServerIdentity 
     * @param {Pointer<Integer>} ServerIdentitySize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    Call(ClientHello, ClientHelloSize, ServerIdentity, ServerIdentitySize, Flags) {
        ServerIdentityMarshal := ServerIdentity is VarRef ? "ptr*" : "ptr"
        ServerIdentitySizeMarshal := ServerIdentitySize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, ClientHello, UInt32, ClientHelloSize, ServerIdentityMarshal, ServerIdentity, ServerIdentitySizeMarshal, ServerIdentitySize, UInt32, Flags, "HRESULT")
        return result
    }

    /**
     * A SslGetServerIdentityFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGetServerIdentityFn {
        /**
         * Creates a SslGetServerIdentityFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr*", "uint*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr*", "uint*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
