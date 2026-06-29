#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * The ACCESS_ALLOWED_CALLBACK_ACE structure defines an access control entry for the discretionary access control list that controls access to an object.
 * @remarks
 * ACE structures must be aligned on <b>DWORD</b> boundaries. All Windows memory-management functions return <b>DWORD</b>-aligned handles to memory.
 * 
 * The access rights specified by the <b>Mask</b> member are granted to any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a> that possesses an enabled SID that matches the SID stored in the <b>SidStart</b> member.
 * 
 * When an <b>ACCESS_ALLOWED_CALLBACK_ACE</b> structure is created, sufficient memory must be allocated to accommodate the complete SID of the trustee in the <b>SidStart</b> member and the contiguous memory that follows it.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_allowed_callback_ace
 * @namespace Windows.Win32.Security
 */
export default struct ACCESS_ALLOWED_CALLBACK_ACE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to ACCESS_ALLOWED_CALLBACK_ACE_TYPE, and the <b>AceSize</b> member should be set to the total number of bytes allocated for the <b>ACCESS_ALLOWED_CALLBACK_ACE</b> structure.
     */
    Header : ACE_HEADER

    /**
     * Specifies an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that specifies the access rights granted by this ACE.
     */
    Mask : UInt32

    /**
     * The first <b>DWORD</b> of a trustee's SID.
     */
    SidStart : UInt32

}
