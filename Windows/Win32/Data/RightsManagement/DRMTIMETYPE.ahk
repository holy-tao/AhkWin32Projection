#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRMTIMETYPE enumeration specifies a time type.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmtimetype
 * @namespace Windows.Win32.Data.RightsManagement
 */
class DRMTIMETYPE extends Win32Enum {

    /**
     * Greenwich Mean Time (Universal Time).
     * Native name: DRMTIMETYPE_SYSTEMUTC
     * @type {Integer (Int32)}
     */
    static SYSTEMUTC => 0

    /**
     * Local time.
     * Native name: DRMTIMETYPE_SYSTEMLOCAL
     * @type {Integer (Int32)}
     */
    static SYSTEMLOCAL => 1
}
