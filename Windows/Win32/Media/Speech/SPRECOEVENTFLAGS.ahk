#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRECOEVENTFLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_AutoPause => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_Emulated => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_SMLTimeout => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_ExtendableParse => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_ReSent => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_Hypothesis => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_FalseRecognition => 64
}
