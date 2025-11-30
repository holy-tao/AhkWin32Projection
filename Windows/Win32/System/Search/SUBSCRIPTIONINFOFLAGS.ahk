#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SUBSCRIPTIONINFOFLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_SCHEDULE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_RECURSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_WEBCRAWL => 4

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_MAILNOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_MAXSIZEKB => 16

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_USER => 32

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_PASSWORD => 64

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_TASKFLAGS => 256

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_GLEAM => 512

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_CHANGESONLY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_CHANNELFLAGS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_FRIENDLYNAME => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_NEEDPASSWORD => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SUBSINFO_TYPE => 32768
}
