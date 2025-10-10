#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies constraints on the set of values which can be deserialized.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_bytes_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_BYTES_DESCRIPTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the minimum number of bytes.
     * @type {Integer}
     */
    minByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the maximum number of bytes.
     * @type {Integer}
     */
    maxByteCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
