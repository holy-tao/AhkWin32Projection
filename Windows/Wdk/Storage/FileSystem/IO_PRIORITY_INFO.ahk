#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\IO_PRIORITY_HINT.ahk" { IO_PRIORITY_HINT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct IO_PRIORITY_INFO {
    #StructPack 4

    Size : UInt32

    ThreadPriority : UInt32

    PagePriority : UInt32

    IoPriority : IO_PRIORITY_HINT

}
