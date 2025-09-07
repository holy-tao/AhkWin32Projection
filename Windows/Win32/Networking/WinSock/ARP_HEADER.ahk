#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ARP_HEADER extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Integer}
     */
    HardwareAddressSpace {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProtocolAddressSpace {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    HardwareAddressLength {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ProtocolAddressLength {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    Opcode {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    SenderHardwareAddress{
        get {
            if(!this.HasProp("__SenderHardwareAddressProxyArray"))
                this.__SenderHardwareAddressProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__SenderHardwareAddressProxyArray
        }
    }
}
