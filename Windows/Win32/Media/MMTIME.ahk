#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media
 */
export default struct MMTIME {
    #StructPack 4


    struct _u {

        struct _smpte {
            hour : Int8

            min : Int8

            sec : Int8

            frame : Int8

            fps : Int8

            dummy : Int8

            pad : Int8[2]

        }

        struct _midi {
            songptrpos : UInt32

        }

        ms : UInt32

        static __New() {
            DefineProp(this.Prototype, 'sample', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'cb', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'ticks', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'smpte', { type: MMTIME._u._smpte, offset: 0 })
            DefineProp(this.Prototype, 'midi', { type: MMTIME._u._midi, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    wType : UInt32

    u : MMTIME._u

}
