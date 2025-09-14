#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a collection of connection groups.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_host_connection_group
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_HOST_CONNECTION_GROUP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A string containing the host name.
     * @type {Pointer<PWSTR>}
     */
    pwszHost {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of elements in *pConnectionGroups*.
     * @type {Integer}
     */
    cConnectionGroups {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[PWINHTTP_CONNECTION_GROUP](ns-winhttp-winhttp_connection_group.md)**
     * 
     * An array of [WINHTTP_CONNECTION_GROUP](ns-winhttp-winhttp_connection_group.md) objects.
     * @type {Pointer<WINHTTP_CONNECTION_GROUP>}
     */
    pConnectionGroups {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
