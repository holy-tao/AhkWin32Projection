#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEVICE_ERROR_REASON extends Win32Enum {

    /**
     * Native name: D3DKMT_DEVICE_ERROR_REASON_GENERIC
     * @type {Integer (Int32)}
     */
    static GENERIC => -2147483648

    /**
     * Native name: D3DKMT_DEVICE_ERROR_REASON_DRIVER_ERROR
     * @type {Integer (Int32)}
     */
    static DRIVER_ERROR => -2147483642
}
