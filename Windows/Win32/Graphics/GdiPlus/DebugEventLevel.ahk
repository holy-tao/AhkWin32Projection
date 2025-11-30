#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a debug event level.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusinit/ne-gdiplusinit-debugeventlevel
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DebugEventLevel extends Win32Enum{

    /**
     * Specifies the *fatal* debug event level.
     * @type {Integer (Int32)}
     */
    static DebugEventLevelFatal => 0

    /**
     * Specifies the *warning* debug event level.
     * @type {Integer (Int32)}
     */
    static DebugEventLevelWarning => 1
}
