#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies possible status values used in the System.SyncTransferStatus property.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-sync_transfer_status
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class SYNC_TRANSFER_STATUS extends Win32BitflagEnum{

    /**
     * There is no current sync activity.
     * @type {Integer (Int32)}
     */
    static STS_NONE => 0

    /**
     * The file is pending upload.
     * @type {Integer (Int32)}
     */
    static STS_NEEDSUPLOAD => 1

    /**
     * The file is pending download.
     * @type {Integer (Int32)}
     */
    static STS_NEEDSDOWNLOAD => 2

    /**
     * The file is currently being uploaded or downloaded.
     * @type {Integer (Int32)}
     */
    static STS_TRANSFERRING => 4

    /**
     * The current transfer is paused.
     * @type {Integer (Int32)}
     */
    static STS_PAUSED => 8

    /**
     * An error was encountered during the last sync operation.
     * @type {Integer (Int32)}
     */
    static STS_HASERROR => 16

    /**
     * The sync engine is retrieving metadata from the cloud.
     * @type {Integer (Int32)}
     */
    static STS_FETCHING_METADATA => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STS_USER_REQUESTED_REFRESH => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STS_HASWARNING => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STS_EXCLUDED => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STS_INCOMPLETE => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STS_PLACEHOLDER_IFEMPTY => 1024
}
