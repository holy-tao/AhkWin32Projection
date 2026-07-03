#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPOpenEnum {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPOpenEnum) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwScope 
     * @param {Integer} dwType 
     * @param {Integer} dwUsage 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer<HANDLE>} lphEnum 
     * @returns {Integer} 
     */
    Call(dwScope, dwType, dwUsage, lpNetResource, lphEnum) {
        result := DllCall(this.value, UInt32, dwScope, UInt32, dwType, UInt32, dwUsage, NETRESOURCEW.Ptr, lpNetResource, HANDLE.Ptr, lphEnum, UInt32)
        return result
    }

    /**
     * A PF_NPOpenEnum that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPOpenEnum {
        /**
         * Creates a PF_NPOpenEnum pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, NETRESOURCEW, HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, NETRESOURCEW.Ptr, HANDLE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
