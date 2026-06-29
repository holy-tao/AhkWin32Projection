#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EXTENDED_UNIT_STATUS {
    #StructPack 4

    Availability : UInt32

    ReasonCode : UInt32

}
