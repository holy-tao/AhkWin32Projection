#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class STARTUPINFOW_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_FORCEONFEEDBACK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_FORCEOFFFEEDBACK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_PREVENTPINNING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_RUNFULLSCREEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_TITLEISAPPID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_TITLEISLINKNAME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_UNTRUSTEDSOURCE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USECOUNTCHARS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USEFILLATTRIBUTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USEHOTKEY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USEPOSITION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USESHOWWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USESIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USESTDHANDLES => 256
}
