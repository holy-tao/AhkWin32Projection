#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class ZAFLAGS extends Win32Enum {

    /**
     * Native name: ZAFLAGS_CUSTOM_EDIT
     * @type {Integer (Int32)}
     */
    static CUSTOM_EDIT => 1

    /**
     * Native name: ZAFLAGS_ADD_SITES
     * @type {Integer (Int32)}
     */
    static ADD_SITES => 2

    /**
     * Native name: ZAFLAGS_REQUIRE_VERIFICATION
     * @type {Integer (Int32)}
     */
    static REQUIRE_VERIFICATION => 4

    /**
     * Native name: ZAFLAGS_INCLUDE_PROXY_OVERRIDE
     * @type {Integer (Int32)}
     */
    static INCLUDE_PROXY_OVERRIDE => 8

    /**
     * Native name: ZAFLAGS_INCLUDE_INTRANET_SITES
     * @type {Integer (Int32)}
     */
    static INCLUDE_INTRANET_SITES => 16

    /**
     * Native name: ZAFLAGS_NO_UI
     * @type {Integer (Int32)}
     */
    static NO_UI => 32

    /**
     * Native name: ZAFLAGS_SUPPORTS_VERIFICATION
     * @type {Integer (Int32)}
     */
    static SUPPORTS_VERIFICATION => 64

    /**
     * Native name: ZAFLAGS_UNC_AS_INTRANET
     * @type {Integer (Int32)}
     */
    static UNC_AS_INTRANET => 128

    /**
     * Native name: ZAFLAGS_DETECT_INTRANET
     * @type {Integer (Int32)}
     */
    static DETECT_INTRANET => 256

    /**
     * Native name: ZAFLAGS_USE_LOCKED_ZONES
     * @type {Integer (Int32)}
     */
    static USE_LOCKED_ZONES => 65536

    /**
     * Native name: ZAFLAGS_VERIFY_TEMPLATE_SETTINGS
     * @type {Integer (Int32)}
     */
    static VERIFY_TEMPLATE_SETTINGS => 131072

    /**
     * Native name: ZAFLAGS_NO_CACHE
     * @type {Integer (Int32)}
     */
    static NO_CACHE => 262144
}
