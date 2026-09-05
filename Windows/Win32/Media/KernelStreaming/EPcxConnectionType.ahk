#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class EPcxConnectionType extends Win32Enum {

    /**
     * Native name: eConnTypeUnknown
     * @type {Integer (Int32)}
     */
    static ConnTypeUnknown => 0

    /**
     * Native name: eConnType3Point5mm
     * @type {Integer (Int32)}
     */
    static ConnType3Point5mm => 1

    /**
     * Native name: eConnTypeQuarter
     * @type {Integer (Int32)}
     */
    static ConnTypeQuarter => 2

    /**
     * Native name: eConnTypeAtapiInternal
     * @type {Integer (Int32)}
     */
    static ConnTypeAtapiInternal => 3

    /**
     * Native name: eConnTypeRCA
     * @type {Integer (Int32)}
     */
    static ConnTypeRCA => 4

    /**
     * Native name: eConnTypeOptical
     * @type {Integer (Int32)}
     */
    static ConnTypeOptical => 5

    /**
     * Native name: eConnTypeOtherDigital
     * @type {Integer (Int32)}
     */
    static ConnTypeOtherDigital => 6

    /**
     * Native name: eConnTypeOtherAnalog
     * @type {Integer (Int32)}
     */
    static ConnTypeOtherAnalog => 7

    /**
     * Native name: eConnTypeMultichannelAnalogDIN
     * @type {Integer (Int32)}
     */
    static ConnTypeMultichannelAnalogDIN => 8

    /**
     * Native name: eConnTypeXlrProfessional
     * @type {Integer (Int32)}
     */
    static ConnTypeXlrProfessional => 9

    /**
     * Native name: eConnTypeRJ11Modem
     * @type {Integer (Int32)}
     */
    static ConnTypeRJ11Modem => 10

    /**
     * Native name: eConnTypeCombination
     * @type {Integer (Int32)}
     */
    static ConnTypeCombination => 11
}
