#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ZONE_CONDITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionConventional => 0

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionEmpty => 1

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionImplicitlyOpened => 2

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionExplicitlyOpened => 3

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionClosed => 4

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionReadOnly => 13

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionFull => 14

    /**
     * @type {Integer (Int32)}
     */
    static ZoneConditionOffline => 15
}
