#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * Defines an access control entry (ACE) for the system access control list (SACL) that specifies what types of access cause system-level notifications.
 * @remarks
 * Audit messages are stored in an event log that can be manipulated by using the Windows API event-logging functions or by using the Event Viewer (Eventvwr.exe).
 * 
 * ACE structures should be aligned on <b>DWORD</b> boundaries. All Windows memory-management functions return <b>DWORD</b>-aligned handles to memory.
 * 
 * When a <b>SYSTEM_AUDIT_ACE</b> structure is created, sufficient memory must be allocated to accommodate the complete SID of the trustee in the <b>SidStart</b> member and the contiguous memory that follows it.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_audit_ace
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_AUDIT_ACE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to SYSTEM_AUDIT_ACE_TYPE, and the <b>AceSize</b> member should be set to the total number of bytes allocated for the <b>SYSTEM_AUDIT_ACE</b> structure.
     */
    Header : ACE_HEADER

    /**
     * Specifies an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that gives the access rights that cause audit messages to be generated. The SUCCESSFUL_ACCESS_ACE_FLAG and FAILED_ACCESS_ACE_FLAG flags in the <b>AceFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure indicate whether messages are generated for successful access attempts, unsuccessful access attempts, or both.
     */
    Mask : UInt32

    /**
     * The first <b>DWORD</b> of a  trustee's SID. The remaining bytes of the SID  are stored in contiguous memory after the <b>SidStart</b> member. This SID can be appended with application data. 
     * 
     * An access attempt of a kind specified by the <b>Mask</b> member by any trustee whose SID matches the <b>SidStart</b> member causes the system to generate an audit message. If an application does not specify a SID for this member, audit messages are generated for the specified access rights for all trustees.
     */
    SidStart : UInt32

}
