#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_X_CAPABILITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _Command_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        class _bits extends Win32Struct {
            static sizeof => 2
            static packingSize => 2
    
            /**
             * This bitfield backs the following members:
             * - DataParityErrorRecoveryEnable
             * - EnableRelaxedOrdering
             * - MaxMemoryReadByteCount
             * - MaxOutstandingSplitTransactions
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
            DataParityErrorRecoveryEnable {
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }
        
            /**
             * @type {Integer}
             */
            EnableRelaxedOrdering {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }
        
            /**
             * @type {Integer}
             */
            MaxMemoryReadByteCount {
                get => (this._bitfield >> 2) & 0x3
                set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
            }
        
            /**
             * @type {Integer}
             */
            MaxOutstandingSplitTransactions {
                get => (this._bitfield >> 4) & 0x7
                set => this._bitfield := ((value & 0x7) << 4) | (this._bitfield & ~(0x7 << 4))
            }
        
        }
    
        /**
         * @type {_bits}
         */
        bits{
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := %this.__Class%._bits(0, this)
                return this.__bits
            }
        }
    
        /**
         * @type {Integer}
         */
        AsUSHORT {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    class _Status_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _bits extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * This bitfield backs the following members:
             * - FunctionNumber
             * - DeviceNumber
             * - BusNumber
             * - Device64Bit
             * - Capable133MHz
             * - SplitCompletionDiscarded
             * - UnexpectedSplitCompletion
             * - DeviceComplexity
             * - DesignedMaxMemoryReadByteCount
             * - DesignedMaxOutstandingSplitTransactions
             * - DesignedMaxCumulativeReadSize
             * - ReceivedSplitCompletionErrorMessage
             * - CapablePCIX266
             * - CapablePCIX533
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
            Capable133MHz {
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
            DeviceComplexity {
                get => (this._bitfield >> 20) & 0x1
                set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
            }
        
            /**
             * @type {Integer}
             */
            DesignedMaxMemoryReadByteCount {
                get => (this._bitfield >> 21) & 0x3
                set => this._bitfield := ((value & 0x3) << 21) | (this._bitfield & ~(0x3 << 21))
            }
        
            /**
             * @type {Integer}
             */
            DesignedMaxOutstandingSplitTransactions {
                get => (this._bitfield >> 23) & 0x7
                set => this._bitfield := ((value & 0x7) << 23) | (this._bitfield & ~(0x7 << 23))
            }
        
            /**
             * @type {Integer}
             */
            DesignedMaxCumulativeReadSize {
                get => (this._bitfield >> 26) & 0x7
                set => this._bitfield := ((value & 0x7) << 26) | (this._bitfield & ~(0x7 << 26))
            }
        
            /**
             * @type {Integer}
             */
            ReceivedSplitCompletionErrorMessage {
                get => (this._bitfield >> 29) & 0x1
                set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
            }
        
            /**
             * @type {Integer}
             */
            CapablePCIX266 {
                get => (this._bitfield >> 30) & 0x1
                set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
            }
        
            /**
             * @type {Integer}
             */
            CapablePCIX533 {
                get => (this._bitfield >> 31) & 0x1
                set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
            }
        
        }
    
        /**
         * @type {_bits}
         */
        bits{
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := %this.__Class%._bits(0, this)
                return this.__bits
            }
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
     * @type {_Command_e__Union}
     */
    Command{
        get {
            if(!this.HasProp("__Command"))
                this.__Command := %this.__Class%._Command_e__Union(8, this)
            return this.__Command
        }
    }

    /**
     * @type {_Status_e__Union}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := %this.__Class%._Status_e__Union(12, this)
            return this.__Status
        }
    }
}
