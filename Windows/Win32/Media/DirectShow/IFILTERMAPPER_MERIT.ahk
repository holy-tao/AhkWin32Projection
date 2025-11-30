#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFILTERMAPPER_MERIT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_PREFERRED => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_NORMAL => 6291456

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_UNLIKELY => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_DO_NOT_USE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_SW_COMPRESSOR => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static MERIT_HW_COMPRESSOR => 1048656
}
