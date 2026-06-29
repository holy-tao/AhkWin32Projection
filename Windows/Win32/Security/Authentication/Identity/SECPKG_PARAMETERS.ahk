#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The SECPKG_PARAMETERS structure contains information about the computer system. This structure is used by the SpInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_parameters
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_PARAMETERS {
    #StructPack 8

    /**
     * The version of the Security Support Provider Interface in use.
     */
    Version : UInt32

    /**
     * The state of the machine. The following table lists the valid values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_STATE_ENCRYPTION_PERMITTED"></a><a id="secpkg_state_encryption_permitted"></a><dl>
     * <dt><b>SECPKG_STATE_ENCRYPTION_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> may use encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED"></a><a id="secpkg_state_strong_encryption_permitted"></a><dl>
     * <dt><b>SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security package may use strong encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_STATE_DOMAIN_CONTROLLER"></a><a id="secpkg_state_domain_controller"></a><dl>
     * <dt><b>SECPKG_STATE_DOMAIN_CONTROLLER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The machine is a domain controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_STATE_WORKSTATION"></a><a id="secpkg_state_workstation"></a><dl>
     * <dt><b>SECPKG_STATE_WORKSTATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The machine is a workstation with access to a network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_STATE_STANDALONE"></a><a id="secpkg_state_standalone"></a><dl>
     * <dt><b>SECPKG_STATE_STANDALONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The machine is a stand-alone system.
     * 
     * </td>
     * </tr>
     * </table>
     */
    MachineState : UInt32

    /**
     * Contains a nonzero value if setup is running.
     */
    SetupMode : UInt32

    /**
     * The security identifier of the primary domain.
     */
    DomainSid : PSID

    /**
     * The name of the primary domain.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * The Domain Name System (DNS) name of the primary domain.
     */
    DnsDomainName : LSA_UNICODE_STRING

    /**
     * The GUID of the primary domain.
     */
    DomainGuid : Guid

}
