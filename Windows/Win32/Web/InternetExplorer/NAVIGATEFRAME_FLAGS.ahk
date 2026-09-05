#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class NAVIGATEFRAME_FLAGS extends Win32Enum {

    /**
     * Native name: NAVIGATEFRAME_FL_RECORD
     * @type {Integer (Int32)}
     */
    static FL_RECORD => 1

    /**
     * Native name: NAVIGATEFRAME_FL_POST
     * @type {Integer (Int32)}
     */
    static FL_POST => 2

    /**
     * Native name: NAVIGATEFRAME_FL_NO_DOC_CACHE
     * @type {Integer (Int32)}
     */
    static FL_NO_DOC_CACHE => 4

    /**
     * Native name: NAVIGATEFRAME_FL_NO_IMAGE_CACHE
     * @type {Integer (Int32)}
     */
    static FL_NO_IMAGE_CACHE => 8

    /**
     * Native name: NAVIGATEFRAME_FL_AUTH_FAIL_CACHE_OK
     * @type {Integer (Int32)}
     */
    static FL_AUTH_FAIL_CACHE_OK => 16

    /**
     * Native name: NAVIGATEFRAME_FL_SENDING_FROM_FORM
     * @type {Integer (Int32)}
     */
    static FL_SENDING_FROM_FORM => 32

    /**
     * Native name: NAVIGATEFRAME_FL_REALLY_SENDING_FROM_FORM
     * @type {Integer (Int32)}
     */
    static FL_REALLY_SENDING_FROM_FORM => 64
}
