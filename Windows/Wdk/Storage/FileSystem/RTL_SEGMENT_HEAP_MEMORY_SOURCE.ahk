#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_SEGMENT_HEAP_VA_CALLBACKS.ahk" { RTL_SEGMENT_HEAP_VA_CALLBACKS }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_SEGMENT_HEAP_MEMORY_SOURCE {
    #StructPack 8

    Flags : UInt32

    MemoryTypeMask : UInt32

    NumaNode : UInt32

    PartitionHandle : HANDLE

    Reserved : IntPtr[2]

    static __New() {
        DefineProp(this.Prototype, 'Callbacks', { type: RTL_SEGMENT_HEAP_VA_CALLBACKS.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
