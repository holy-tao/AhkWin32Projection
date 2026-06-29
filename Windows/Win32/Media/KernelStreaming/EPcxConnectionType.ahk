#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct EPcxConnectionType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
