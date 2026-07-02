#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_DATA.ahk" { WINBIO_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SUPPORTED_ALGORITHMS {
    #StructPack 4

    PayloadSize : UInt32

    WinBioHresult : HRESULT

    NumberOfAlgorithms : UInt32

    AlgorithmData : WINBIO_DATA

}
