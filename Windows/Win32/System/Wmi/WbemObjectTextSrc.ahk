#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemObjectTextSrc interface is used to translate IWbemClassObject instances to and from differing text formats.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemobjecttextsrc
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemObjectTextSrc extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
