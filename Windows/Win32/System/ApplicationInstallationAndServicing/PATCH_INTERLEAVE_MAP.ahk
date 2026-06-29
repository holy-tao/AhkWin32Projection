#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PATCH_INTERLEAVE_MAP {
    #StructPack 4

    CountRanges : UInt32

    OldOffset : UInt32

    OldLength : UInt32

    NewLength : UInt32

}
