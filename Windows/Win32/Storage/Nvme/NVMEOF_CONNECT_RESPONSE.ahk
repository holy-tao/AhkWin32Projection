#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_CONNECT_RESPONSE {
    #StructPack 4


    struct _SCSpecific {

        struct _Success {

            struct _AUTHREQ {
                /**
                 * This bitfield backs the following members:
                 * - Obsolete
                 * - ATR
                 * - ASCR
                 * - Reserved
                 */
                _bitfield : Int16


                /**
                 * @type {Integer}
                 */
                Obsolete {
                    get => (this._bitfield >> 0) & 0x1
                    set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
                }

                /**
                 * @type {Integer}
                 */
                ATR {
                    get => (this._bitfield >> 1) & 0x1
                    set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
                }

                /**
                 * @type {Integer}
                 */
                ASCR {
                    get => (this._bitfield >> 2) & 0x1
                    set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
                }
                static __New() {
                    DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
                    this.DeleteProp("__New")
                }
            }

            CNTLID : UInt16

            AUTHREQ : NVMEOF_CONNECT_RESPONSE._SCSpecific._Success._AUTHREQ

        }

        Success : NVMEOF_CONNECT_RESPONSE._SCSpecific._Success

        static __New() {
            DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    SCSpecific : NVMEOF_CONNECT_RESPONSE._SCSpecific

    Reserved0 : UInt32

    SQHD : UInt16

    Reserved1 : UInt16

    CID : UInt16

    STS : UInt16

}
