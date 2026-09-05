#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_LOGIN_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_INPROC_LOGIN
     * @type {Integer (Int32)}
     */
    static FLAG_INPROC_LOGIN => 0

    /**
     * Native name: WBEM_FLAG_LOCAL_LOGIN
     * @type {Integer (Int32)}
     */
    static FLAG_LOCAL_LOGIN => 1

    /**
     * Native name: WBEM_FLAG_REMOTE_LOGIN
     * @type {Integer (Int32)}
     */
    static FLAG_REMOTE_LOGIN => 2

    /**
     * Native name: WBEM_AUTHENTICATION_METHOD_MASK
     * @type {Integer (Int32)}
     */
    static AUTHENTICATION_METHOD_MASK => 15

    /**
     * Native name: WBEM_FLAG_USE_MULTIPLE_CHALLENGES
     * @type {Integer (Int32)}
     */
    static FLAG_USE_MULTIPLE_CHALLENGES => 16
}
