#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_ZONE_GROUP.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ZONED_DEVICE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ZoneCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    class _SequentialRequiredZone extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        MaxOpenZoneCount {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        UnrestrictedRead {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Reserved{
            get {
                if(!this.HasProp("__ReservedProxyArray"))
                    this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
                return this.__ReservedProxyArray
            }
        }
    
    }

    class _SequentialPreferredZone extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        OptimalOpenZoneCount {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * @type {_SequentialRequiredZone}
     */
    SequentialRequiredZone{
        get {
            if(!this.HasProp("__SequentialRequiredZone"))
                this.__SequentialRequiredZone := %this.__Class%._SequentialRequiredZone(this.ptr + 16)
            return this.__SequentialRequiredZone
        }
    }

    /**
     * @type {_SequentialPreferredZone}
     */
    SequentialPreferredZone{
        get {
            if(!this.HasProp("__SequentialPreferredZone"))
                this.__SequentialPreferredZone := %this.__Class%._SequentialPreferredZone(this.ptr + 16)
            return this.__SequentialPreferredZone
        }
    }

    /**
     * @type {Integer}
     */
    ZoneGroupCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<STORAGE_ZONE_GROUP>}
     */
    ZoneGroup{
        get {
            if(!this.HasProp("__ZoneGroupProxyArray"))
                this.__ZoneGroupProxyArray := Win32FixedArray(this.ptr + 32, 1, STORAGE_ZONE_GROUP, "")
            return this.__ZoneGroupProxyArray
        }
    }
}
