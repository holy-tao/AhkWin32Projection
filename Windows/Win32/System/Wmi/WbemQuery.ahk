#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides an entry point through which a WMI Query Language (WQL) query can be parsed.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbemquery
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemQuery extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
