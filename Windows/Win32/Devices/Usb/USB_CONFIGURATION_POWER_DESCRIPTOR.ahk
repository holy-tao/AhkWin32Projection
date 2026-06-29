#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CONFIGURATION_POWER_DESCRIPTOR {
    #StructPack 2

    bLength : Int8

    bDescriptorType : Int8

    SelfPowerConsumedD0 : Int8[3]

    bPowerSummaryId : Int8

    bBusPowerSavingD1 : Int8

    bSelfPowerSavingD1 : Int8

    bBusPowerSavingD2 : Int8

    bSelfPowerSavingD2 : Int8

    bBusPowerSavingD3 : Int8

    bSelfPowerSavingD3 : Int8

    TransitionTimeFromD1 : UInt16

    TransitionTimeFromD2 : UInt16

    TransitionTimeFromD3 : UInt16

}
