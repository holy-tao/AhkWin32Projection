#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DISC_CONTROL_BLOCK_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FormattingDiscControlBlock => 1178878720

    /**
     * @type {Integer (Int32)}
     */
    static WriteInhibitDiscControlBlock => 1464091392

    /**
     * @type {Integer (Int32)}
     */
    static SessionInfoDiscControlBlock => 1396982528

    /**
     * @type {Integer (Int32)}
     */
    static DiscControlBlockList => -1
}
