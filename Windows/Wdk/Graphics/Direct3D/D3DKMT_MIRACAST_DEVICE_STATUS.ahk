#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MIRACAST_DEVICE_STATUS extends Win32Enum {

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_SUCCESS_NO_MONITOR
     * @type {Integer (Int32)}
     */
    static SUCCESS_NO_MONITOR => 1

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_PENDING
     * @type {Integer (Int32)}
     */
    static PENDING => 2

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_UNKOWN_ERROR
     * @type {Integer (Int32)}
     */
    static UNKOWN_ERROR => -2147483647

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_GPU_RESOURCE_IN_USE
     * @type {Integer (Int32)}
     */
    static GPU_RESOURCE_IN_USE => -2147483646

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_DEVICE_ERROR
     * @type {Integer (Int32)}
     */
    static DEVICE_ERROR => -2147483645

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_UNKOWN_PAIRING
     * @type {Integer (Int32)}
     */
    static UNKOWN_PAIRING => -2147483644

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_REMOTE_SESSION
     * @type {Integer (Int32)}
     */
    static REMOTE_SESSION => -2147483643

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_DEVICE_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static DEVICE_NOT_FOUND => -2147483642

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_DEVICE_NOT_STARTED
     * @type {Integer (Int32)}
     */
    static DEVICE_NOT_STARTED => -2147483641

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_INVALID_PARAMETER
     * @type {Integer (Int32)}
     */
    static INVALID_PARAMETER => -2147483640

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_INSUFFICIENT_BANDWIDTH
     * @type {Integer (Int32)}
     */
    static INSUFFICIENT_BANDWIDTH => -2147483639

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_INSUFFICIENT_MEMORY
     * @type {Integer (Int32)}
     */
    static INSUFFICIENT_MEMORY => -2147483638

    /**
     * Native name: D3DKMT_MIRACAST_DEVICE_STATUS_CANCELLED
     * @type {Integer (Int32)}
     */
    static CANCELLED => -2147483637
}
