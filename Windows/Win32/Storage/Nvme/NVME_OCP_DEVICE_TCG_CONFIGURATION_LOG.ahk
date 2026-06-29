#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_TCG_CONFIGURATION_LOG {
    #StructPack 4


    struct _State {
        /**
         * This bitfield backs the following members:
         * - CPINSIDValue
         * - CPINSIDBlocked
         * - LockingEnabled
         * - SUMOwner
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        CPINSIDValue {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        CPINSIDBlocked {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        LockingEnabled {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        SUMOwner {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    State : NVME_OCP_DEVICE_TCG_CONFIGURATION_LOG._State

    Reserved0 : Int8[3]

    LSPActivationCount : Int8

    TPRevertCount : Int8

    LSPRevertCount : Int8

    LOCount : Int8

    SUMLOCount : Int8

    RPLOCount : Int8

    NPLOCount : Int8

    RLLOCount : Int8

    WLLOCount : Int8

    RULOCount : Int8

    WULOCount : Int8

    Reserved1 : Int8

    SIDAuthTryCount : UInt32

    SIDAuthTryLimit : UInt32

    ResetCount : UInt32

    ResetLockCount : UInt32

    Reserved2 : Int8[462]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
