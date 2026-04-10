#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_ZONED_DEVICE_TYPES.ahk
#Include .\STORAGE_ZONE_GROUP.ahk
#Include .\STORAGE_ZONE_TYPES.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ZONED_DEVICE_DESCRIPTOR extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    class _ZoneAttributes_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        class _SequentialRequiredZone extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            MaxOpenZoneCount {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {BOOLEAN}
             */
            UnrestrictedRead {
                get => NumGet(this, 4, "char")
                set => NumPut("char", value, this, 4)
            }

            /**
             * @type {Array<Integer>}
             */
            Reserved {
                get {
                    if(!this.HasProp("__ReservedProxyArray"))
                        this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
                    return this.__ReservedProxyArray
                }
            }
        }

        class _SequentialPreferredZone extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

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
        SequentialRequiredZone {
            get {
                if(!this.HasProp("__SequentialRequiredZone"))
                    this.__SequentialRequiredZone := STORAGE_ZONED_DEVICE_DESCRIPTOR._ZoneAttributes_e__Union._SequentialRequiredZone(0, this)
                return this.__SequentialRequiredZone
            }
        }

        /**
         * @type {_SequentialPreferredZone}
         */
        SequentialPreferredZone {
            get {
                if(!this.HasProp("__SequentialPreferredZone"))
                    this.__SequentialPreferredZone := STORAGE_ZONED_DEVICE_DESCRIPTOR._ZoneAttributes_e__Union._SequentialPreferredZone(0, this)
                return this.__SequentialPreferredZone
            }
        }
    }

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
     * @type {STORAGE_ZONED_DEVICE_TYPES}
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

    /**
     * @type {_ZoneAttributes_e__Union}
     */
    ZoneAttributes {
        get {
            if(!this.HasProp("__ZoneAttributes"))
                this.__ZoneAttributes := STORAGE_ZONED_DEVICE_DESCRIPTOR._ZoneAttributes_e__Union(16, this)
            return this.__ZoneAttributes
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
     * @type {STORAGE_ZONE_GROUP}
     */
    ZoneGroup {
        get {
            if(!this.HasProp("__ZoneGroupProxyArray"))
                this.__ZoneGroupProxyArray := Win32FixedArray(this.ptr + 32, 1, STORAGE_ZONE_GROUP, "")
            return this.__ZoneGroupProxyArray
        }
    }
}
