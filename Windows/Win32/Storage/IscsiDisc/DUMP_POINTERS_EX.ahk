#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DUMP_POINTERS_VERSION.ahk" { DUMP_POINTERS_VERSION }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct DUMP_POINTERS_EX {
    #StructPack 8

    Header : DUMP_POINTERS_VERSION

    DumpData : IntPtr

    CommonBufferVa : IntPtr

    CommonBufferSize : UInt32

    AllocateCommonBuffers : BOOLEAN

    DeviceObject : IntPtr

    DriverList : IntPtr

    dwPortFlags : UInt32

    MaxDeviceDumpSectionSize : UInt32

    MaxDeviceDumpLevel : UInt32

    MaxTransferSize : UInt32

    AdapterObject : IntPtr

    MappedRegisterBase : IntPtr

    DeviceReady : BOOLEAN.Ptr

    DumpDevicePowerOn : IntPtr

    DumpDevicePowerOnContext : IntPtr

}
