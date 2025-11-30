#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a File History backup target.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/ne-fhcfg-fh_target_drive_types
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FH_TARGET_DRIVE_TYPES extends Win32Enum{

    /**
     * The type of the backup target is unknown.
     * @type {Integer (Int32)}
     */
    static FH_DRIVE_UNKNOWN => 0

    /**
     * The backup target is a locally attached removable storage device, such as a USB thumb drive.
     * @type {Integer (Int32)}
     */
    static FH_DRIVE_REMOVABLE => 2

    /**
     * The backup target is a locally attached nonremovable storage device, such as an internal hard drive.
     * @type {Integer (Int32)}
     */
    static FH_DRIVE_FIXED => 3

    /**
     * The backup target is a storage device that is accessible over network, such as a computer that is running Windows Home Server.
     * @type {Integer (Int32)}
     */
    static FH_DRIVE_REMOTE => 4
}
