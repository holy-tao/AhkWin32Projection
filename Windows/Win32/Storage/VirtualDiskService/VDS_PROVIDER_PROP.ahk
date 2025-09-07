#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_PROVIDER_PROP structure (vdshwprv.h) defines the properties of a provider object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsprovider-getproperties">IVdsProvider::GetProperties</a> method 
  *     returns this structure to report the property details of a provider object.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_provider_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PROVIDER_PROP extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The GUID of the provider object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A string representing the name of the provider.
     * @type {Pointer<Ptr>}
     */
    pwszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The version-specific GUID of the provider.
     * @type {Pointer<Guid>}
     */
    guidVersionId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A string representing the version of the provider.
     * @type {Pointer<Ptr>}
     */
    pwszVersion {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The provider types enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_type">VDS_PROVIDER_TYPE</a>.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The provider flags enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_flag">VDS_PROVIDER_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The size of a stripe to be used across multiple disks managed by a software provider. A stripe size must be 
     *       a power of 2. Each bit in the 32-bit integer represents a size, in bytes. For example, if the <i>n</i>th bit is set, then 
     *       VDS supports stripe size of 2^<i>n</i>. Thus, bits 0 through 31 can specify 2^0 through 2^31.
     * 
     * The basic provider sets this value to zero. The dynamic stripe size can be any power of 2 ranging from 512 
     *       to 1MB.
     *      
     * 
     * <b>Windows Server 2003:  </b>The dynamic provider sets this value to 64k.
     * @type {Integer}
     */
    ulStripeSizeFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The rebuild priority used by software providers to specify the regeneration order when a mirrored or 
     *       striped with parity (RAID-5) volume requires rebuilding. Priority levels are 0 (lowest priority) to 15 (highest priority). VDS propagates the 
     *       priority to all new volumes created by the provider. Thus, all volumes managed by a provider have the same 
     *       rebuild priority.
     * 
     * This member does not apply to the basic provider and is zero for the dynamic provider.
     * @type {Integer}
     */
    sRebuildPriority {
        get => NumGet(this, 44, "short")
        set => NumPut("short", value, this, 44)
    }
}
