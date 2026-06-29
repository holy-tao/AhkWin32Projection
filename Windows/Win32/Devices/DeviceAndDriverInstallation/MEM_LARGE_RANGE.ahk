#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MEM_LARGE_RANGE {
    #StructPack 8

    MLR_Align : Int64

    MLR_nBytes : Int64

    MLR_Min : Int64

    MLR_Max : Int64

    MLR_Flags : UInt32

    MLR_Reserved : UInt32

}
