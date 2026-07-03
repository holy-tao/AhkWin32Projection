#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCIBUSDATA {
    #StructPack 8

    Tag : UInt32

    Version : UInt32

    ReadConfig : IntPtr

    WriteConfig : IntPtr

    Pin2Line : IntPtr

    Line2Pin : IntPtr

    ParentSlot : IntPtr

    Reserved : IntPtr[4]

}
