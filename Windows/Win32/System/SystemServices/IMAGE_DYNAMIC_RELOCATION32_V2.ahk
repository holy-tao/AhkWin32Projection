#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_DYNAMIC_RELOCATION32_V2 {
    #StructPack 4

    HeaderSize : UInt32

    FixupInfoSize : UInt32

    Symbol : UInt32

    SymbolGroup : UInt32

    Flags : UInt32

}
