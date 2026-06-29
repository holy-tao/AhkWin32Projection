#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PETHREAD.ahk" { PETHREAD }
#Import ".\FLT_IO_PARAMETER_BLOCK.ahk" { FLT_IO_PARAMETER_BLOCK }
#Import ".\FLT_TAG_DATA_BUFFER.ahk" { FLT_TAG_DATA_BUFFER }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_CALLBACK_DATA {
    #StructPack 8

    Flags : UInt32

    Thread : PETHREAD

    Iopb : FLT_IO_PARAMETER_BLOCK.Ptr

    IoStatus : IntPtr

    TagData : FLT_TAG_DATA_BUFFER.Ptr

    QueueLinks : IntPtr

    QueueContext : IntPtr[2]

    RequestorMode : Int8

    static __New() {
        DefineProp(this.Prototype, 'FilterContext', { type: IntPtr[4], offset: 40 })
        this.DeleteProp("__New")
    }
}
