#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PVIRTUALCHANNELWRITE {
    value : IntPtr

    __value {
        set {
            if (value is PVIRTUALCHANNELWRITE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} openHandle 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dataLength 
     * @param {Pointer<Void>} pUserData 
     * @returns {Integer} 
     */
    Call(openHandle, pData, dataLength, pUserData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"
        pUserDataMarshal := pUserData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, openHandle, pDataMarshal, pData, UInt32, dataLength, pUserDataMarshal, pUserData, UInt32)
        return result
    }

    /**
     * A PVIRTUALCHANNELWRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PVIRTUALCHANNELWRITE {
        /**
         * Creates a PVIRTUALCHANNELWRITE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
