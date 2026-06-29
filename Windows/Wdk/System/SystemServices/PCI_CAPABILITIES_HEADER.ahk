#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_CAPABILITIES_HEADER {
    #StructPack 1

    CapabilityID : Int8

    Next : Int8

}
