#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_RUBY_RESERVE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_BEFORE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_AFTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_BOTH => 3

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_RUBY_RESERVE_OUTSIDE => 4
}
