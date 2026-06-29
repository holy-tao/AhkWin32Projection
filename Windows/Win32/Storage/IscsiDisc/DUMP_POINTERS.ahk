#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\_ADAPTER_OBJECT.ahk" { _ADAPTER_OBJECT }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct DUMP_POINTERS {
    #StructPack 8

    AdapterObject : _ADAPTER_OBJECT.Ptr

    MappedRegisterBase : IntPtr

    DumpData : IntPtr

    CommonBufferVa : IntPtr

    CommonBufferPa : Int64

    CommonBufferSize : UInt32

    AllocateCommonBuffers : BOOLEAN

    UseDiskDump : BOOLEAN

    Spare1 : Int8[2]

    DeviceObject : IntPtr

}
