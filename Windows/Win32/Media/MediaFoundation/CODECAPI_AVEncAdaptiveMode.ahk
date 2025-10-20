#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencadaptivemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncAdaptiveMode extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
