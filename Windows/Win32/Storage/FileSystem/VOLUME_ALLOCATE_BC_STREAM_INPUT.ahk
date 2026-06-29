#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_ALLOCATE_BC_STREAM_INPUT {
    #StructPack 8

    Version : UInt32

    RequestsPerPeriod : UInt32

    Period : UInt32

    RetryFailures : BOOLEAN

    Discardable : BOOLEAN

    Reserved1 : BOOLEAN[2]

    LowestByteOffset : Int64

    HighestByteOffset : Int64

    AccessType : UInt32

    AccessMode : UInt32

}
