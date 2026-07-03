#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SCH_EXTENSION_DATA.ahk" { SCH_EXTENSION_DATA }
#Import ".\SchGetExtensionsOptions.ahk" { SchGetExtensionsOptions }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SslGetExtensionsFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGetExtensionsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} clientHello 
     * @param {Integer} clientHelloByteSize 
     * @param {Pointer<SCH_EXTENSION_DATA>} genericExtensions 
     * @param {Integer} genericExtensionsCount 
     * @param {SchGetExtensionsOptions} flags 
     * @returns {Integer} 
     */
    Call(clientHello, clientHelloByteSize, genericExtensions, genericExtensionsCount, flags) {
        clientHelloMarshal := clientHello is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, clientHelloMarshal, clientHello, UInt32, clientHelloByteSize, SCH_EXTENSION_DATA.Ptr, genericExtensions, Int8, genericExtensionsCount, "uint*", &bytesToRead := 0, SchGetExtensionsOptions, flags, "HRESULT")
        return bytesToRead
    }

    /**
     * A SslGetExtensionsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGetExtensionsFn {
        /**
         * Creates a SslGetExtensionsFn pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, SCH_EXTENSION_DATA, Int8, SchGetExtensionsOptions) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, SCH_EXTENSION_DATA.Ptr, Int8, SchGetExtensionsOptions, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
