#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_RUBY_ALIGN extends Win32Enum {

    /**
     * Native name: MF_TIMED_TEXT_RUBY_ALIGN_CENTER
     * @type {Integer (Int32)}
     */
    static CENTER => 0

    /**
     * Native name: MF_TIMED_TEXT_RUBY_ALIGN_START
     * @type {Integer (Int32)}
     */
    static START => 1

    /**
     * Native name: MF_TIMED_TEXT_RUBY_ALIGN_END
     * @type {Integer (Int32)}
     */
    static END => 2

    /**
     * Native name: MF_TIMED_TEXT_RUBY_ALIGN_SPACEAROUND
     * @type {Integer (Int32)}
     */
    static SPACEAROUND => 3

    /**
     * Native name: MF_TIMED_TEXT_RUBY_ALIGN_SPACEBETWEEN
     * @type {Integer (Int32)}
     */
    static SPACEBETWEEN => 4

    /**
     * Native name: MF_TIMED_TEXT_RUBY_ALIGN_WITHBASE
     * @type {Integer (Int32)}
     */
    static WITHBASE => 5
}
