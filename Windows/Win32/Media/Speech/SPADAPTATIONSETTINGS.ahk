#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPADAPTATIONSETTINGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_Default => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_CurrentRecognizer => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_RecoProfile => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_Immediate => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_Reset => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_HighVolumeDataSource => 16
}
