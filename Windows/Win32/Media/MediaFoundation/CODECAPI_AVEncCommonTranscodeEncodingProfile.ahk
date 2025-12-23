#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the common transcode encoding profile.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avenccommontranscodeencodingprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncCommonTranscodeEncodingProfile extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
