#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether a codec operates on audio or video data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.codeckind
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class CodecKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Audio => 0

    /**
     * @type {Integer (Int32)}
     */
    static Video => 1
}
