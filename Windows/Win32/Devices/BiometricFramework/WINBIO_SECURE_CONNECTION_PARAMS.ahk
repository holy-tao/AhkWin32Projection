#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SECURE_CONNECTION_PARAMS {
    #StructPack 4

    PayloadSize : UInt32

    Version : UInt16

    Flags : UInt16

}
