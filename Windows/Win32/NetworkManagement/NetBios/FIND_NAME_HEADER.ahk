#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FIND_NAME_HEADER structure contains information about a network name. This structure is followed by as many FIND_NAME_BUFFER structures as are required to describe the name.
 * @remarks
 * 
  * The <b>FIND_NAME_HEADER</b> structure is pointed to by the <b>ncb_buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure when an application issues an <b>NCBFINDNAME</b> command.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//nb30/ns-nb30-find_name_header
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class FIND_NAME_HEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Specifies the number of nodes on which the specified name was found. This structure is followed by the number of <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-find_name_buffer">FIND_NAME_BUFFER</a> structures specified by the <b>node_count</b> member.
     * @type {Integer}
     */
    node_count {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies whether the name is unique. This value is 0 to specify a unique name or 1 to specify a group.
     * @type {Integer}
     */
    unique_group {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
