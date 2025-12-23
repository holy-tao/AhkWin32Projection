#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSPDATA structure contains service provider information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wspdata
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSPDATA extends Win32Struct
{
    static sizeof => 516

    static packingSize => 2

    /**
     * Version of the Windows Sockets SPI specification that the Windows Sockets service provider expects the caller to use.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Highest version of the Windows Sockets SPI specification that this service provider can support (also encoded as above). Normally this will be the same as **wVersion**.
     * @type {Integer}
     */
    wHighVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Null-terminated Unicode string into which the Windows Sockets provider copies a description of itself. The text (up to 256 characters in length) can contain any characters except control and formatting characters: the most likely use to which an SPI client will put this is to display it (possibly truncated) in a status message.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 4, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4, 255, "UTF-16")
    }
}
