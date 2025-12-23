#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVESACTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_CONTINUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_ABORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_SKIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_RATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPVES_VOLUME => 8
}
