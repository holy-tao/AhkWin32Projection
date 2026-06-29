#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_GESTURE_METADATA {
    #StructPack 8

    Size : IntPtr

    BiometricType : UInt32

    MatchType : UInt32

    ProtectionType : UInt32

}
