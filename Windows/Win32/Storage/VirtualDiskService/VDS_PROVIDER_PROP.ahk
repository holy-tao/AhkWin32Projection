#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PROVIDER_TYPE.ahk" { VDS_PROVIDER_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_PROVIDER_PROP structure (vdshwprv.h) defines the properties of a provider object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsprovider-getproperties">IVdsProvider::GetProperties</a> method 
 *     returns this structure to report the property details of a provider object.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_provider_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PROVIDER_PROP {
    #StructPack 8

    /**
     * The GUID of the provider object.
     */
    id : Guid

    /**
     * A string representing the name of the provider.
     */
    pwszName : PWSTR

    /**
     * The version-specific GUID of the provider.
     */
    guidVersionId : Guid

    /**
     * A string representing the version of the provider.
     */
    pwszVersion : PWSTR

    /**
     * The provider types enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_type">VDS_PROVIDER_TYPE</a>.
     */
    type : VDS_PROVIDER_TYPE

    /**
     * The provider flags enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_flag">VDS_PROVIDER_FLAG</a>.
     */
    ulFlags : UInt32

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
     */
    ulStripeSizeFlags : UInt32

    /**
     * The rebuild priority used by software providers to specify the regeneration order when a mirrored or 
     *       striped with parity (RAID-5) volume requires rebuilding. Priority levels are 0 (lowest priority) to 15 (highest priority). VDS propagates the 
     *       priority to all new volumes created by the provider. Thus, all volumes managed by a provider have the same 
     *       rebuild priority.
     * 
     * This member does not apply to the basic provider and is zero for the dynamic provider.
     */
    sRebuildPriority : Int16

}
