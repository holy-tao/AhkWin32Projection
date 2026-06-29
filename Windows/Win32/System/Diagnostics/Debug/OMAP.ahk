#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an entry in an address map.
 * @remarks
 * An address map provides a translation from one image layout (A) to another (B). An array of OMAP structures, sorted by <b>rva</b>, defines an address map.
 * 
 * To translate an address, addrA, in image A to an address, addrB, in image B, perform the following steps:
 * 
 * <ol>
 * <li>Search the map for the entry, e, with the largest rva less than or equal to addrA.</li>
 * <li>Set delta = addrA – e.rva.</li>
 * <li>Set addrB = e.rvaTo + delta.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-omap
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct OMAP {
    #StructPack 4

    /**
     * A relative virtual address (RVA) in image A.
     */
    rva : UInt32

    /**
     * The relative virtual address that <b>rva</b> is mapped to in image B.
     */
    rvaTo : UInt32

}
