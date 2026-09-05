#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MSE_VP9_SUPPORT_TYPE extends Win32Enum {

    /**
     * Native name: MF_MSE_VP9_SUPPORT_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: MF_MSE_VP9_SUPPORT_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * Native name: MF_MSE_VP9_SUPPORT_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 2
}
