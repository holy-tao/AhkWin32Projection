#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_SESSION\_TYPE enumeration type defines the session type.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-session-type
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDM_SESSION_TYPE extends Win32Enum {

    /**
     * Native name: WMDM_SESSION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: WMDM_SESSION_TRANSFER_TO_DEVICE
     * @type {Integer (Int32)}
     */
    static TRANSFER_TO_DEVICE => 1

    /**
     * Native name: WMDM_SESSION_TRANSFER_FROM_DEVICE
     * @type {Integer (Int32)}
     */
    static TRANSFER_FROM_DEVICE => 16

    /**
     * Native name: WMDM_SESSION_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 256

    /**
     * Native name: WMDM_SESSION_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 4096
}
