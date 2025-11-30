#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class EPcxConnectionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static eConnType3Point5mm => 1

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeQuarter => 2

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeAtapiInternal => 3

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeRCA => 4

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeOptical => 5

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeOtherDigital => 6

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeOtherAnalog => 7

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeMultichannelAnalogDIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeXlrProfessional => 9

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeRJ11Modem => 10

    /**
     * @type {Integer (Int32)}
     */
    static eConnTypeCombination => 11
}
