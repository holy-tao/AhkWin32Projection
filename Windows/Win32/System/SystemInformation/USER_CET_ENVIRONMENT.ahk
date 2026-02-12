#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The Intel Software Guard Extensions 2 (SGX2) enclave environment.
 * @see https://learn.microsoft.com/windows/win32/api//content/sysinfoapi/nf-sysinfoapi-isusercetavailableinenvironment
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class USER_CET_ENVIRONMENT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_WIN32_PROCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_SGX2_ENCLAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_VBS_ENCLAVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_VBS_BASIC_ENCLAVE => 17
}
