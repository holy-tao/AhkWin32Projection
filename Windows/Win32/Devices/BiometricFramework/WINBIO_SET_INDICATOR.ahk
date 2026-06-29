#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SET_INDICATOR {
    #StructPack 4

    PayloadSize : UInt32

    IndicatorStatus : UInt32

}
