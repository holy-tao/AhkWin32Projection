#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGBATCHPORT.ahk" { HREGBATCHPORT }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} _hKey 
     * @param {Pointer<HREGBATCHPORT>} phBatchNotifyPort 
     * @returns {Integer} 
     */
    Call(_hKey, phBatchNotifyPort) {
        phBatchNotifyPortMarshal := phBatchNotifyPort is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HKEY, _hKey, phBatchNotifyPortMarshal, phBatchNotifyPort, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT {
        /**
         * Creates a PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, HREGBATCHPORT) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, HREGBATCHPORT.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
