#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_ADVANCED_FEATURES_CAPABILITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _Capabilities_e__Union extends Win32Struct {
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

    class _Control_e__Union extends Win32Struct {
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

    class _Status_e__Union extends Win32Struct {
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
     * @type {Pointer<PCI_CAPABILITIES_HEADER>}
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
     * @type {_Capabilities_e__Union}
     */
    Capabilities{
        get {
            if(!this.HasProp("__Capabilities"))
                this.__Capabilities := %this.__Class%._Capabilities_e__Union(9, this)
            return this.__Capabilities
        }
    }

    /**
     * @type {_Control_e__Union}
     */
    Control{
        get {
            if(!this.HasProp("__Control"))
                this.__Control := %this.__Class%._Control_e__Union(10, this)
            return this.__Control
        }
    }

    /**
     * @type {_Status_e__Union}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := %this.__Class%._Status_e__Union(11, this)
            return this.__Status
        }
    }
}
