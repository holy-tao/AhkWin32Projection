#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechEmulationCompareFlags{

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
