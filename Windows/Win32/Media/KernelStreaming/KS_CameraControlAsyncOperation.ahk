#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_CameraControlAsyncOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAMERACONTROL_ASYNC_START => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAMERACONTROL_ASYNC_STOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAMERACONTROL_ASYNC_RESET => 3
}
