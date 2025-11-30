#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechEmulationCompareFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SECFIgnoreCase => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECFIgnoreKanaType => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SECFIgnoreWidth => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SECFNoSpecialChars => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static SECFEmulateResult => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static SECFDefault => 196609
}
