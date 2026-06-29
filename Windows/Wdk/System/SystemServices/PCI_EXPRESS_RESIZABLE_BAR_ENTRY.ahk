#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_RESIZABLE_BAR_ENTRY {
    #StructPack 8

    Capability : IntPtr

    Control : IntPtr

}
