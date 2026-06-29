#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PATCH_RETAIN_RANGE {
    #StructPack 4

    OffsetInOldFile : UInt32

    LengthInBytes : UInt32

    OffsetInNewFile : UInt32

}
