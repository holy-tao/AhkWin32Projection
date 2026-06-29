#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_RECORD {
    #StructPack 8

    ByteOffset : Int64

    StartTime : Int64

    EndTime : Int64

    VirtualAddress : IntPtr

    NumberOfBytes : UInt32

    DeviceNumber : Int8

    ReadRequest : BOOLEAN

}
