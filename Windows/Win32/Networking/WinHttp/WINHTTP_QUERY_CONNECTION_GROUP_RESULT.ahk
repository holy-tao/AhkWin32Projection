#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_HOST_CONNECTION_GROUP.ahk" { WINHTTP_HOST_CONNECTION_GROUP }

/**
 * Represents a collection of host connection groups.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_query_connection_group_result
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_QUERY_CONNECTION_GROUP_RESULT {
    #StructPack 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of elements in *pHostConnectionGroups*.
     */
    cHosts : UInt32

    /**
     * Type: **[PWINHTTP_HOST_CONNECTION_GROUP](ns-winhttp-winhttp_host_connection_group.md)**
     * 
     * An array of [WINHTTP_HOST_CONNECTION_GROUP](ns-winhttp-winhttp_host_connection_group.md) objects.
     */
    pHostConnectionGroups : WINHTTP_HOST_CONNECTION_GROUP.Ptr

}
