#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Represents an extended parameter for a function that manages virtual memory.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEM_EXTENDED_PARAMETER {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Type
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }
    ULong64 : Int64

    static __New() {
        DefineProp(this.Prototype, 'Pointer', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'Size', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'Handle', { type: HANDLE, offset: 8 })
        DefineProp(this.Prototype, 'ULong', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
