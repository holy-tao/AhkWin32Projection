#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_LOGIN_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_INPROC_LOGIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_LOCAL_LOGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_REMOTE_LOGIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_AUTHENTICATION_METHOD_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_USE_MULTIPLE_CHALLENGES => 16
}
