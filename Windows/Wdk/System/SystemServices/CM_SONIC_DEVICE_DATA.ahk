#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_SONIC_DEVICE_DATA {
    #StructPack 2

    Version : UInt16

    Revision : UInt16

    DataConfigurationRegister : UInt16

    EthernetAddress : Int8[8]

}
