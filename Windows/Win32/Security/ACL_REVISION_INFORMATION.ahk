#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains revision information about an ACL structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-acl_revision_information
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACL_REVISION_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a revision number. The current revision number is ACL_REVISION.
     * @type {Integer}
     */
    AclRevision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
