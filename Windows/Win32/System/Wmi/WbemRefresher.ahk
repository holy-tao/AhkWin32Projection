#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides an entry point through which refreshable objects such as enumerators or refresher objects, can be refreshed.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemrefresher
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemRefresher extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
