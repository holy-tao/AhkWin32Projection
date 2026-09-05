#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_RUBY_RESERVE extends Win32Enum {

    /**
     * Native name: MF_TIMED_TEXT_RUBY_RESERVE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MF_TIMED_TEXT_RUBY_RESERVE_BEFORE
     * @type {Integer (Int32)}
     */
    static BEFORE => 1

    /**
     * Native name: MF_TIMED_TEXT_RUBY_RESERVE_AFTER
     * @type {Integer (Int32)}
     */
    static AFTER => 2

    /**
     * Native name: MF_TIMED_TEXT_RUBY_RESERVE_BOTH
     * @type {Integer (Int32)}
     */
    static BOTH => 3

    /**
     * Native name: MF_TIMED_TEXT_RUBY_RESERVE_OUTSIDE
     * @type {Integer (Int32)}
     */
    static OUTSIDE => 4
}
