#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_DATA.ahk" { WINBIO_DATA }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_UPDATE_FIRMWARE {
    #StructPack 4

    PayloadSize : UInt32

    FirmwareData : WINBIO_DATA

}
