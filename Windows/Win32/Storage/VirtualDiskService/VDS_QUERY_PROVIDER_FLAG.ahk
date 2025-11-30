#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid flags for provider query operations. Callers can query for hardware providers, software providers, or both.
 * @remarks
 * 
 * This enumeration provides the value for the <i>masks</i> parameter of the  <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-queryproviders">IVdsService::QueryProviders</a> method. You can specify more than  one value in the same query. For example, to query for software and hardware providers, specify both VDS_QUERY_SOFTWARE_PROVIDERS and VDS_QUERY_HARDWARE_PROVIDERS in the <i>masks</i> parameter.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_QUERY_PROVIDER_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_QUERY_PROVIDER_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_query_provider_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_QUERY_PROVIDER_FLAG extends Win32Enum{

    /**
     * If set, the operation queries for software providers.
     * @type {Integer (Int32)}
     */
    static VDS_QUERY_SOFTWARE_PROVIDERS => 1

    /**
     * If set, the operation queries for hardware providers.
     * @type {Integer (Int32)}
     */
    static VDS_QUERY_HARDWARE_PROVIDERS => 2

    /**
     * If set, the operation queries for virtual disk providers.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_QUERY_VIRTUALDISK_PROVIDERS => 4
}
