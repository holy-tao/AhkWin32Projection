#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The RSOP_TARGET structure contains computer and user information required by the GenerateGroupPolicy function.
 * @see https://docs.microsoft.com/windows/win32/api//userenv/ns-userenv-rsop_target
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class RSOP_TARGET extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to the account name of the computer or the user.
     * @type {PWSTR}
     */
    pwszAccountName{
        get {
            if(!this.HasProp("__pwszAccountName"))
                this.__pwszAccountName := PWSTR(this.ptr + 0)
            return this.__pwszAccountName
        }
    }

    /**
     * Pointer to the new domain or organizational unit that is the location for the account identified by the <b>pwszAccountName</b> member. This member can be <b>NULL</b>.
     * @type {PWSTR}
     */
    pwszNewSOM{
        get {
            if(!this.HasProp("__pwszNewSOM"))
                this.__pwszNewSOM := PWSTR(this.ptr + 8)
            return this.__pwszNewSOM
        }
    }

    /**
     * Pointer to a <b>SAFEARRAY</b> that contains a proposed list of new security groups. This member can be <b>NULL</b>. For more information about security groups, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/filtering-the-scope-of-a-gpo">Filtering the Scope of a GPO</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a>.
     * @type {Pointer<SAFEARRAY>}
     */
    psaSecurityGroups {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to an <b>RSOPTOKEN</b> to use with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-rsopaccesscheckbytype">RSoPAccessCheckByType</a> and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-rsopfileaccesscheck">RSoPFileAccessCheck</a> functions.
     * @type {Pointer<Void>}
     */
    pRsopToken {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a> structure containing a linked list of GPOs.
     * @type {Pointer<GROUP_POLICY_OBJECTA>}
     */
    pGPOList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the WMI services pointer to the namespace to which the planning mode policy data should be written.
     * @type {Pointer<IWbemServices>}
     */
    pWbemServices {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
