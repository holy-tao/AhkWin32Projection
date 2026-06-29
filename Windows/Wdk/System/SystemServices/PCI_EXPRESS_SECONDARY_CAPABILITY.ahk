#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_SECONDARY_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    LinkControl3 : IntPtr

    LaneErrorStatus : IntPtr

}
