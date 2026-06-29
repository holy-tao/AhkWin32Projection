#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_FP_BU_STATE {
    #StructPack 4

    SensorAttached : BOOL

    CreationResult : HRESULT

}
