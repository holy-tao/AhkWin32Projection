#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemPath interface is the primary interface for the object path parser and makes parsing a path available to programs in a standard way. This interface is the main interface for setting and retrieving path information.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbempath
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemDefPath extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
