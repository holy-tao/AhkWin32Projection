#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates one of several stock environment types.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ne-hrtfapoapi-hrtfenvironment
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfEnvironment extends Win32Enum{

    /**
     * A small room.
     * @type {Integer (Int32)}
     */
    static Small => 0

    /**
     * A medium-sized room.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * A large, enclosed space.
     * @type {Integer (Int32)}
     */
    static Large => 2

    /**
     * An outdoor space.
     * @type {Integer (Int32)}
     */
    static Outdoors => 3
}
