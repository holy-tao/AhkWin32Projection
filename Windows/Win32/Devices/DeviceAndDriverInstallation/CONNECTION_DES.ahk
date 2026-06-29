#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CONNECTION_DES {
    #StructPack 8

    COND_Type : UInt32

    COND_Flags : UInt32

    COND_Class : Int8

    COND_ClassType : Int8

    COND_Reserved1 : Int8

    COND_Reserved2 : Int8

    COND_Id : Int64

}
