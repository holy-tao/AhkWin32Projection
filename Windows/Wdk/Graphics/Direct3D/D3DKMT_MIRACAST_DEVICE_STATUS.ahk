#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MIRACAST_DEVICE_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_SUCCESS_NO_MONITOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_PENDING => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_UNKOWN_ERROR => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_GPU_RESOURCE_IN_USE => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_DEVICE_ERROR => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_UNKOWN_PAIRING => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_REMOTE_SESSION => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_DEVICE_NOT_FOUND => -2147483642

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_DEVICE_NOT_STARTED => -2147483641

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_INVALID_PARAMETER => -2147483640

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_INSUFFICIENT_BANDWIDTH => -2147483639

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_INSUFFICIENT_MEMORY => -2147483638

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MIRACAST_DEVICE_STATUS_CANCELLED => -2147483637
}
