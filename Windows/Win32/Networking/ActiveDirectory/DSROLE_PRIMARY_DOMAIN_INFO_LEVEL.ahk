#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used with the DsRoleGetPrimaryDomainInformation function to specify the type of data to retrieve.
 * @see https://docs.microsoft.com/windows/win32/api//dsrole/ne-dsrole-dsrole_primary_domain_info_level
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_PRIMARY_DOMAIN_INFO_LEVEL{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/nf-dsrole-dsrolegetprimarydomaininformation">DsRoleGetPrimaryDomainInformation</a> function retrieves data from a <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ns-dsrole-dsrole_primary_domain_info_basic">DSROLE_PRIMARY_DOMAIN_INFO_BASIC</a> structure.
     * @type {Integer (Int32)}
     */
    static DsRolePrimaryDomainInfoBasic => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/nf-dsrole-dsrolegetprimarydomaininformation">DsRoleGetPrimaryDomainInformation</a> function retrieves from a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ns-dsrole-dsrole_upgrade_status_info">DSROLE_UPGRADE_STATUS_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static DsRoleUpgradeStatus => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/nf-dsrole-dsrolegetprimarydomaininformation">DsRoleGetPrimaryDomainInformation</a> function retrieves data from a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ns-dsrole-dsrole_operation_state_info">DSROLE_OPERATION_STATE_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static DsRoleOperationState => 3
}
