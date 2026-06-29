#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_BASE_RELOCATION {
    #StructPack 4

    VirtualAddress : UInt32

    SizeOfBlock : UInt32

}
