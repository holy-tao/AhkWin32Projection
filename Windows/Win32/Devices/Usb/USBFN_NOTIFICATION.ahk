#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BM_REQUEST_TYPE.ahk
#Include .\USB_DEFAULT_PIPE_SETUP_PACKET.ahk
#Include .\ALTERNATE_INTERFACE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_NOTIFICATION extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    class _u_e__Union extends Win32Struct {
        static sizeof => 14
        static packingSize => 4

        /**
         * @type {Integer}
         */
        BusSpeed {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {USB_DEFAULT_PIPE_SETUP_PACKET}
         */
        SetupPacket{
            get {
                if(!this.HasProp("__SetupPacket"))
                    this.__SetupPacket := USB_DEFAULT_PIPE_SETUP_PACKET(0, this)
                return this.__SetupPacket
            }
        }
    
        /**
         * @type {Integer}
         */
        ConfigurationValue {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PortType {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {ALTERNATE_INTERFACE}
         */
        AlternateInterface{
            get {
                if(!this.HasProp("__AlternateInterface"))
                    this.__AlternateInterface := ALTERNATE_INTERFACE(0, this)
                return this.__AlternateInterface
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Event {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(4, this)
            return this.__u
        }
    }
}
