#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_DEVICE_POWER_STATE.ahk" { NDIS_DEVICE_POWER_STATE }
#Import ".\NDIS_PM_WAKE_UP_CAPABILITIES.ahk" { NDIS_PM_WAKE_UP_CAPABILITIES }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_PNP_CAPABILITIES {
    #StructPack 4

    Flags : UInt32

    WakeUpCapabilities : NDIS_PM_WAKE_UP_CAPABILITIES

}
