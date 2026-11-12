#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_COMMON_EVENT_RECORD_HEADER.ahk
#Include .\CXL_DEVICE_HEALTH_INFO.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MEMORY_MODULE_EVENT_RECORD extends Win32Struct {
    static sizeof => 136

    static packingSize => 8

    class _ValidityFlags extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - ComponentIdentifier
         * - ComponentIdentifierFormat
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifier {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ComponentIdentifierFormat {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * @type {CXL_COMMON_EVENT_RECORD_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := CXL_COMMON_EVENT_RECORD_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    DeviceEventType {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {CXL_DEVICE_HEALTH_INFO}
     */
    DeviceHealthInfo {
        get {
            if(!this.HasProp("__DeviceHealthInfo"))
                this.__DeviceHealthInfo := CXL_DEVICE_HEALTH_INFO(52, this)
            return this.__DeviceHealthInfo
        }
    }

    /**
     * @type {_ValidityFlags}
     */
    ValidityFlags {
        get {
            if(!this.HasProp("__ValidityFlags"))
                this.__ValidityFlags := CXL_MEMORY_MODULE_EVENT_RECORD._ValidityFlags(72, this)
            return this.__ValidityFlags
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ComponentIdentifier {
        get {
            if(!this.HasProp("__ComponentIdentifierProxyArray"))
                this.__ComponentIdentifierProxyArray := Win32FixedArray(this.ptr + 74, 16, Primitive, "char")
            return this.__ComponentIdentifierProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DeviceEventSubtype {
        get => NumGet(this, 90, "char")
        set => NumPut("char", value, this, 90)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 91, 42, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
