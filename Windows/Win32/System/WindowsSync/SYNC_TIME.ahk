#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a date-and-time value.
 * @remarks
 * This structure is a packed date-and-time value that can store years between 1601 and 67136 and times that are accurate to the millisecond.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-sync_time
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_TIME {
    #StructPack 4

    /**
     * The date portion of the value.
     */
    dwDate : UInt32

    /**
     * The time portion of the value.
     */
    dwTime : UInt32

}
