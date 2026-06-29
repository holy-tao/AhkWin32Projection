#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NV_FEATURE_PARAMETER {
    #StructPack 4

    NVPowerModeEnabled : UInt16

    NVParameterReserv1 : UInt16

    NVCmdEnabled : UInt16

    NVParameterReserv2 : UInt16

    NVPowerModeVer : UInt16

    NVCmdVer : UInt16

    NVSize : UInt32

    NVReadSpeed : UInt16

    NVWrtSpeed : UInt16

    DeviceSpinUpTime : UInt32

}
