#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class NAVIGATEFRAME_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_RECORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_POST => 2

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_NO_DOC_CACHE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_NO_IMAGE_CACHE => 8

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_AUTH_FAIL_CACHE_OK => 16

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_SENDING_FROM_FORM => 32

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_REALLY_SENDING_FROM_FORM => 64
}
