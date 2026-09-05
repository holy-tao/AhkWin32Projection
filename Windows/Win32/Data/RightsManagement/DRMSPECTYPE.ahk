#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRMSPECTYPE enumeration indicates what type of security or library providers are used.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmspectype
 * @namespace Windows.Win32.Data.RightsManagement
 */
class DRMSPECTYPE extends Win32Enum {

    /**
     * Currently not supported.
     * Native name: DRMSPECTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * File name.
     * Native name: DRMSPECTYPE_FILENAME
     * @type {Integer (Int32)}
     */
    static FILENAME => 1
}
