#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the ASF multiplexer options.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/ne-wmcontainer-mfasf_multiplexerflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFASF_MULTIPLEXERFLAGS extends Win32Enum{

    /**
     * The multiplexer automatically adjusts the bit rate of the ASF content in response to the characteristics of the streams being multiplexed.
     * @type {Integer (Int32)}
     */
    static MFASF_MULTIPLEXER_AUTOADJUST_BITRATE => 1
}
