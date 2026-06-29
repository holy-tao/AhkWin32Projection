#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_MEMORY_RANGE_ENTRY {
    #StructPack 8

    GuestAddress : Int64

    SizeInBytes : Int64

}
