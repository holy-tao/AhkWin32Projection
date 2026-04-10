#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemStatusCodeText interface extracts text string descriptions of error codes or the name of the subsystem where the error occurred.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemstatuscodetext
 * @namespace Windows.Win32.System.Wmi
 */
class WbemStatusCodeText extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
