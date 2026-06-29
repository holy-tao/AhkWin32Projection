#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_AGP_EXTENDED_CAPABILITY {
    #StructPack 8

    IsochStatus : IntPtr

    AgpControl : IntPtr

    ApertureSize : UInt16

    AperturePageSize : IntPtr

    GartLow : UInt32

    GartHigh : UInt32

    IsochCommand : IntPtr

}
