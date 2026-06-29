#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The WSPDATA structure contains service provider information.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wspdata
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSPDATA {
    #StructPack 2

    /**
     * Version of the Windows Sockets SPI specification that the Windows Sockets service provider expects the caller to use.
     */
    wVersion : UInt16

    /**
     * Highest version of the Windows Sockets SPI specification that this service provider can support (also encoded as above). Normally this will be the same as **wVersion**.
     */
    wHighVersion : UInt16

    /**
     * Null-terminated Unicode string into which the Windows Sockets provider copies a description of itself. The text (up to 256 characters in length) can contain any characters except control and formatting characters: the most likely use to which an SPI client will put this is to display it (possibly truncated) in a status message.
     */
    szDescription : WCHAR[256]

}
