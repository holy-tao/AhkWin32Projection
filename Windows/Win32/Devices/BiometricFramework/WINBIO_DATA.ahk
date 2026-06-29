#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_DATA {
    #StructPack 4

    Size : UInt32

    Data : Int8[1]

}
