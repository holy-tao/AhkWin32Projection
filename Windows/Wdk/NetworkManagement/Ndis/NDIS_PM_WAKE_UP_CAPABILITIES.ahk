#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_DEVICE_POWER_STATE.ahk" { NDIS_DEVICE_POWER_STATE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PM_WAKE_UP_CAPABILITIES {
    #StructPack 4

    MinMagicPacketWakeUp : NDIS_DEVICE_POWER_STATE

    MinPatternWakeUp : NDIS_DEVICE_POWER_STATE

    MinLinkChangeWakeUp : NDIS_DEVICE_POWER_STATE

}
