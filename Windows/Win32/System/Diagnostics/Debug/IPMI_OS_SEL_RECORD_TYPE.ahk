#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IPMI_OS_SEL_RECORD_TYPE {
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
    static IpmiOsSelRecordTypeWhea => 0

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeOther => 1

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeWheaErrorXpfMca => 2

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeWheaErrorPci => 3

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeWheaErrorNmi => 4

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeWheaErrorOther => 5

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeRaw => 6

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeDriver => 7

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeBugcheckRecovery => 8

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeBugcheckData => 9

    /**
     * @type {Integer (Int32)}
     */
    static IpmiOsSelRecordTypeMax => 10
}
