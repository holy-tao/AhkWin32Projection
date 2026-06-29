#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NAME_BUFFER structure contains information about a local network name. One or more NAME_BUFFER structures follows an ADAPTER_STATUS structure when an application specifies the NCBASTAT command in the ncb_command member of the NCB structure.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-name_buffer
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct NAME_BUFFER {
    #StructPack 1

    /**
     * Specifies the local network name. This value is in the <b>ncb_name</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.
     */
    name : Int8[16]

    /**
     * Specifies the number for the local network name. This value is in the <b>ncb_num</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.
     */
    name_num : Int8

    name_flags : Int8

}
