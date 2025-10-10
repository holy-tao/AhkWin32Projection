#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_ADDRESS.ahk

/**
 * The SERVICE_ADDRESSES structure contains an array of SERVICE_ADDRESS data structures.
 * @see https://docs.microsoft.com/windows/win32/api//nspapi/ns-nspapi-service_addresses
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SERVICE_ADDRESSES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_address">SERVICE_ADDRESS</a> structures in the <b>Addresses</b> array.
     * @type {Integer}
     */
    dwAddressCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/nspapi/ns-nspapi-service_address">SERVICE_ADDRESS</a> data structures. Each 
     * <b>SERVICE_ADDRESS</b> structure contains information about a network service address.
     * @type {Array<SERVICE_ADDRESS>}
     */
    Addresses{
        get {
            if(!this.HasProp("__AddressesProxyArray"))
                this.__AddressesProxyArray := Win32FixedArray(this.ptr + 8, 1, SERVICE_ADDRESS, "")
            return this.__AddressesProxyArray
        }
    }
}
