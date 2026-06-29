#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_EPILOGUE_DYNAMIC_RELOCATION_HEADER {
    #StructPack 4

    EpilogueCount : UInt32

    EpilogueByteCount : Int8

    BranchDescriptorElementSize : Int8

    BranchDescriptorCount : UInt16

}
