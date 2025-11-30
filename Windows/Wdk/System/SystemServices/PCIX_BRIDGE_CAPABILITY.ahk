#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCIX_BRIDGE_CAPABILITY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    class _SecondaryStatus_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - Bus64Bit
         * - Bus133MHzCapable
         * - SplitCompletionDiscarded
         * - UnexpectedSplitCompletion
         * - SplitCompletionOverrun
         * - SplitRequestDelayed
         * - BusModeFrequency
         * - Rsvd
         * - Version
         * - Bus266MHzCapable
         * - Bus533MHzCapable
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Bus64Bit {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Bus133MHzCapable {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        SplitCompletionDiscarded {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        UnexpectedSplitCompletion {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        SplitCompletionOverrun {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        SplitRequestDelayed {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }
    
        /**
         * @type {Integer}
         */
        BusModeFrequency {
            get => (this._bitfield >> 6) & 0xF
            set => this._bitfield := ((value & 0xF) << 6) | (this._bitfield & ~(0xF << 6))
        }
    
        /**
         * @type {Integer}
         */
        Rsvd {
            get => (this._bitfield >> 10) & 0x3
            set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
        }
    
        /**
         * @type {Integer}
         */
        Version {
            get => (this._bitfield >> 12) & 0x3
            set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
        }
    
        /**
         * @type {Integer}
         */
        Bus266MHzCapable {
            get => (this._bitfield >> 14) & 0x1
            set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
        }
    
        /**
         * @type {Integer}
         */
        Bus533MHzCapable {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }
    
        /**
         * @type {Integer}
         */
        AsUSHORT {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _BridgeStatus_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - FunctionNumber
         * - DeviceNumber
         * - BusNumber
         * - Device64Bit
         * - Device133MHzCapable
         * - SplitCompletionDiscarded
         * - UnexpectedSplitCompletion
         * - SplitCompletionOverrun
         * - SplitRequestDelayed
         * - Rsvd
         * - DIMCapable
         * - Device266MHzCapable
         * - Device533MHzCapable
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        FunctionNumber {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        DeviceNumber {
            get => (this._bitfield >> 3) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
        }
    
        /**
         * @type {Integer}
         */
        BusNumber {
            get => (this._bitfield >> 8) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
        }
    
        /**
         * @type {Integer}
         */
        Device64Bit {
            get => (this._bitfield >> 16) & 0x1
            set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
        }
    
        /**
         * @type {Integer}
         */
        Device133MHzCapable {
            get => (this._bitfield >> 17) & 0x1
            set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
        }
    
        /**
         * @type {Integer}
         */
        SplitCompletionDiscarded {
            get => (this._bitfield >> 18) & 0x1
            set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
        }
    
        /**
         * @type {Integer}
         */
        UnexpectedSplitCompletion {
            get => (this._bitfield >> 19) & 0x1
            set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
        }
    
        /**
         * @type {Integer}
         */
        SplitCompletionOverrun {
            get => (this._bitfield >> 20) & 0x1
            set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
        }
    
        /**
         * @type {Integer}
         */
        SplitRequestDelayed {
            get => (this._bitfield >> 21) & 0x1
            set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
        }
    
        /**
         * @type {Integer}
         */
        Rsvd {
            get => (this._bitfield >> 22) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 22) | (this._bitfield & ~(0x7F << 22))
        }
    
        /**
         * @type {Integer}
         */
        DIMCapable {
            get => (this._bitfield >> 29) & 0x1
            set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
        }
    
        /**
         * @type {Integer}
         */
        Device266MHzCapable {
            get => (this._bitfield >> 30) & 0x1
            set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
        }
    
        /**
         * @type {Integer}
         */
        Device533MHzCapable {
            get => (this._bitfield >> 31) & 0x1
            set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
        }
    
        /**
         * @type {Integer}
         */
        AsULONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _EccControlStatus_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - SelectSecondaryRegisters
         * - ErrorPresentInOtherBank
         * - AdditionalCorrectableError
         * - AdditionalUncorrectableError
         * - ErrorPhase
         * - ErrorCorrected
         * - Syndrome
         * - ErrorFirstCommand
         * - ErrorSecondCommand
         * - ErrorUpperAttributes
         * - ControlUpdateEnable
         * - Rsvd
         * - DisableSingleBitCorrection
         * - EccMode
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SelectSecondaryRegisters {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ErrorPresentInOtherBank {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        AdditionalCorrectableError {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        AdditionalUncorrectableError {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        ErrorPhase {
            get => (this._bitfield >> 4) & 0x7
            set => this._bitfield := ((value & 0x7) << 4) | (this._bitfield & ~(0x7 << 4))
        }
    
        /**
         * @type {Integer}
         */
        ErrorCorrected {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
        /**
         * @type {Integer}
         */
        Syndrome {
            get => (this._bitfield >> 8) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
        }
    
        /**
         * @type {Integer}
         */
        ErrorFirstCommand {
            get => (this._bitfield >> 16) & 0xF
            set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
        }
    
        /**
         * @type {Integer}
         */
        ErrorSecondCommand {
            get => (this._bitfield >> 20) & 0xF
            set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
        }
    
        /**
         * @type {Integer}
         */
        ErrorUpperAttributes {
            get => (this._bitfield >> 24) & 0xF
            set => this._bitfield := ((value & 0xF) << 24) | (this._bitfield & ~(0xF << 24))
        }
    
        /**
         * @type {Integer}
         */
        ControlUpdateEnable {
            get => (this._bitfield >> 28) & 0x1
            set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
        }
    
        /**
         * @type {Integer}
         */
        Rsvd {
            get => (this._bitfield >> 29) & 0x1
            set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
        }
    
        /**
         * @type {Integer}
         */
        DisableSingleBitCorrection {
            get => (this._bitfield >> 30) & 0x1
            set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
        }
    
        /**
         * @type {Integer}
         */
        EccMode {
            get => (this._bitfield >> 31) & 0x1
            set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
        }
    
        /**
         * @type {Integer}
         */
        AsULONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
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
     * @type {_SecondaryStatus_e__Union}
     */
    SecondaryStatus{
        get {
            if(!this.HasProp("__SecondaryStatus"))
                this.__SecondaryStatus := %this.__Class%._SecondaryStatus_e__Union(8, this)
            return this.__SecondaryStatus
        }
    }

    /**
     * @type {_BridgeStatus_e__Union}
     */
    BridgeStatus{
        get {
            if(!this.HasProp("__BridgeStatus"))
                this.__BridgeStatus := %this.__Class%._BridgeStatus_e__Union(12, this)
            return this.__BridgeStatus
        }
    }

    /**
     * @type {Integer}
     */
    UpstreamSplitTransactionCapacity {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    UpstreamSplitTransactionLimit {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    DownstreamSplitTransactionCapacity {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DownstreamSplitTransactionLimit {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {_EccControlStatus_e__Union}
     */
    EccControlStatus{
        get {
            if(!this.HasProp("__EccControlStatus"))
                this.__EccControlStatus := %this.__Class%._EccControlStatus_e__Union(24, this)
            return this.__EccControlStatus
        }
    }

    /**
     * @type {Integer}
     */
    EccFirstAddress {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    EccSecondAddress {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    EccAttribute {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
