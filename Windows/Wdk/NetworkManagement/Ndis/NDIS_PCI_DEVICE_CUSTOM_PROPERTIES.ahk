#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PCI_DEVICE_CUSTOM_PROPERTIES {
    #StructPack 8

    Header : IntPtr

    DeviceType : UInt32

    CurrentSpeedAndMode : UInt32

    CurrentPayloadSize : UInt32

    MaxPayloadSize : UInt32

    MaxReadRequestSize : UInt32

    CurrentLinkSpeed : UInt32

    CurrentLinkWidth : UInt32

    MaxLinkSpeed : UInt32

    MaxLinkWidth : UInt32

    PciExpressVersion : UInt32

    InterruptType : UInt32

    MaxInterruptMessages : UInt32

}
