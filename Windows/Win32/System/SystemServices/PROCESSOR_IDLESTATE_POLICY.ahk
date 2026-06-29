#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESSOR_IDLESTATE_INFO.ahk" { PROCESSOR_IDLESTATE_INFO }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESSOR_IDLESTATE_POLICY {
    #StructPack 4


    struct _Flags {
        AsWORD : UInt16


        /**
         * @type {Integer}
         */
        AllowScaling {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Disabled {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Revision : UInt16

    Flags : PROCESSOR_IDLESTATE_POLICY._Flags

    PolicyCount : UInt32

    Policy : PROCESSOR_IDLESTATE_INFO[3]

}
