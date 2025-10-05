#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a specific Remote Desktop Services server. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The wtsapi32.h header defines WTS_SERVER_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_server_infow
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTS_SERVER_INFOW extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Name of the server.
     * @type {Pointer<Char>}
     */
    pServerName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
