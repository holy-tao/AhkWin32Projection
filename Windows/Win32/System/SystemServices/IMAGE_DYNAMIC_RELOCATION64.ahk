#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_DYNAMIC_RELOCATION64 {
    #StructPack 8

    Symbol : Int64

    BaseRelocSize : UInt32

}
