#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NOTIFYCANCEL.ahk" { NOTIFYCANCEL }
#Import ".\NOTIFYINFO.ahk" { NOTIFYINFO }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_CancelConnectNotify {
    value : IntPtr

    __value {
        set {
            if (value is PF_CancelConnectNotify) {
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
     * @param {Pointer<NOTIFYCANCEL>} lpCancelInfo 
     * @returns {Integer} 
     */
    Call(lpNotifyInfo, lpCancelInfo) {
        result := DllCall(this.value, NOTIFYINFO.Ptr, lpNotifyInfo, NOTIFYCANCEL.Ptr, lpCancelInfo, UInt32)
        return result
    }

    /**
     * A PF_CancelConnectNotify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_CancelConnectNotify {
        /**
         * Creates a PF_CancelConnectNotify pointer that invokes the given AHK function when called.
         * @param {Func(NOTIFYINFO, NOTIFYCANCEL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NOTIFYINFO.Ptr, NOTIFYCANCEL.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
