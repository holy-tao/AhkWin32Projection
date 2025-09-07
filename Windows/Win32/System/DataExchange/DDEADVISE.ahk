#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains flags that specify how a DDE server application should send data to a client application during an advise loop. A client passes a handle to a DDEADVISE structure to a server as part of a WM_DDE_ADVISE message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddeadvise
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEADVISE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>short</b>
     * 
     * The client application's preferred data format. The format must be a standard or registered clipboard format. The following standard clipboard formats can be used:
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
