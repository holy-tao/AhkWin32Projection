#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_DATA.ahk" { WINBIO_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_CALIBRATION_INFO {
    #StructPack 4

    PayloadSize : UInt32

    WinBioHresult : HRESULT

    CalibrationData : WINBIO_DATA

}
