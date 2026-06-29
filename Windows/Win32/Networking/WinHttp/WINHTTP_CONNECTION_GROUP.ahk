#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a connection group.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_connection_group
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_CONNECTION_GROUP {
    #StructPack 4

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of connections marked with *guidGroup*.
     */
    cConnections : UInt32

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A http connection **GUID**.
     */
    guidGroup : Guid

}
