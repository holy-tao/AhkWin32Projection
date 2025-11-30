#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _SHCONTF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_CHECKING_FOR_CHILDREN => 16

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_FOLDERS => 32

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_NONFOLDERS => 64

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_INCLUDEHIDDEN => 128

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_INIT_ON_FIRST_NEXT => 256

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_NETPRINTERSRCH => 512

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_SHAREABLE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_STORAGE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_NAVIGATION_ENUM => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_FASTITEMS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_FLATLIST => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_ENABLE_ASYNC => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SHCONTF_INCLUDESUPERHIDDEN => 65536
}
