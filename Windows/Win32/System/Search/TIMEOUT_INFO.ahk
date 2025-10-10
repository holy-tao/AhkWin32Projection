#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores time-out values for connections and data.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ns-searchapi-timeout_info
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class TIMEOUT_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time-out value for a connection, in seconds.
     * @type {Integer}
     */
    dwConnectTimeout {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time-out value for data, in seconds.
     * @type {Integer}
     */
    dwDataTimeout {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
