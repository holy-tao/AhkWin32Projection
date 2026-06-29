#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_ADVANCED_FEATURES_CAPABILITY extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _Capabilities extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - FunctionLevelResetSupported
         * - TransactionsPendingSupported
         * - Rsvd
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        FunctionLevelResetSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        TransactionsPendingSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        Rsvd {
            get => (this._bitfield >> 2) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
        }

        /**
         * @type {Integer}
         */
        AsUCHAR {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    class _Control extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - InitiateFunctionLevelReset
         * - Rsvd
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        InitiateFunctionLevelReset {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Rsvd {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }

        /**
         * @type {Integer}
         */
        AsUCHAR {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    class _Status extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - TransactionsPending
         * - Rsvd
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        TransactionsPending {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Rsvd {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }

        /**
         * @type {Integer}
         */
        AsUCHAR {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {_Capabilities}
     */
    Capabilities {
        get {
            if(!this.HasProp("__Capabilities"))
                this.__Capabilities := PCI_ADVANCED_FEATURES_CAPABILITY._Capabilities(9, this)
            return this.__Capabilities
        }
    }

    /**
     * @type {_Control}
     */
    Control {
        get {
            if(!this.HasProp("__Control"))
                this.__Control := PCI_ADVANCED_FEATURES_CAPABILITY._Control(10, this)
            return this.__Control
        }
    }

    /**
     * @type {_Status}
     */
    Status {
        get {
            if(!this.HasProp("__Status"))
                this.__Status := PCI_ADVANCED_FEATURES_CAPABILITY._Status(11, this)
            return this.__Status
        }
    }
}
