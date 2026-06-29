#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * Defines an access control entry (ACE) for the system access control list (SACL) that specifies the scoped policy identifier for a securable object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_scoped_policy_id_ace
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_SCOPED_POLICY_ID_ACE {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of the ACE. The structure also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure must be set to <b>SYSTEM_SCOPED_POLICY_ID_ACE</b>, and the <b>AceSize</b> member must be set to the total number of bytes allocated for the <b>SYSTEM_SCOPED_POLICY_ID_ACE</b> structure.
     */
    Header : ACE_HEADER

    /**
     * The access policy associated with the SACL that contains this ACE.
     */
    Mask : UInt32

    /**
     * Specifies the first <b>DWORD</b> of a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>.
     */
    SidStart : UInt32

}
