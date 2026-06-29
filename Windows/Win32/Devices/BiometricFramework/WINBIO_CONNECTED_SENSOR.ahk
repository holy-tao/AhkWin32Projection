#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_CONNECTED_SENSOR {
    #StructPack 4

    biometricType : UInt32

    isEnhancedSignInSecurityCapable : BOOL

}
