#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMTunerSubChannel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AMTUNER_SUBCHAN_NO_TUNE => -2

    /**
     * @type {Integer (Int32)}
     */
    static AMTUNER_SUBCHAN_DEFAULT => -1
}
