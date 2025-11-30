#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DEVICE_ERROR_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICE_ERROR_REASON_GENERIC => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICE_ERROR_REASON_DRIVER_ERROR => -2147483642
}
