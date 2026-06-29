#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR {
    #StructPack 2


    struct _bmAttributes {

        struct _Bulk {
            /**
             * This bitfield backs the following members:
             * - MaxStreams
             * - Reserved1
             */
            _bitfield : Int8


            /**
             * @type {Integer}
             */
            MaxStreams {
                get => (this._bitfield >> 0) & 0x1F
                set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
            }

            /**
             * @type {Integer}
             */
            Reserved1 {
                get => (this._bitfield >> 5) & 0x7
                set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
            }
        }

        struct _Isochronous {
            /**
             * This bitfield backs the following members:
             * - Mult
             * - Reserved2
             * - SspCompanion
             */
            _bitfield : Int8


            /**
             * @type {Integer}
             */
            Mult {
                get => (this._bitfield >> 0) & 0x3
                set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
            }

            /**
             * @type {Integer}
             */
            Reserved2 {
                get => (this._bitfield >> 2) & 0x1F
                set => this._bitfield := ((value & 0x1F) << 2) | (this._bitfield & ~(0x1F << 2))
            }

            /**
             * @type {Integer}
             */
            SspCompanion {
                get => (this._bitfield >> 7) & 0x1
                set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
            }
        }

        AsUchar : Int8

        static __New() {
            DefineProp(this.Prototype, 'Bulk', { type: USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR._bmAttributes._Bulk, offset: 0 })
            DefineProp(this.Prototype, 'Isochronous', { type: USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR._bmAttributes._Isochronous, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bLength : Int8

    bDescriptorType : Int8

    bMaxBurst : Int8

    bmAttributes : USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR._bmAttributes

    wBytesPerInterval : UInt16

}
