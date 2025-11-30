#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-queue_user_apc_flags
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class QUEUE_USER_APC_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static QUEUE_USER_APC_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static QUEUE_USER_APC_FLAGS_SPECIAL_USER_APC => 1

    /**
     * @type {Integer (Int32)}
     */
    static QUEUE_USER_APC_CALLBACK_DATA_CONTEXT => 65536
}
