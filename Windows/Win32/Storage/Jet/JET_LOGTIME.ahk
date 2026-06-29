#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_LOGTIME Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-logtime-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_LOGTIME {
    #StructPack 1

    bSeconds : Int8

    bMinutes : Int8

    bHours : Int8

    bDay : Int8

    bMonth : Int8

    bYear : Int8

    bFiller1 : Int8


    /**
     * @type {Integer}
     */
    fTimeIsUTC {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    bMillisecondsLow {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
    bFiller2 : Int8


    /**
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    bMillisecondsHigh {
        get => (this._bitfield1 >> 1) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 1) | (this._bitfield1 & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    fUnused {
        get => (this._bitfield1 >> 4) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 4) | (this._bitfield1 & ~(0xF << 4))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 6 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int8, offset: 7 })
        this.DeleteProp("__New")
    }
}
