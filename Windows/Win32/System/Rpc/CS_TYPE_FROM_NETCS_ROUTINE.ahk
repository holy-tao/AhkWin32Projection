#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct CS_TYPE_FROM_NETCS_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is CS_TYPE_FROM_NETCS_ROUTINE) {
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
     * @param {Pointer<Integer>} pNetworkData 
     * @param {Integer} ulNetworkDataLength 
     * @param {Integer} ulLocalBufferSize 
     * @param {Pointer<Void>} pLocalData 
     * @param {Pointer<Integer>} pulLocalDataLength 
     * @param {Pointer<Integer>} pStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hBinding, ulNetworkCodeSet, pNetworkData, ulNetworkDataLength, ulLocalBufferSize, pLocalData, pulLocalDataLength, pStatus) {
        hBindingMarshal := hBinding is VarRef ? "ptr" : "ptr"
        pNetworkDataMarshal := pNetworkData is VarRef ? "char*" : "ptr"
        pLocalDataMarshal := pLocalData is VarRef ? "ptr" : "ptr"
        pulLocalDataLengthMarshal := pulLocalDataLength is VarRef ? "uint*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "uint*" : "ptr"

        DllCall(this.value, hBindingMarshal, hBinding, UInt32, ulNetworkCodeSet, pNetworkDataMarshal, pNetworkData, UInt32, ulNetworkDataLength, UInt32, ulLocalBufferSize, pLocalDataMarshal, pLocalData, pulLocalDataLengthMarshal, pulLocalDataLength, pStatusMarshal, pStatus)
    }

    /**
     * A CS_TYPE_FROM_NETCS_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CS_TYPE_FROM_NETCS_ROUTINE {
        /**
         * Creates a CS_TYPE_FROM_NETCS_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "char*", UInt32, UInt32, "ptr", "uint*", "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "char*", UInt32, UInt32, "ptr", "uint*", "uint*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
