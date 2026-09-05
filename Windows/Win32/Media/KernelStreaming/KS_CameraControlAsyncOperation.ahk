#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_CameraControlAsyncOperation extends Win32Enum {

    /**
     * Native name: KS_CAMERACONTROL_ASYNC_START
     * @type {Integer (Int32)}
     */
    static CAMERACONTROL_ASYNC_START => 1

    /**
     * Native name: KS_CAMERACONTROL_ASYNC_STOP
     * @type {Integer (Int32)}
     */
    static CAMERACONTROL_ASYNC_STOP => 2

    /**
     * Native name: KS_CAMERACONTROL_ASYNC_RESET
     * @type {Integer (Int32)}
     */
    static CAMERACONTROL_ASYNC_RESET => 3
}
