#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KBUGCHECK_CALLBACK_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackReserved1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackSecondaryDumpData => 2

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackDumpIo => 3

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackAddPages => 4

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackSecondaryMultiPartDumpData => 5

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackRemovePages => 6

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackTriageDumpData => 7

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackReserved2 => 8
}
