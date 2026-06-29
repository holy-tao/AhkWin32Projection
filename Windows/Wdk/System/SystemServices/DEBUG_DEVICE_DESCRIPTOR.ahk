#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KD_NAMESPACE_ENUM.ahk" { KD_NAMESPACE_ENUM }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUG_DEVICE_DESCRIPTOR {
    #StructPack 8

    Bus : UInt32

    Slot : UInt32

    Segment : UInt16

    VendorID : UInt16

    DeviceID : UInt16

    BaseClass : Int8

    SubClass : Int8

    ProgIf : Int8

    Flags : Int8


    /**
     * @type {Integer}
     */
    DbgHalScratchAllocated {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DbgBarsMapped {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DbgScratchAllocated {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    DbgUncachedMemory {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    DbgSynthetic {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }
    Initialized : BOOLEAN

    Configured : BOOLEAN

    BaseAddress : IntPtr[6]

    Memory : IntPtr

    Dbg2TableIndex : UInt32

    PortType : UInt16

    PortSubtype : UInt16

    OemData : IntPtr

    OemDataLength : UInt32

    NameSpace : KD_NAMESPACE_ENUM

    NameSpacePath : PWSTR

    NameSpacePathLength : UInt32

    TransportType : UInt32

    TransportData : IntPtr

    EfiIoMmuData : IntPtr

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 17 })
        this.DeleteProp("__New")
    }
}
