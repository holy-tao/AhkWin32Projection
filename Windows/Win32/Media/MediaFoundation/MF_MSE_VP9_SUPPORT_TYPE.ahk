#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MSE_VP9_SUPPORT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_MSE_VP9_SUPPORT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_MSE_VP9_SUPPORT_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_MSE_VP9_SUPPORT_OFF => 2
}
