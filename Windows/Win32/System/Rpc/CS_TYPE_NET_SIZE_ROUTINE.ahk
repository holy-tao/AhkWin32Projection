#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDL_CS_CONVERT.ahk" { IDL_CS_CONVERT }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct CS_TYPE_NET_SIZE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is CS_TYPE_NET_SIZE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hBinding 
     * @param {Integer} ulNetworkCodeSet 
     * @param {Integer} ulLocalBufferSize 
     * @param {Pointer<IDL_CS_CONVERT>} conversionType 
     * @param {Pointer<Integer>} pulNetworkBufferSize 
     * @param {Pointer<Integer>} pStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hBinding, ulNetworkCodeSet, ulLocalBufferSize, conversionType, pulNetworkBufferSize, pStatus) {
        hBindingMarshal := hBinding is VarRef ? "ptr" : "ptr"
        conversionTypeMarshal := conversionType is VarRef ? "int*" : "ptr"
        pulNetworkBufferSizeMarshal := pulNetworkBufferSize is VarRef ? "uint*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "uint*" : "ptr"

        DllCall(this.value, hBindingMarshal, hBinding, UInt32, ulNetworkCodeSet, UInt32, ulLocalBufferSize, conversionTypeMarshal, conversionType, pulNetworkBufferSizeMarshal, pulNetworkBufferSize, pStatusMarshal, pStatus)
    }

    /**
     * A CS_TYPE_NET_SIZE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CS_TYPE_NET_SIZE_ROUTINE {
        /**
         * Creates a CS_TYPE_NET_SIZE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, "int*", "uint*", "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, "int*", "uint*", "uint*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
