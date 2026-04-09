#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Variant
 */
class DRAWPROGRESSFLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static DPF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DPF_MARQUEE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DPF_MARQUEE_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DPF_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static DPF_WARNING => 8

    /**
     * @type {Integer (Int32)}
     */
    static DPF_STOPPED => 16
}
