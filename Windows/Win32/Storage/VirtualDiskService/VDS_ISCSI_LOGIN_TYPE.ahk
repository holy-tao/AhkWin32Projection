#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for logging into an iSCSI target.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_LOGIN_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_LOGIN_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_iscsi_login_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_LOGIN_TYPE extends Win32Enum{

    /**
     * A manual, one-time login is performed.
     * @type {Integer (Int32)}
     */
    static VDS_ILT_MANUAL => 0

    /**
     * A persistent login is performed.
     * @type {Integer (Int32)}
     */
    static VDS_ILT_PERSISTENT => 1

    /**
     * A persistent login is performed such that the target is present at startup.
     * @type {Integer (Int32)}
     */
    static VDS_ILT_BOOT => 2
}
