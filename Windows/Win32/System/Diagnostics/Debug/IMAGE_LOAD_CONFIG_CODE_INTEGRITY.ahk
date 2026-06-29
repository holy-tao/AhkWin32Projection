#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_LOAD_CONFIG_CODE_INTEGRITY {
    #StructPack 4

    Flags : UInt16

    Catalog : UInt16

    CatalogOffset : UInt32

    Reserved : UInt32

}
