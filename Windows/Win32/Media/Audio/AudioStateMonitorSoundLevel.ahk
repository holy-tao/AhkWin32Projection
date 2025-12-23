#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AudioStateMonitorSoundLevel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Muted => 0

    /**
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * @type {Integer (Int32)}
     */
    static Full => 2
}
