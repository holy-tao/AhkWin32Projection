#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MEM_LARGE_DES {
    #StructPack 8

    MLD_Count : UInt32

    MLD_Type : UInt32

    MLD_Alloc_Base : Int64

    MLD_Alloc_End : Int64

    MLD_Flags : UInt32

    MLD_Reserved : UInt32

}
