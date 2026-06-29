#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_BDD_DYNAMIC_RELOCATION {
    #StructPack 4

    Left : UInt16

    Right : UInt16

    Value : UInt32

}
