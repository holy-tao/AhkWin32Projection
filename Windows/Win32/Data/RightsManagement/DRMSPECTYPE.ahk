#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRMSPECTYPE enumeration indicates what type of security or library providers are used.
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ne-msdrmdefs-drmspectype
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMSPECTYPE{

    /**
     * Currently not supported.
     * @type {Integer (Int32)}
     */
    static DRMSPECTYPE_UNKNOWN => 0

    /**
     * File name.
     * @type {Integer (Int32)}
     */
    static DRMSPECTYPE_FILENAME => 1
}
