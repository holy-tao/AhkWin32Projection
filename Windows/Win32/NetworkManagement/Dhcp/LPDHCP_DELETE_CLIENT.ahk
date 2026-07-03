#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DhcpDeleteClientHook function is called by Microsoft DHCP Server directly before a client lease is deleted from the active leases database.
 * @remarks
 * The 
 * <b>DhcpDeleteClientHook</b> function should not block.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_delete_client
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_DELETE_CLIENT {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_DELETE_CLIENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} IpAddress Internet Protocol (IP) address of the client lease being deleted. The IP address is in host order.
     * @param {Pointer<Integer>} HwAddress Buffer holding the Hardware address of the client, often referred to as the MAC address.
     * @param {Integer} HwAddressLength Length of the <i>HwAddress</i> buffer, in bytes.
     * @param {Integer} Reserved Reserved for future use.
     * @param {Integer} ClientType Reserved for future use.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(IpAddress, HwAddress, HwAddressLength, Reserved, ClientType) {
        HwAddressMarshal := HwAddress is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, IpAddress, HwAddressMarshal, HwAddress, UInt32, HwAddressLength, UInt32, Reserved, UInt32, ClientType, UInt32)
        return result
    }

    /**
     * A LPDHCP_DELETE_CLIENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_DELETE_CLIENT {
        /**
         * Creates a LPDHCP_DELETE_CLIENT pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "char*", UInt32, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "char*", UInt32, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
