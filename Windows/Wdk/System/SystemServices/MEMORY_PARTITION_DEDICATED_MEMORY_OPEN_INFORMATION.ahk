#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MEMORY_PARTITION_DEDICATED_MEMORY_OPEN_INFORMATION {
    #StructPack 8

    DedicatedMemoryTypeId : Int64

    HandleAttributes : UInt32

    DesiredAccess : UInt32

    DedicatedMemoryPartitionHandle : HANDLE

}
