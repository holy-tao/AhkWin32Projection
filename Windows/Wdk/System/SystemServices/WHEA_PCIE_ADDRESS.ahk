#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIE_ADDRESS {
    #StructPack 4

    Segment : UInt32

    Bus : UInt32

    Device : UInt32

    Function : UInt32

}
