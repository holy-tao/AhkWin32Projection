#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NLSTABLEINFO {
    #StructPack 8

    OemTableInfo : IntPtr

    AnsiTableInfo : IntPtr

    UpperCaseTable : IntPtr

    LowerCaseTable : IntPtr

}
