#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_SET_ALERT_CONFIG_INPUT extends Win32Struct {
    static sizeof => 12

    static packingSize => 2

    class _ValidAlertActions extends Win32Struct {
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
                    this.__bits := CXL_MAILBOX_SET_ALERT_CONFIG_INPUT._ValidAlertActions._bits(0, this)
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

    class _EnableAlertActions extends Win32Struct {
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
                    this.__bits := CXL_MAILBOX_SET_ALERT_CONFIG_INPUT._EnableAlertActions._bits(0, this)
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
     * @type {_ValidAlertActions}
     */
    ValidAlertActions {
        get {
            if(!this.HasProp("__ValidAlertActions"))
                this.__ValidAlertActions := CXL_MAILBOX_SET_ALERT_CONFIG_INPUT._ValidAlertActions(0, this)
            return this.__ValidAlertActions
        }
    }

    /**
     * @type {_EnableAlertActions}
     */
    EnableAlertActions {
        get {
            if(!this.HasProp("__EnableAlertActions"))
                this.__EnableAlertActions := CXL_MAILBOX_SET_ALERT_CONFIG_INPUT._EnableAlertActions(1, this)
            return this.__EnableAlertActions
        }
    }

    /**
     * @type {Integer}
     */
    LifeUsedProgrammableWarningThreshold {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    DeviceOverTemperatureProgrammableWarningThreshold {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DeviceUnderTemperatureProgrammableWarningThreshold {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    CorrectedVolatileMemoryProgrammableWarningThreshold {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CorrectedPersistentMemoryProgrammableWarningThreshold {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
