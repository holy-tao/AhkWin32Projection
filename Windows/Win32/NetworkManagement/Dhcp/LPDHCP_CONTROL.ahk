#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DhcpControlHook function is called by Microsoft DHCP Server when the DHCP Server service is started, stopped, paused, or continued.
 * @remarks
 * This routine should not block.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_control
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_CONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwControlCode Specifies the control event that triggered the notification. This parameter will be one of the following: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>DHCP_CONTROL_START</li>
     * <li>DHCP_CONTROL_STOP</li>
     * <li>DHCP_CONTROL_PAUSE</li>
     * <li>DHCP_CONTROL_CONTINUE</li>
     * </ul>
     * @param {Pointer<Void>} lpReserved Reserved for future use.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(dwControlCode, lpReserved) {
        lpReservedMarshal := lpReserved is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, dwControlCode, lpReservedMarshal, lpReserved, UInt32)
        return result
    }

    /**
     * A LPDHCP_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_CONTROL {
        /**
         * Creates a LPDHCP_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
