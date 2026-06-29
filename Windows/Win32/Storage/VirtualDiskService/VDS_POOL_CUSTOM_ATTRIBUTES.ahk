#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The VDS_POOL_CUSTOM_ATTRIBUTES structure (vdshwprv.h) defines a custom attribute of a storage pool.
 * @remarks
 * A custom attribute can be used to indicate, for example, the RAID types that can be created in the storage pool in  cases such as the following:
 * 
 * <ul>
 * <li>The storage pool supports the creation of LUNs without any RAID type.</li>
 * <li>The storage pool supports more than one RAID type. This can happen if the storage pool spans more than one subsystem.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_pool_custom_attributes
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_POOL_CUSTOM_ATTRIBUTES {
    #StructPack 8

    /**
     * A string containing the name of the custom attribute.
     */
    pwszName : PWSTR

    /**
     * A string containing the value of the custom attribute.
     */
    pwszValue : PWSTR

}
