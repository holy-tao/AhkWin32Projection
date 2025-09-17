#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class VDS_POOL_CUSTOM_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A string containing the name of the custom attribute.
     * @type {Pointer<Char>}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A string containing the value of the custom attribute.
     * @type {Pointer<Char>}
     */
    pwszValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
