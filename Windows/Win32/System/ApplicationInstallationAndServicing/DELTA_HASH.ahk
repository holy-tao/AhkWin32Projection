#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct DELTA_HASH {
    #StructPack 4

    HashSize : UInt32

    HashValue : Int8[32]

}
