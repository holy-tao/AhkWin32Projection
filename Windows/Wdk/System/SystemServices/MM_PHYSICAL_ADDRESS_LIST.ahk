#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MM_PHYSICAL_ADDRESS_LIST {
    #StructPack 8

    PhysicalAddress : Int64

    NumberOfBytes : IntPtr

}
