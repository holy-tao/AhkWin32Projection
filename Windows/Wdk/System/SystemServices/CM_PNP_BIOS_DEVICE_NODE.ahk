#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_PNP_BIOS_DEVICE_NODE {
    #StructPack 4

    Size : UInt16

    Node : Int8

    ProductId : UInt32

    DeviceType : Int8[3]

    DeviceAttributes : UInt16

}
