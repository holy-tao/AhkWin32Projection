#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for specifying iSCSI target login options.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_LOGIN_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_LOGIN_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_iscsi_login_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_LOGIN_FLAG{

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static VDS_ILF_REQUIRE_IPSEC => 1

    /**
     * If this flag is set, the login is allowed to proceed and create a new login session even if there is already a login session to the target.
     *       
     * 
     * <div class="alert"><b>Note</b>  Multipathing software must be present or else data corruption may occur.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static VDS_ILF_MULTIPATH_ENABLED => 2
}
