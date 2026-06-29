#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCI_HARDWARE_INTERFACE.ahk" { PCI_HARDWARE_INTERFACE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PCI_BUS_WIDTH.ahk" { PCI_BUS_WIDTH }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_ROOT_BUS_HARDWARE_CAPABILITY {
    #StructPack 8

    SecondaryInterface : PCI_HARDWARE_INTERFACE

    BusCapabilitiesFound : BOOLEAN

    CurrentSpeedAndMode : UInt32

    SupportedSpeedsAndModes : UInt32

    DeviceIDMessagingCapable : BOOLEAN

    SecondaryBusWidth : PCI_BUS_WIDTH

    OscFeatureSupport : IntPtr

    OscControlRequest : IntPtr

    OscControlGranted : IntPtr

}
