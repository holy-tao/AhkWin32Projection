#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a connection group.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_connection_group
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_CONNECTION_GROUP extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of connections marked with *guidGroup*.
     * @type {Integer}
     */
    cConnections {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A http connection **GUID**.
     * @type {Guid}
     */
    guidGroup {
        get {
            if(!this.HasProp("__guidGroup"))
                this.__guidGroup := Guid(4, this)
            return this.__guidGroup
        }
    }
}
