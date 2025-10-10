#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRMTIMETYPE enumeration specifies a time type.
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ne-msdrmdefs-drmtimetype
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMTIMETYPE{

    /**
     * Greenwich Mean Time (Universal Time).
     * @type {Integer (Int32)}
     */
    static DRMTIMETYPE_SYSTEMUTC => 0

    /**
     * Local time.
     * @type {Integer (Int32)}
     */
    static DRMTIMETYPE_SYSTEMLOCAL => 1
}
