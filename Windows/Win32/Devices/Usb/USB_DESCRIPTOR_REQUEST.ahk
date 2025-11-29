#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DESCRIPTOR_REQUEST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _SetupPacket extends Win32Struct {
        static sizeof => 8
        static packingSize => 2

        /**
         * @type {Integer}
         */
        bmRequest {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        bRequest {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        wValue {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        wIndex {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        wLength {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
    }

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_SetupPacket}
     */
    SetupPacket{
        get {
            if(!this.HasProp("__SetupPacket"))
                this.__SetupPacket := %this.__Class%._SetupPacket(8, this)
            return this.__SetupPacket
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
