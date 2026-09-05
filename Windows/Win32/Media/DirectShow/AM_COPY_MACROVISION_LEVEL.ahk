#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the analog copy protection level.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_copy_macrovision">AM_COPY_MACROVISION</a> structure uses this data type.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_COPY_MACROVISION_LEVEL extends Win32Enum {

    /**
     * Disabled.
     * Native name: AM_MACROVISION_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Level 1.
     * Native name: AM_MACROVISION_LEVEL1
     * @type {Integer (Int32)}
     */
    static LEVEL1 => 1

    /**
     * Level 2.
     * Native name: AM_MACROVISION_LEVEL2
     * @type {Integer (Int32)}
     */
    static LEVEL2 => 2

    /**
     * Level 3.
     * Native name: AM_MACROVISION_LEVEL3
     * @type {Integer (Int32)}
     */
    static LEVEL3 => 3
}
