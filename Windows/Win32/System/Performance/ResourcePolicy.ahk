#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines how folders are deleted when one of the disk resource limits is exceeded.
 * @see https://learn.microsoft.com/windows/win32/api/pla/ne-pla-resourcepolicy
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ResourcePolicy{

    /**
     * Delete folders from largest to smallest.
     * @type {Integer (Int32)}
     */
    static plaDeleteLargest => 0

    /**
     * Delete folders from oldest to newest.
     * @type {Integer (Int32)}
     */
    static plaDeleteOldest => 1
}
