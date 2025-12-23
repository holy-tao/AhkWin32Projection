#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a target belongs to a pool or farm.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-target_type
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TARGET_TYPE extends Win32Enum{

    /**
     * The target type is unknown.
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The target is a virtual machine that belongs to a pool or an RD Session Host server that belongs to a farm.
     * @type {Integer (Int32)}
     */
    static FARM => 1

    /**
     * The target does not belong to a pool or farm.
     * @type {Integer (Int32)}
     */
    static NONFARM => 2
}
