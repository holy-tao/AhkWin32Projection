#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_DEVICE_INFO {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    DeviceGuid : Guid

    UnsafeShutdownCount : UInt32

    PersistentMemorySizeInBytes : Int64

    VolatileMemorySizeInBytes : Int64

    TotalMemorySizeInBytes : Int64

    SlotNumber : UInt32

    DeviceHandle : UInt32

    PhysicalId : UInt16

    NumberOfFormatInterfaceCodes : Int8

    FormatInterfaceCodes : UInt16[8]

    VendorId : UInt32

    ProductId : UInt32

    SubsystemDeviceId : UInt32

    SubsystemVendorId : UInt32

    ManufacturingLocation : Int8

    ManufacturingWeek : Int8

    ManufacturingYear : Int8

    SerialNumber4Byte : UInt32

    SerialNumberLengthInChars : UInt32

    SerialNumber : CHAR[1]

}
