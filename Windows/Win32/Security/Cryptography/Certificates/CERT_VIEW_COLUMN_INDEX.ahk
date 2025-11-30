#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERT_VIEW_COLUMN_INDEX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_LOG_DEFAULT => -2

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_LOG_FAILED_DEFAULT => -3

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_QUEUE_DEFAULT => -1
}
