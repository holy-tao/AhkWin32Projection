#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_VIRTUAL_CHANNEL_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    Capabilities1 : IntPtr

    Capabilities2 : IntPtr

    Control : IntPtr

    Status : IntPtr

    Resource : IntPtr[8]

}
