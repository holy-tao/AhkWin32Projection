#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_PRI_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    Control : IntPtr

    Status : IntPtr

    PRCapacity : UInt32

    PRAllocation : UInt32

}
