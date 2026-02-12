#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the wrapping behavior of timed text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextwrapping
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextWrapping extends Win32Enum{

    /**
     * The text is not wrapped.
     * @type {Integer (Int32)}
     */
    static NoWrap => 0

    /**
     * The text is wrapped.
     * @type {Integer (Int32)}
     */
    static Wrap => 1
}
