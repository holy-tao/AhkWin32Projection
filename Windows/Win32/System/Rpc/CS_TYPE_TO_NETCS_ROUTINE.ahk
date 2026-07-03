#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct CS_TYPE_TO_NETCS_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is CS_TYPE_TO_NETCS_ROUTINE) {
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
     * @param {Pointer<Void>} pLocalData 
     * @param {Integer} ulLocalDataLength 
     * @param {Pointer<Integer>} pNetworkData 
     * @param {Pointer<Integer>} pulNetworkDataLength 
     * @param {Pointer<Integer>} pStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hBinding, ulNetworkCodeSet, pLocalData, ulLocalDataLength, pNetworkData, pulNetworkDataLength, pStatus) {
        hBindingMarshal := hBinding is VarRef ? "ptr" : "ptr"
        pLocalDataMarshal := pLocalData is VarRef ? "ptr" : "ptr"
        pNetworkDataMarshal := pNetworkData is VarRef ? "char*" : "ptr"
        pulNetworkDataLengthMarshal := pulNetworkDataLength is VarRef ? "uint*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "uint*" : "ptr"

        DllCall(this.value, hBindingMarshal, hBinding, UInt32, ulNetworkCodeSet, pLocalDataMarshal, pLocalData, UInt32, ulLocalDataLength, pNetworkDataMarshal, pNetworkData, pulNetworkDataLengthMarshal, pulNetworkDataLength, pStatusMarshal, pStatus)
    }

    /**
     * A CS_TYPE_TO_NETCS_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CS_TYPE_TO_NETCS_ROUTINE {
        /**
         * Creates a CS_TYPE_TO_NETCS_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", UInt32, "char*", "uint*", "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", UInt32, "char*", "uint*", "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
