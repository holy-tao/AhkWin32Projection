#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DEVPRIVATE_DES {
    #StructPack 4

    PD_Count : UInt32

    PD_Type : UInt32

    PD_Data1 : UInt32

    PD_Data2 : UInt32

    PD_Data3 : UInt32

    PD_Flags : UInt32

}
