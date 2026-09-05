#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ZONE_CONDITION extends Win32Enum {

    /**
     * Native name: ZoneConditionConventional
     * @type {Integer (Int32)}
     */
    static Conventional => 0

    /**
     * Native name: ZoneConditionEmpty
     * @type {Integer (Int32)}
     */
    static Empty => 1

    /**
     * Native name: ZoneConditionImplicitlyOpened
     * @type {Integer (Int32)}
     */
    static ImplicitlyOpened => 2

    /**
     * Native name: ZoneConditionExplicitlyOpened
     * @type {Integer (Int32)}
     */
    static ExplicitlyOpened => 3

    /**
     * Native name: ZoneConditionClosed
     * @type {Integer (Int32)}
     */
    static Closed => 4

    /**
     * Native name: ZoneConditionReadOnly
     * @type {Integer (Int32)}
     */
    static ReadOnly => 13

    /**
     * Native name: ZoneConditionFull
     * @type {Integer (Int32)}
     */
    static Full => 14

    /**
     * Native name: ZoneConditionOffline
     * @type {Integer (Int32)}
     */
    static Offline => 15
}
