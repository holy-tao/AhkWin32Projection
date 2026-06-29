#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_NPEM_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    Capability : IntPtr

    Control : IntPtr

    Status : IntPtr

}
