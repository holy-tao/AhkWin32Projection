#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_FUNCTION_OVERRIDE_DYNAMIC_RELOCATION {
    #StructPack 4

    OriginalRva : UInt32

    BDDOffset : UInt32

    RvaSize : UInt32

    BaseRelocSize : UInt32

}
