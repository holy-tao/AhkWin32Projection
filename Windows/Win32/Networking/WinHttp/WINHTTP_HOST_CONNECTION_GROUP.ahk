#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINHTTP_CONNECTION_GROUP.ahk" { WINHTTP_CONNECTION_GROUP }

/**
 * Represents a collection of connection groups.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_host_connection_group
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_HOST_CONNECTION_GROUP {
    #StructPack 8

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A string containing the host name.
     */
    pwszHost : PWSTR

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of elements in *pConnectionGroups*.
     */
    cConnectionGroups : UInt32

    /**
     * Type: **[PWINHTTP_CONNECTION_GROUP](ns-winhttp-winhttp_connection_group.md)**
     * 
     * An array of [WINHTTP_CONNECTION_GROUP](ns-winhttp-winhttp_connection_group.md) objects.
     */
    pConnectionGroups : WINHTTP_CONNECTION_GROUP.Ptr

}
