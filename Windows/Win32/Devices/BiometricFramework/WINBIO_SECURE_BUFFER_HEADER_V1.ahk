#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_SECURE_BUFFER_HEADER_V1 {
    #StructPack 8

    Type : UInt32

    Size : UInt32

    Flags : UInt32

    ValidationTag : Int64

}
