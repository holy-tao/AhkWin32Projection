#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a local policy for the File History feature. Each local policy has a numeric parameter associated with it.
 * @remarks
 * 
  * To retrieve the value of the numeric parameter for a local policy, use the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-getlocalpolicy">IFhConfigMgr::GetLocalPolicy</a> method.
  * 
  * To set the value of the numeric parameter for the local policy, use the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy">IFhConfigMgr::SetLocalPolicy</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/ne-fhcfg-fh_local_policy_type
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FH_LOCAL_POLICY_TYPE{

    /**
     * This local policy specifies how frequently backups are to be performed for the current user. The numeric parameter contains the time, in seconds, from the end of one backup until the start of the next one. The default value of the numeric parameter for this policy is 3600 seconds (1 hour).
     * @type {Integer (Int32)}
     */
    static FH_FREQUENCY => 0

    /**
     * This  local policy specifies when previous versions of files and folders can be deleted from a backup target. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_retention_types">FH_RETENTION_TYPES</a> enumeration for the list of possible values. The default value of the numeric parameter for this policy is <b>FH_RETENTION_DISABLED</b>.
     * @type {Integer (Int32)}
     */
    static FH_RETENTION_TYPE => 1

    /**
     * This local policy specifies the minimum age of previous versions that can be deleted from a backup target when the  <b>FH_RETENTION_AGE_BASED</b> retention type is specified. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_retention_types">FH_RETENTION_TYPES</a> enumeration. The numeric parameter contains the minimum age, in days. The default value of the numeric parameter for this policy is 365 days (1 year).
     * @type {Integer (Int32)}
     */
    static FH_RETENTION_AGE => 2

    /**
     * The maximum enumeration value for this enumeration. This value and all values greater than it are reserved for system use.
     * @type {Integer (Int32)}
     */
    static MAX_LOCAL_POLICY => 3
}
