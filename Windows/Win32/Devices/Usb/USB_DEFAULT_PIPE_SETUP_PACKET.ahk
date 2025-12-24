#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BM_REQUEST_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEFAULT_PIPE_SETUP_PACKET extends Win32Struct
{
    static sizeof => 14

    static packingSize => 2

    class _wValue extends Win32Struct {
        static sizeof => 4
        static packingSize => 1

        /**
         * @type {Integer}
         */
        LowByte {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        HiByte {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        W {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _wIndex extends Win32Struct {
        static sizeof => 4
        static packingSize => 1

        /**
         * @type {Integer}
         */
        LowByte {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        HiByte {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        W {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    /**
     * @type {BM_REQUEST_TYPE}
     */
    bmRequestType{
        get {
            if(!this.HasProp("__bmRequestType"))
                this.__bmRequestType := BM_REQUEST_TYPE(0, this)
            return this.__bmRequestType
        }
    }

    /**
     * @type {Integer}
     */
    bRequest {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {_wValue}
     */
    wValue{
        get {
            if(!this.HasProp("__wValue"))
                this.__wValue := %this.__Class%._wValue(3, this)
            return this.__wValue
        }
    }

    /**
     * @type {_wIndex}
     */
    wIndex{
        get {
            if(!this.HasProp("__wIndex"))
                this.__wIndex := %this.__Class%._wIndex(7, this)
            return this.__wIndex
        }
    }

    /**
     * @type {Integer}
     */
    wLength {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
