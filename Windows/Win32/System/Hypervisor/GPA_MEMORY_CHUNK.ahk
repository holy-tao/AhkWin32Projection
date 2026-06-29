#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct GPA_MEMORY_CHUNK {
    #StructPack 8

    GuestPhysicalStartPageIndex : Int64

    PageCount : Int64

}
