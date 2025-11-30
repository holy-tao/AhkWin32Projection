#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags for the IWbemLocator::ConnectServer method.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_connect_options
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_CONNECT_OPTIONS extends Win32Enum{

    /**
     * Reserved for internal use. Do not use.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_REPOSITORY_ONLY => 64

    /**
     * The call  returns in 2 minutes or less whether successful or not.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_USE_MAX_WAIT => 128

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_PROVIDERS => 256
}
