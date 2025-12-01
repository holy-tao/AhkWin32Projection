#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IMMCVersionInfo interface provides version information about the installed MMC application.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-immcversioninfo
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMCVersionInfo extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
