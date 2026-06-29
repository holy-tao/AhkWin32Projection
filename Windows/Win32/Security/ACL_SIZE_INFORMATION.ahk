#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the size of an ACL structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-acl_size_information
 * @namespace Windows.Win32.Security
 */
export default struct ACL_SIZE_INFORMATION {
    #StructPack 4

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL).
     */
    AceCount : UInt32

    /**
     * The number of bytes in the ACL actually used to store the ACEs and <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure. This may be less than the total number of bytes allocated to the ACL.
     */
    AclBytesInUse : UInt32

    /**
     * The number of unused bytes in the ACL.
     */
    AclBytesFree : UInt32

}
