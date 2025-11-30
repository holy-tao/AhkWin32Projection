#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for a provider.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_provider_prop">VDS_PROVIDER_PROP</a> structure includes a <b>VDS_PROVIDER_TYPE</b> 
 *     value as a member to report the provider type. The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsadmin-registerprovider">IVdsAdmin::RegisterProvider</a> method passes 
 *     a <b>VDS_PROVIDER_TYPE</b> value as an argument to indicate the provider type during registration with VDS.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PROVIDER_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PROVIDER_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_provider_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PROVIDER_TYPE extends Win32Enum{

    /**
     * The provider type is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_PT_UNKNOWN => 0

    /**
     * The provider is a software provider.
     * @type {Integer (Int32)}
     */
    static VDS_PT_SOFTWARE => 1

    /**
     * The provider is a hardware provider.
     * @type {Integer (Int32)}
     */
    static VDS_PT_HARDWARE => 2

    /**
     * The provider is a virtual disk provider.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_PT_VIRTUALDISK => 3

    /**
     * This value is reserved for system use.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_PT_MAX => 4
}
