#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIDEVICEOBJECTDATA_DX3 {
    #StructPack 4

    dwOfs : UInt32

    dwData : UInt32

    dwTimeStamp : UInt32

    dwSequence : UInt32

}
