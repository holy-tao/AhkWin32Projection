#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-session-type
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_SESSION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_TRANSFER_TO_DEVICE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_TRANSFER_FROM_DEVICE => 16

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_DELETE => 256

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_SESSION_CUSTOM => 4096
}
