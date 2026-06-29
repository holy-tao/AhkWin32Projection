#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_ARCHITECTURE_ENTRY {
    #StructPack 4

    FixupInstRVA : UInt32

    NewInst : UInt32

}
