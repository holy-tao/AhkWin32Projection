#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for a hardware provider.
 * @remarks
 * 
 * If your application encounters a <b>VDS_HWPROVIDER_TYPE</b> value that it does not recognize, it should display the provider type as unknown. It should not attempt to map the unrecognized provider type to another provider type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_HWPROVIDER_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_HWPROVIDER_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_hwprovider_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HWPROVIDER_TYPE extends Win32Enum{

    /**
     * The type is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_HWT_UNKNOWN => 0

    /**
     * The type indicates a hardware provider for PCI RAID cards.
     * @type {Integer (Int32)}
     */
    static VDS_HWT_PCI_RAID => 1

    /**
     * The type indicates a hardware provider for Fibre Channel storage array networks.
     * @type {Integer (Int32)}
     */
    static VDS_HWT_FIBRE_CHANNEL => 2

    /**
     * The type indicates a hardware provider for iSCSI storage array networks.
     * @type {Integer (Int32)}
     */
    static VDS_HWT_ISCSI => 3

    /**
     * The type indicates a hardware provider for serial attached SCSI (SAS) storage array networks.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003 R2:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static VDS_HWT_SAS => 4

    /**
     * The type indicates a hybrid hardware provider. A hybrid provider is a provider that manages subsystems that support multiple interconnect types. This is not a valid value for the  
     *   <b>type</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_path_info">VDS_PATH_INFO</a> 
     *   structure.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003 R2:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static VDS_HWT_HYBRID => 5
}
