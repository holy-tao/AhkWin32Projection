#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk
#Include .\LUID_AND_ATTRIBUTES.ahk

/**
 * Contains information about a set of privileges for an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_privileges
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_PRIVILEGES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This must be set to the number of entries in the <b>Privileges</b> array.
     * @type {Integer}
     */
    PrivilegeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structures. Each structure contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> and attributes of a privilege. To get the name of the privilege associated with a  <b>LUID</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupprivilegenamea">LookupPrivilegeName</a> function, passing the address of the <b>LUID</b> as the value of the <i>lpLuid</i> parameter.
     * 
     * <div class="alert"><b>Important</b>  The constant<b> ANYSIZE_ARRAY</b> is defined as 1 in the public header Winnt.h. To create this array with more than one element, you must allocate sufficient memory for the structure to take into account additional elements.</div>
     * <div> </div>
     * @type {Array<LUID_AND_ATTRIBUTES>}
     */
    Privileges{
        get {
            if(!this.HasProp("__PrivilegesProxyArray"))
                this.__PrivilegesProxyArray := Win32FixedArray(this.ptr + 8, 8, LUID_AND_ATTRIBUTES, "")
            return this.__PrivilegesProxyArray
        }
    }
}
