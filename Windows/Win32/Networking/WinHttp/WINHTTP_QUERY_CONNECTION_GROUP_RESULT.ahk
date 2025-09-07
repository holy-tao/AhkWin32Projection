#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a collection of host connection groups.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_query_connection_group_result
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_QUERY_CONNECTION_GROUP_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of elements in *pHostConnectionGroups*.
     * @type {Integer}
     */
    cHosts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[PWINHTTP_HOST_CONNECTION_GROUP](ns-winhttp-winhttp_host_connection_group.md)**
     * 
     * An array of [WINHTTP_HOST_CONNECTION_GROUP](ns-winhttp-winhttp_host_connection_group.md) objects.
     * @type {Pointer<WINHTTP_HOST_CONNECTION_GROUP>}
     */
    pHostConnectionGroups {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
