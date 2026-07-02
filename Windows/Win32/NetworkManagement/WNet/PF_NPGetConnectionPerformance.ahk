#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NETCONNECTINFOSTRUCT.ahk" { NETCONNECTINFOSTRUCT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetConnectionPerformance {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetConnectionPerformance) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpRemoteName 
     * @param {Pointer<NETCONNECTINFOSTRUCT>} lpNetConnectInfo 
     * @returns {Integer} 
     */
    Call(lpRemoteName, lpNetConnectInfo) {
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName

        result := DllCall(this.value, "ptr", lpRemoteName, NETCONNECTINFOSTRUCT.Ptr, lpNetConnectInfo, UInt32)
        return result
    }

    /**
     * A PF_NPGetConnectionPerformance that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetConnectionPerformance {
        /**
         * Creates a PF_NPGetConnectionPerformance pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, NETCONNECTINFOSTRUCT) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, NETCONNECTINFOSTRUCT.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
