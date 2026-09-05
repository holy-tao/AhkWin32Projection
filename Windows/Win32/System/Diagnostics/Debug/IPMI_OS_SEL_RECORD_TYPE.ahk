#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IPMI_OS_SEL_RECORD_TYPE extends Win32Enum {

    /**
     * Native name: IpmiOsSelRecordTypeWhea
     * @type {Integer (Int32)}
     */
    static Whea => 0

    /**
     * Native name: IpmiOsSelRecordTypeOther
     * @type {Integer (Int32)}
     */
    static Other => 1

    /**
     * Native name: IpmiOsSelRecordTypeWheaErrorXpfMca
     * @type {Integer (Int32)}
     */
    static WheaErrorXpfMca => 2

    /**
     * Native name: IpmiOsSelRecordTypeWheaErrorPci
     * @type {Integer (Int32)}
     */
    static WheaErrorPci => 3

    /**
     * Native name: IpmiOsSelRecordTypeWheaErrorNmi
     * @type {Integer (Int32)}
     */
    static WheaErrorNmi => 4

    /**
     * Native name: IpmiOsSelRecordTypeWheaErrorOther
     * @type {Integer (Int32)}
     */
    static WheaErrorOther => 5

    /**
     * Native name: IpmiOsSelRecordTypeRaw
     * @type {Integer (Int32)}
     */
    static Raw => 6

    /**
     * Native name: IpmiOsSelRecordTypeDriver
     * @type {Integer (Int32)}
     */
    static Driver => 7

    /**
     * Native name: IpmiOsSelRecordTypeBugcheckRecovery
     * @type {Integer (Int32)}
     */
    static BugcheckRecovery => 8

    /**
     * Native name: IpmiOsSelRecordTypeBugcheckData
     * @type {Integer (Int32)}
     */
    static BugcheckData => 9

    /**
     * Native name: IpmiOsSelRecordTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 10
}
