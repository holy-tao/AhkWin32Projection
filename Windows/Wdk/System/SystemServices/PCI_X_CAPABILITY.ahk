#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_X_CAPABILITY {
    #StructPack 8


    struct _Command {

        struct _bits {
            /**
             * This bitfield backs the following members:
             * - DataParityErrorRecoveryEnable
             * - EnableRelaxedOrdering
             * - MaxMemoryReadByteCount
             * - MaxOutstandingSplitTransactions
             * - Reserved
             */
            _bitfield : Int16


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

        bits : PCI_X_CAPABILITY._Command._bits

        static __New() {
            DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Status {

        struct _bits {
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
             */
            _bitfield : Int32


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

        bits : PCI_X_CAPABILITY._Status._bits

        static __New() {
            DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Header : IntPtr

    Command : PCI_X_CAPABILITY._Command

    Status : PCI_X_CAPABILITY._Status

}
