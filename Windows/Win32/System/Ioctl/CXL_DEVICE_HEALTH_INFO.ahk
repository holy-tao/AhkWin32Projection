#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_HEALTH_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    class _HealthStatus extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        class _bits extends Win32Struct {
            static sizeof => 1
            static packingSize => 1

            /**
             * This bitfield backs the following members:
             * - MaintenanceNeeded
             * - PerformanceDegraded
             * - HardwareReplacementNeeded
             * - MemoryCapacityDegraded
             * - Reserved
             * @type {Integer}
             */
            _bitfield {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            MaintenanceNeeded {
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }

            /**
             * @type {Integer}
             */
            PerformanceDegraded {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }

            /**
             * @type {Integer}
             */
            HardwareReplacementNeeded {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }

            /**
             * @type {Integer}
             */
            MemoryCapacityDegraded {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }
        }

        /**
         * @type {_bits}
         */
        bits {
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := CXL_DEVICE_HEALTH_INFO._HealthStatus._bits(0, this)
                return this.__bits
            }
        }

        /**
         * @type {Integer}
         */
        AsUchar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    class _AdditionalStatus extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        class _bits extends Win32Struct {
            static sizeof => 1
            static packingSize => 1

            /**
             * This bitfield backs the following members:
             * - LifeUsed
             * - DeviceTemperature
             * - CorrectedVolatileErrorCount
             * - CorrectedPersistentErrorCount
             * - Reserved
             * @type {Integer}
             */
            _bitfield {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            LifeUsed {
                get => (this._bitfield >> 0) & 0x3
                set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
            }

            /**
             * @type {Integer}
             */
            DeviceTemperature {
                get => (this._bitfield >> 2) & 0x3
                set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
            }

            /**
             * @type {Integer}
             */
            CorrectedVolatileErrorCount {
                get => (this._bitfield >> 4) & 0x1
                set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
            }

            /**
             * @type {Integer}
             */
            CorrectedPersistentErrorCount {
                get => (this._bitfield >> 5) & 0x1
                set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
            }
        }

        /**
         * @type {_bits}
         */
        bits {
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := CXL_DEVICE_HEALTH_INFO._AdditionalStatus._bits(0, this)
                return this.__bits
            }
        }

        /**
         * @type {Integer}
         */
        AsUchar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    /**
     * @type {_HealthStatus}
     */
    HealthStatus {
        get {
            if(!this.HasProp("__HealthStatus"))
                this.__HealthStatus := CXL_DEVICE_HEALTH_INFO._HealthStatus(0, this)
            return this.__HealthStatus
        }
    }

    /**
     * @type {Integer}
     */
    MediaStatus {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {_AdditionalStatus}
     */
    AdditionalStatus {
        get {
            if(!this.HasProp("__AdditionalStatus"))
                this.__AdditionalStatus := CXL_DEVICE_HEALTH_INFO._AdditionalStatus(2, this)
            return this.__AdditionalStatus
        }
    }

    /**
     * @type {Integer}
     */
    LifeUsed {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    DeviceTemperature {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DirtyShutdownCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CorrectedVolatileErrorCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    CorrectedPersistentErrorCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
