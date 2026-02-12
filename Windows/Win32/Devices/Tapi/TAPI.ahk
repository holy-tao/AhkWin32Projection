#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TAPI\_AUDIO\_STREAM\_CONFIG\_CAPS structure is contained by the TAPI\_STREAM\_CONFIG\_CAPS structure when the CapsType member is set to the AudioCap member of the StreamConfigCapsType union.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/Tapi/tapi-audio-stream-config-caps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
