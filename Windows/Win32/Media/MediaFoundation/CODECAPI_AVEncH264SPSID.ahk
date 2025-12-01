#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets the sequence parameter set (SPS) identifier in the SPS network abstraction layer (NAL) unit of the H.264 bit stream.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avench264spsid
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncH264SPSID extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
