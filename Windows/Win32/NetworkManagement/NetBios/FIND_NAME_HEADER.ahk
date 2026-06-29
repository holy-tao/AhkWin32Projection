#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FIND_NAME_HEADER structure contains information about a network name. This structure is followed by as many FIND_NAME_BUFFER structures as are required to describe the name.
 * @remarks
 * The <b>FIND_NAME_HEADER</b> structure is pointed to by the <b>ncb_buffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure when an application issues an <b>NCBFINDNAME</b> command.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-find_name_header
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct FIND_NAME_HEADER {
    #StructPack 2

    /**
     * Specifies the number of nodes on which the specified name was found. This structure is followed by the number of <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-find_name_buffer">FIND_NAME_BUFFER</a> structures specified by the <b>node_count</b> member.
     */
    node_count : UInt16

    /**
     * Reserved
     */
    reserved : Int8

    /**
     * Specifies whether the name is unique. This value is 0 to specify a unique name or 1 to specify a group.
     */
    unique_group : Int8

}
