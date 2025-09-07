#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IPMI_OS_SEL_RECORD_TYPE{

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
