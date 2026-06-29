#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct VIRTUAL_PROCESSOR_REGISTER {
    #StructPack 8


    struct _Reg128 {
        Low64 : Int64

        High64 : Int64

    }

    struct _X64 {

        struct _Segment {
            Base : Int64

            Limit : UInt32

            Selector : UInt16

            Attributes : UInt16


            /**
             * @type {Integer}
             */
            SegmentType {
                get => (this._bitfield >> 0) & 0xF
                set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
            }

            /**
             * @type {Integer}
             */
            NonSystemSegment {
                get => (this._bitfield >> 4) & 0x1
                set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
            }

            /**
             * @type {Integer}
             */
            DescriptorPrivilegeLevel {
                get => (this._bitfield >> 5) & 0x3
                set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
            }

            /**
             * @type {Integer}
             */
            Present {
                get => (this._bitfield >> 7) & 0x1
                set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
            }

            /**
             * @type {Integer}
             */
            Available {
                get => (this._bitfield >> 12) & 0x1
                set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
            }

            /**
             * @type {Integer}
             */
            Long {
                get => (this._bitfield >> 13) & 0x1
                set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
            }

            /**
             * @type {Integer}
             */
            Default {
                get => (this._bitfield >> 14) & 0x1
                set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
            }

            /**
             * @type {Integer}
             */
            Granularity {
                get => (this._bitfield >> 15) & 0x1
                set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
            }
            static __New() {
                DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 14 })
                this.DeleteProp("__New")
            }
        }

        struct _Table {
            Limit : UInt16

            Base : Int64

        }

        struct _FpControlStatus {
            FpControl : UInt16

            FpStatus : UInt16

            FpTag : Int8

            Reserved : Int8

            LastFpOp : UInt16

            LastFpRip : Int64

            static __New() {
                DefineProp(this.Prototype, 'LastFpEip', { type: UInt32, offset: 8 })
                DefineProp(this.Prototype, 'LastFpCs', { type: UInt16, offset: 12 })
                this.DeleteProp("__New")
            }
        }

        struct _XmmControlStatus {
            LastFpRdp : Int64

            XmmStatusControl : UInt32

            XmmStatusControlMask : UInt32

            static __New() {
                DefineProp(this.Prototype, 'LastFpDp', { type: UInt32, offset: 0 })
                DefineProp(this.Prototype, 'LastFpDs', { type: UInt16, offset: 4 })
                this.DeleteProp("__New")
            }
        }

        Segment : VIRTUAL_PROCESSOR_REGISTER._X64._Segment

        static __New() {
            DefineProp(this.Prototype, 'Table', { type: VIRTUAL_PROCESSOR_REGISTER._X64._Table, offset: 0 })
            DefineProp(this.Prototype, 'FpControlStatus', { type: VIRTUAL_PROCESSOR_REGISTER._X64._FpControlStatus, offset: 0 })
            DefineProp(this.Prototype, 'XmmControlStatus', { type: VIRTUAL_PROCESSOR_REGISTER._X64._XmmControlStatus, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Reg64 : Int64

    static __New() {
        DefineProp(this.Prototype, 'Reg32', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Reg16', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'Reg8', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Reg128', { type: VIRTUAL_PROCESSOR_REGISTER._Reg128, offset: 0 })
        DefineProp(this.Prototype, 'X64', { type: VIRTUAL_PROCESSOR_REGISTER._X64, offset: 0 })
        this.DeleteProp("__New")
    }
}
