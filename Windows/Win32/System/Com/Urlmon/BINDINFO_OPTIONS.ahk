#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class BINDINFO_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_WININETFLAG => 65536

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_ENABLE_UTF8 => 131072

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_DISABLE_UTF8 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_USE_IE_ENCODING => 524288

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_BINDTOOBJECT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_SECURITYOPTOUT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_IGNOREMIMETEXTPLAIN => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_USEBINDSTRINGCREDS => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_IGNOREHTTPHTTPSREDIRECTS => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_IGNORE_SSLERRORS_ONCE => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_WPC_DOWNLOADBLOCKED => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_WPC_LOGGING_ENABLED => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_ALLOWCONNECTDATA => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_DISABLEAUTOREDIRECTS => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFO_OPTIONS_SHDOCVW_NAVIGATE => -2147483648
}
