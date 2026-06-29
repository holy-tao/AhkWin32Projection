#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ADVANCED_FEATURES_CAPABILITY {
    #StructPack 8


    struct _Capabilities {
        /**
         * This bitfield backs the following members:
         * - FunctionLevelResetSupported
         * - TransactionsPendingSupported
         * - Rsvd
         */
        _bitfield : Int8


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
        static __New() {
            DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Control {
        /**
         * This bitfield backs the following members:
         * - InitiateFunctionLevelReset
         * - Rsvd
         */
        _bitfield : Int8


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
        static __New() {
            DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Status {
        /**
         * This bitfield backs the following members:
         * - TransactionsPending
         * - Rsvd
         */
        _bitfield : Int8


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
        static __New() {
            DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Header : IntPtr

    Length : Int8

    Capabilities : PCI_ADVANCED_FEATURES_CAPABILITY._Capabilities

    Control : PCI_ADVANCED_FEATURES_CAPABILITY._Control

    Status : PCI_ADVANCED_FEATURES_CAPABILITY._Status

}
