#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsAnimationPlayState extends Win32Enum {

    /**
     * Native name: styleMsAnimationPlayStateRunning
     * @type {Integer (Int32)}
     */
    static Running => 0

    /**
     * Native name: styleMsAnimationPlayStatePaused
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * Native name: styleMsAnimationPlayStateNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleMsAnimationPlayState_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
