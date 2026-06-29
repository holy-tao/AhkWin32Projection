#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct XSAVE_ARM64_SVE_HEADER {
    #StructPack 4

    VectorLength : UInt32

    VectorRegisterOffset : UInt32

    PredicateRegisterOffset : UInt32

    Reserved : UInt32[5]

}
