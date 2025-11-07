#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid types for authentication when logging into an iSCSI target.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_AUTH_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_AUTH_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_iscsi_auth_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_AUTH_TYPE{

    /**
     * No authentication is performed.
     * @type {Integer (Int32)}
     */
    static VDS_IAT_NONE => 0

    /**
     * One-way CHAP authentication is performed (target authenticates initiator). The target CHAP secret must be 
     *      specified during login.
     * @type {Integer (Int32)}
     */
    static VDS_IAT_CHAP => 1

    /**
     * Mutual CHAP authentication is performed (target authenticates initiator and initiator authenticates 
     *      target). The target CHAP secret must be specified and the initiator CHAP secret must also have been set.
     * @type {Integer (Int32)}
     */
    static VDS_IAT_MUTUAL_CHAP => 2
}
