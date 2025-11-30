#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsEjectOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EJECT_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EJECT_STOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EJECT_QUEUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EJECT_FORCE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EJECT_IMMEDIATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EJECT_ASK_USER => 5
}
