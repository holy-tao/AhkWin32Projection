#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_MEDIA_ERROR_RECORD_SOURCE extends Win32Enum {

    /**
     * Native name: CxlMailboxErrorRecordSource_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: CxlMailboxErrorRecordSource_External
     * @type {Integer (Int32)}
     */
    static External => 1

    /**
     * Native name: CxlMailboxErrorRecordSource_Internal
     * @type {Integer (Int32)}
     */
    static Internal => 2

    /**
     * Native name: CxlMailboxErrorRecordSource_Injected
     * @type {Integer (Int32)}
     */
    static Injected => 3

    /**
     * Native name: CxlMailboxErrorRecordSource_VendorSpecific
     * @type {Integer (Int32)}
     */
    static VendorSpecific => 4

    /**
     * Native name: CxlMailboxErrorRecordSource_Max
     * @type {Integer (Int32)}
     */
    static Max => 5
}
