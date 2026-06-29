#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_CONNECT_RESPONSE extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    class _SCSpecific extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _Success extends Win32Struct {
            static sizeof => 4
            static packingSize => 2

            class _AUTHREQ extends Win32Struct {
                static sizeof => 2
                static packingSize => 2

                /**
                 * This bitfield backs the following members:
                 * - Obsolete
                 * - ATR
                 * - ASCR
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

                /**
                 * @type {Integer}
                 */
                AsUshort {
                    get => NumGet(this, 0, "ushort")
                    set => NumPut("ushort", value, this, 0)
                }
            }

            /**
             * @type {Integer}
             */
            CNTLID {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }

            /**
             * @type {_AUTHREQ}
             */
            AUTHREQ {
                get {
                    if(!this.HasProp("__AUTHREQ"))
                        this.__AUTHREQ := NVMEOF_CONNECT_RESPONSE._SCSpecific._Success._AUTHREQ(2, this)
                    return this.__AUTHREQ
                }
            }
        }

        /**
         * @type {_Success}
         */
        Success {
            get {
                if(!this.HasProp("__Success"))
                    this.__Success := NVMEOF_CONNECT_RESPONSE._SCSpecific._Success(0, this)
                return this.__Success
            }
        }

        /**
         * @type {Integer}
         */
        AsUlong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {_SCSpecific}
     */
    SCSpecific {
        get {
            if(!this.HasProp("__SCSpecific"))
                this.__SCSpecific := NVMEOF_CONNECT_RESPONSE._SCSpecific(0, this)
            return this.__SCSpecific
        }
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SQHD {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    CID {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    STS {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
