#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the GUID of a connection, for purposes of connection-matching.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_match_connection_guid
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
class WINHTTP_MATCH_CONNECTION_GUID extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A connection's **GUID**.
     * 
     * When **WINHTTP_OPTION_MATCH_CONNECTION_GUID** is set on a request, WinHttp attempts to serve the request on a connection matching *ConnectionGuid*.
     * @type {Guid}
     */
    ConnectionGuid {
        get {
            if(!this.HasProp("__ConnectionGuid"))
                this.__ConnectionGuid := Guid(0, this)
            return this.__ConnectionGuid
        }
    }

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Flags.
     * 
     * Due to the nature of connection-matching logic, it's possible for an unmarked connection to be assigned to serve the request (if one is encountered before a matching marked connection is). Set *ullFlags* to **WINHTTP_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION** if you don't want an unmarked connection to be matched. When using that flag, if no matching marked connection is found, then a new connection is created, and the request is sent on that connection.
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
