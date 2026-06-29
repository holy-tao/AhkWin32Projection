#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_BLANK_PAYLOAD {
    #StructPack 4

    PayloadSize : UInt32

    WinBioHresult : HRESULT

}
