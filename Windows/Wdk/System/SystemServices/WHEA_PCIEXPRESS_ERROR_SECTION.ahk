#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_PCIEXPRESS_DEVICE_TYPE.ahk" { WHEA_PCIEXPRESS_DEVICE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIEXPRESS_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    PortType : WHEA_PCIEXPRESS_DEVICE_TYPE

    Version : IntPtr

    CommandStatus : IntPtr

    Reserved : UInt32

    DeviceId : IntPtr

    DeviceSerialNumber : Int64

    BridgeControlStatus : IntPtr

    ExpressCapability : Int8[60]

    AerInfo : Int8[96]

}
