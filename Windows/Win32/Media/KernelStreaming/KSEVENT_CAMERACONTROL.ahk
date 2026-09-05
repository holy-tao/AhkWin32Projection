#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_CAMERACONTROL extends Win32Enum {

    /**
     * Native name: KSEVENT_CAMERACONTROL_FOCUS
     * @type {Integer (Int32)}
     */
    static FOCUS => 0

    /**
     * Native name: KSEVENT_CAMERACONTROL_ZOOM
     * @type {Integer (Int32)}
     */
    static ZOOM => 1
}
