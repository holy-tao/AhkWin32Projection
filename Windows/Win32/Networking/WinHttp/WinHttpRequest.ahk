#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequest
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequest extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
