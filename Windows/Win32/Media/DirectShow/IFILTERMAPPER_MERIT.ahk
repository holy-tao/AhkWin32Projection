#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class IFILTERMAPPER_MERIT extends Win32Enum {

    /**
     * Native name: MERIT_PREFERRED
     * @type {Integer (Int32)}
     */
    static PREFERRED => 8388608

    /**
     * Native name: MERIT_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 6291456

    /**
     * Native name: MERIT_UNLIKELY
     * @type {Integer (Int32)}
     */
    static UNLIKELY => 4194304

    /**
     * Native name: MERIT_DO_NOT_USE
     * @type {Integer (Int32)}
     */
    static DO_NOT_USE => 2097152

    /**
     * Native name: MERIT_SW_COMPRESSOR
     * @type {Integer (Int32)}
     */
    static SW_COMPRESSOR => 1048576

    /**
     * Native name: MERIT_HW_COMPRESSOR
     * @type {Integer (Int32)}
     */
    static HW_COMPRESSOR => 1048656
}
