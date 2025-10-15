#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Cdb{
        get {
            if(!this.HasProp("__CdbProxyArray"))
                this.__CdbProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__CdbProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Command{
        get {
            if(!this.HasProp("__CommandProxyArray"))
                this.__CommandProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__CommandProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    OperationStatus {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    OperationError {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    class _ExternalStack extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _AtaPort extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        dwAtaPortSpecific {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _StorPort extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        SrbTag {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_ExternalStack}
     */
    ExternalStack{
        get {
            if(!this.HasProp("__ExternalStack"))
                this.__ExternalStack := %this.__Class%._ExternalStack(this.ptr + 56)
            return this.__ExternalStack
        }
    }

    /**
     * @type {_AtaPort}
     */
    AtaPort{
        get {
            if(!this.HasProp("__AtaPort"))
                this.__AtaPort := %this.__Class%._AtaPort(this.ptr + 56)
            return this.__AtaPort
        }
    }

    /**
     * @type {_StorPort}
     */
    StorPort{
        get {
            if(!this.HasProp("__StorPort"))
                this.__StorPort := %this.__Class%._StorPort(this.ptr + 56)
            return this.__StorPort
        }
    }
}
