#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Enables or disables CABAC (context-adaptive binary arithmetic coding) for H.264 entropy coding.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avench264cabacenable
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncH264CABACEnable extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
