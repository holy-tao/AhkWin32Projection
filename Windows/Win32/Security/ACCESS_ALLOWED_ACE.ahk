#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * Defines an access control entry (ACE) for the discretionary access control list (DACL) that controls access to an object. An access-allowed ACE allows access to an object for a specific trustee identified by a security identifier (SID).
 * @remarks
 * ACE structures must be aligned on <b>DWORD</b> boundaries. All Windows memory-management functions return <b>DWORD</b>-aligned handles to memory.
 * 
 * The access rights specified by the <b>Mask</b> member are granted to any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a> that possesses an enabled SID that matches the SID stored in the <b>SidStart</b> member.
 * 
 * An <b>ACCESS_ALLOWED_ACE</b> structure can be created in an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace">AddAccessAllowedAce</a> or <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessallowedaceex">AddAccessAllowedAceEx</a> function. When these functions are used, the correct amount of memory needed to accommodate the trustee's SID is allocated and the values of the <b>Header.AceType</b> and <b>Header.AceSize</b> members are set automatically. If the <b>AddAccessAllowedAceEx</b> function is used, the <b>Header.AceFlags</b> member is also set. When an <b>ACCESS_ALLOWED_ACE</b> structure is created outside an ACL, sufficient memory must be allocated to accommodate the complete SID of the trustee in the <b>SidStart</b> member and the contiguous memory following it, and the values of the <b>Header.AceType</b>, <b>Header.AceFlags</b>, and <b>Header.AceSize</b> members must be set explicitly by the application.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_allowed_ace
 * @namespace Windows.Win32.Security
 */
export default struct ACCESS_ALLOWED_ACE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to ACCESS_ALLOWED_ACE_TYPE, and the <b>AceSize</b> member should be set to the total number of bytes allocated for the <b>ACCESS_ALLOWED_ACE</b> structure.
     */
    Header : ACE_HEADER

    /**
     * Specifies an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that specifies the access rights granted by this ACE.
     */
    Mask : UInt32

    /**
     * The first <b>DWORD</b> of a trustee's SID. The remaining bytes of the SID  are stored in contiguous memory after the <b>SidStart</b> member. This SID can be appended with application data.
     */
    SidStart : UInt32

}
