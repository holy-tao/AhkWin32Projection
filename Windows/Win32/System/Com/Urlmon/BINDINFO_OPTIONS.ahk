#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BINDINFO_OPTIONS extends Win32Enum {

    /**
     * Native name: BINDINFO_OPTIONS_WININETFLAG
     * @type {Integer (Int32)}
     */
    static WININETFLAG => 65536

    /**
     * Native name: BINDINFO_OPTIONS_ENABLE_UTF8
     * @type {Integer (Int32)}
     */
    static ENABLE_UTF8 => 131072

    /**
     * Native name: BINDINFO_OPTIONS_DISABLE_UTF8
     * @type {Integer (Int32)}
     */
    static DISABLE_UTF8 => 262144

    /**
     * Native name: BINDINFO_OPTIONS_USE_IE_ENCODING
     * @type {Integer (Int32)}
     */
    static USE_IE_ENCODING => 524288

    /**
     * Native name: BINDINFO_OPTIONS_BINDTOOBJECT
     * @type {Integer (Int32)}
     */
    static BINDTOOBJECT => 1048576

    /**
     * Native name: BINDINFO_OPTIONS_SECURITYOPTOUT
     * @type {Integer (Int32)}
     */
    static SECURITYOPTOUT => 2097152

    /**
     * Native name: BINDINFO_OPTIONS_IGNOREMIMETEXTPLAIN
     * @type {Integer (Int32)}
     */
    static IGNOREMIMETEXTPLAIN => 4194304

    /**
     * Native name: BINDINFO_OPTIONS_USEBINDSTRINGCREDS
     * @type {Integer (Int32)}
     */
    static USEBINDSTRINGCREDS => 8388608

    /**
     * Native name: BINDINFO_OPTIONS_IGNOREHTTPHTTPSREDIRECTS
     * @type {Integer (Int32)}
     */
    static IGNOREHTTPHTTPSREDIRECTS => 16777216

    /**
     * Native name: BINDINFO_OPTIONS_IGNORE_SSLERRORS_ONCE
     * @type {Integer (Int32)}
     */
    static IGNORE_SSLERRORS_ONCE => 33554432

    /**
     * Native name: BINDINFO_WPC_DOWNLOADBLOCKED
     * @type {Integer (Int32)}
     */
    static WPC_DOWNLOADBLOCKED => 134217728

    /**
     * Native name: BINDINFO_WPC_LOGGING_ENABLED
     * @type {Integer (Int32)}
     */
    static WPC_LOGGING_ENABLED => 268435456

    /**
     * Native name: BINDINFO_OPTIONS_ALLOWCONNECTDATA
     * @type {Integer (Int32)}
     */
    static ALLOWCONNECTDATA => 536870912

    /**
     * Native name: BINDINFO_OPTIONS_DISABLEAUTOREDIRECTS
     * @type {Integer (Int32)}
     */
    static DISABLEAUTOREDIRECTS => 1073741824

    /**
     * Native name: BINDINFO_OPTIONS_SHDOCVW_NAVIGATE
     * @type {Integer (Int32)}
     */
    static SHDOCVW_NAVIGATE => -2147483648
}
