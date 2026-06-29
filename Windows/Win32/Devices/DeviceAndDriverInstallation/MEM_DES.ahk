#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MD_FLAGS.ahk" { MD_FLAGS }

/**
 * The MEM_DES structure is used for specifying either a resource list or a resource requirements list that describes memory usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mem_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MEM_DES {
    #StructPack 8

    MD_Count : UInt32

    /**
     * Must be set to the constant value <b>MType_Range</b>.
     */
    MD_Type : UInt32

    MD_Alloc_Base : Int64

    MD_Alloc_End : Int64

    /**
     * One bit flag from <i>each</i> of the flag sets described in the following table.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Read-Only Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_ROM</b>
     * 
     * </td>
     * <td>
     * The specified memory range is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_RAM</b>
     * 
     * </td>
     * <td>
     * The specified memory range is not read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mMD_MemoryType</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>MD_Flags</b> that specifies the read-only attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Write-Only Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_ReadDisallowed</b>
     * 
     * </td>
     * <td>
     * The specified memory range is write-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_ReadAllowed</b>
     * 
     * </td>
     * <td>
     * The specified memory range is not write-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mMD_Readable</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>MD_Flags</b> that specifies the write-only attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Address Size Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_24</b>
     * 
     * </td>
     * <td>
     * 24-bit addressing (<i>not used</i>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_32</b>
     * 
     * </td>
     * <td>
     * 32-bit addressing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mMD_32_24</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>MD_Flags</b> that specifies the address size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Prefetch Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_PrefetchAllowed</b>
     * 
     * </td>
     * <td>
     * The specified memory range can be prefetched.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_PrefetchDisallowed</b>
     * 
     * </td>
     * <td>
     * The specified memory range cannot be prefetched.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mMD_Prefetchable</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>MD_Flags</b> that specifies the prefetch ability.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Caching Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_Cacheable</b>
     * 
     * </td>
     * <td>
     * The specified memory range can be cached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_NonCacheable</b>
     * 
     * </td>
     * <td>
     * The specified memory range cannot be cached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mMD_Cacheable</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>MD_Flags</b> that specifies the caching ability.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Combined-Write Caching Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_CombinedWriteAllowed</b>
     * 
     * </td>
     * <td>
     * Combined-write caching is allowed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fMD_CombinedWriteDisallowed</b>
     * 
     * </td>
     * <td>
     * Combined-write caching is not allowed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mMD_CombinedWrite</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>MD_Flags</b> that specifies the combine-write caching ability.
     * 
     * </td>
     * </tr>
     * </table>
     */
    MD_Flags : MD_FLAGS

    /**
     * <i>For internal use only.</i>
     */
    MD_Reserved : UInt32

}
