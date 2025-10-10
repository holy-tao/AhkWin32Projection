#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the analog copy protection level.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_copy_macrovision">AM_COPY_MACROVISION</a> structure uses this data type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ne-dvdmedia-am_copy_macrovision_level
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_COPY_MACROVISION_LEVEL{

    /**
     * Disabled.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_DISABLED => 0

    /**
     * Level 1.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_LEVEL1 => 1

    /**
     * Level 2.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_LEVEL2 => 2

    /**
     * Level 3.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_LEVEL3 => 3
}
