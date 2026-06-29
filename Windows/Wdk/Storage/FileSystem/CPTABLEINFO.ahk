#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CPTABLEINFO {
    #StructPack 8

    CodePage : UInt16

    MaximumCharacterSize : UInt16

    DefaultChar : UInt16

    UniDefaultChar : UInt16

    TransDefaultChar : UInt16

    TransUniDefaultChar : UInt16

    DBCSCodePage : UInt16

    LeadByte : Int8[12]

    MultiByteTable : IntPtr

    WideCharTable : IntPtr

    DBCSRanges : IntPtr

    DBCSOffsets : IntPtr

}
