#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_ALERT_CONFIG_OUTPUT extends Win32Struct {
    static sizeof => 16

    static packingSize => 2

    class _ValidAlerts extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        class _bits extends Win32Struct {
            static sizeof => 1
            static packingSize => 1

            /**
             * This bitfield backs the following members:
             * - LifeUsed
             * - DeviceOverTemp
             * - DeviceUnderTemp
             * - CorrectedVolatileMemory
             * - CorrectedPersistentMemory
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
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }

            /**
             * @type {Integer}
             */
            DeviceOverTemp {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }

            /**
             * @type {Integer}
             */
            DeviceUnderTemp {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }

            /**
             * @type {Integer}
             */
            CorrectedVolatileMemory {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }

            /**
             * @type {Integer}
             */
            CorrectedPersistentMemory {
                get => (this._bitfield >> 4) & 0x1
                set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
            }
        }

        /**
         * @type {_bits}
         */
        bits {
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := CXL_MAILBOX_GET_ALERT_CONFIG_OUTPUT._ValidAlerts._bits(0, this)
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

    class _ProgrammableAlerts extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        class _bits extends Win32Struct {
            static sizeof => 1
            static packingSize => 1

            /**
             * This bitfield backs the following members:
             * - LifeUsed
             * - DeviceOverTemp
             * - DeviceUnderTemp
             * - CorrectedVolatileMemory
             * - CorrectedPersistentMemory
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
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }

            /**
             * @type {Integer}
             */
            DeviceOverTemp {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }

            /**
             * @type {Integer}
             */
            DeviceUnderTemp {
                get => (this._bitfield >> 2) & 0x1
                set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
            }

            /**
             * @type {Integer}
             */
            CorrectedVolatileMemory {
                get => (this._bitfield >> 3) & 0x1
                set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
            }

            /**
             * @type {Integer}
             */
            CorrectedPersistentMemory {
                get => (this._bitfield >> 4) & 0x1
                set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
            }
        }

        /**
         * @type {_bits}
         */
        bits {
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := CXL_MAILBOX_GET_ALERT_CONFIG_OUTPUT._ProgrammableAlerts._bits(0, this)
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
     * @type {_ValidAlerts}
     */
    ValidAlerts {
        get {
            if(!this.HasProp("__ValidAlerts"))
                this.__ValidAlerts := CXL_MAILBOX_GET_ALERT_CONFIG_OUTPUT._ValidAlerts(0, this)
            return this.__ValidAlerts
        }
    }

    /**
     * @type {_ProgrammableAlerts}
     */
    ProgrammableAlerts {
        get {
            if(!this.HasProp("__ProgrammableAlerts"))
                this.__ProgrammableAlerts := CXL_MAILBOX_GET_ALERT_CONFIG_OUTPUT._ProgrammableAlerts(1, this)
            return this.__ProgrammableAlerts
        }
    }

    /**
     * @type {Integer}
     */
    LifeUsedCriticalThreshold {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    LifeUsedProgrammableWarningThreshold {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    DeviceOverTemperatureCriticalThreshold {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DeviceUnderTemperatureCriticalThreshold {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    DeviceOverTemperatureProgrammableWarningThreshold {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DeviceUnderTemperatureProgrammableWarningThreshold {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    CorrectedVolatileMemoryProgrammableWarningThreshold {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    CorrectedPersistentMemoryProgrammableWarningThreshold {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
