#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_CONDITIONALACCESS_SESSION_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_SUCCESSFULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ENDED_NOCHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ABORTED => 2
}
