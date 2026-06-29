#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_DYNAMIC_RELOCATION32 {
    #StructPack 4

    Symbol : UInt32

    BaseRelocSize : UInt32

}
