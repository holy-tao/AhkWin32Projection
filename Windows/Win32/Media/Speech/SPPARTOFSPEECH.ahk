#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPARTOFSPEECH{

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_NotOverriden => -1

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Noun => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Verb => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Modifier => 12288

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Function => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Interjection => 20480

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Noncontent => 24576

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_LMA => 28672

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_SuppressWord => 61440
}
