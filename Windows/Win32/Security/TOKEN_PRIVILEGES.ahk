#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LUID_AND_ATTRIBUTES.ahk" { LUID_AND_ATTRIBUTES }
#Import ".\TOKEN_PRIVILEGES_ATTRIBUTES.ahk" { TOKEN_PRIVILEGES_ATTRIBUTES }
#Import "..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information about a set of privileges for an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_privileges
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_PRIVILEGES {
    #StructPack 4

    /**
     * This must be set to the number of entries in the <b>Privileges</b> array.
     */
    PrivilegeCount : UInt32

    /**
     * Specifies an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structures. Each structure contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> and attributes of a privilege. To get the name of the privilege associated with a  <b>LUID</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupprivilegenamea">LookupPrivilegeName</a> function, passing the address of the <b>LUID</b> as the value of the <i>lpLuid</i> parameter.
     * 
     * <div class="alert"><b>Important</b>  The constant<b> ANYSIZE_ARRAY</b> is defined as 1 in the public header Winnt.h. To create this array with more than one element, you must allocate sufficient memory for the structure to take into account additional elements.</div>
     * <div> </div>
     */
    Privileges : LUID_AND_ATTRIBUTES[1]

}
