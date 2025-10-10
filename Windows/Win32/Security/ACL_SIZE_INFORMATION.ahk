#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about the size of an ACL structure.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-acl_size_information
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACL_SIZE_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL).
     * @type {Integer}
     */
    AceCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes in the ACL actually used to store the ACEs and <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure. This may be less than the total number of bytes allocated to the ACL.
     * @type {Integer}
     */
    AclBytesInUse {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of unused bytes in the ACL.
     * @type {Integer}
     */
    AclBytesFree {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
