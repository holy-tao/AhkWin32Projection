#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_NUMBER_EX {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    DeviceType : UInt32

    DeviceNumber : UInt32

    DeviceGuid : Guid

    PartitionNumber : UInt32

}
