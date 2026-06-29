#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SECURE_CONNECTION_DATA {
    #StructPack 4

    Size : UInt32

    Version : UInt16

    Flags : UInt16

    ModelCertificateSize : UInt32

    IntermediateCA1Size : UInt32

    IntermediateCA2Size : UInt32

}
