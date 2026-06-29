#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_NLS_STATE {
    #StructPack 8

    DefaultAcpTableInfo : IntPtr

    DefaultOemTableInfo : IntPtr

    ActiveCodePageData : IntPtr

    OemCodePageData : IntPtr

    LeadByteInfo : IntPtr

    OemLeadByteInfo : IntPtr

    CaseMappingData : IntPtr

    UnicodeUpcaseTable844 : IntPtr

    UnicodeLowercaseTable844 : IntPtr

}
