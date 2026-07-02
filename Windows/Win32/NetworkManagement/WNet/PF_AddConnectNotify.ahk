#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NOTIFYADD.ahk" { NOTIFYADD }
#Import ".\NOTIFYINFO.ahk" { NOTIFYINFO }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_AddConnectNotify {
    value : IntPtr

    __value {
        set {
            if (value is PF_AddConnectNotify) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<NOTIFYINFO>} lpNotifyInfo 
     * @param {Pointer<NOTIFYADD>} lpAddInfo 
     * @returns {Integer} 
     */
    Call(lpNotifyInfo, lpAddInfo) {
        result := DllCall(this.value, NOTIFYINFO.Ptr, lpNotifyInfo, NOTIFYADD.Ptr, lpAddInfo, UInt32)
        return result
    }

    /**
     * A PF_AddConnectNotify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_AddConnectNotify {
        /**
         * Creates a PF_AddConnectNotify pointer that invokes the given AHK function when called.
         * @param {Func(NOTIFYINFO, NOTIFYADD) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NOTIFYINFO.Ptr, NOTIFYADD.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
