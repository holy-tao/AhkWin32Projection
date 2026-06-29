#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DISCOVERY_ENTRY {
    #StructPack 2


    struct _TREQ {
        /**
         * This bitfield backs the following members:
         * - SecureChannel
         * - SqFlowControlDisable
         * - ZeroHostIdSupport
         * - AuthAndSecureChannel
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        SecureChannel {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }

        /**
         * @type {Integer}
         */
        SqFlowControlDisable {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        ZeroHostIdSupport {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        AuthAndSecureChannel {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _EFLAGS {
        /**
         * This bitfield backs the following members:
         * - DuplicateReturnedInfo
         * - ExplicitPersistentConnectionSupport
         * - NoCDCConnectivity
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        DuplicateReturnedInfo {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ExplicitPersistentConnectionSupport {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        NoCDCConnectivity {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    TRTYPE : Int8

    ADRFAM : Int8

    SUBTYPE : Int8

    TREQ : NVME_DISCOVERY_ENTRY._TREQ

    PORTID : UInt16

    CNTLID : UInt16

    ASQSZ : UInt16

    EFLAGS : NVME_DISCOVERY_ENTRY._EFLAGS

    Reserved0 : Int8[20]

    TRSVCID : Int8[32]

    Reserved1 : Int8[192]

    NQN : Int8[256]

    TRADDR : Int8[256]

    TSAS : Int8[256]

}
