#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_DEBUGGING_DEVICE_IN_USE {
    #StructPack 4

    Segment : UInt16

    Bus : UInt32

    Slot : UInt32

}
