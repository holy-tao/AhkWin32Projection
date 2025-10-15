#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * The SECPKG_PARAMETERS structure contains information about the computer system. This structure is used by the SpInitialize function.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_parameters
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The version of the Security Support Provider Interface in use.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    MachineState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains a nonzero value if setup is running.
     * @type {Integer}
     */
    SetupMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The security identifier of the primary domain.
     * @type {PSID}
     */
    DomainSid{
        get {
            if(!this.HasProp("__DomainSid"))
                this.__DomainSid := PSID(this.ptr + 16)
            return this.__DomainSid
        }
    }

    /**
     * The name of the primary domain.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__DomainName
        }
    }

    /**
     * The Domain Name System (DNS) name of the primary domain.
     * @type {LSA_UNICODE_STRING}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__DnsDomainName
        }
    }

    /**
     * The GUID of the primary domain.
     * @type {Pointer<Guid>}
     */
    DomainGuid {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
