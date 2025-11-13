#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerNotifyCallout => 1

    /**
     * @type {Integer (Int32)}
     */
    static VideoEnumChildPdoNotifyCallout => 3

    /**
     * @type {Integer (Int32)}
     */
    static VideoFindAdapterCallout => 4

    /**
     * @type {Integer (Int32)}
     */
    static VideoPnpNotifyCallout => 7

    /**
     * @type {Integer (Int32)}
     */
    static VideoDxgkDisplaySwitchCallout => 8

    /**
     * @type {Integer (Int32)}
     */
    static VideoDxgkFindAdapterTdrCallout => 10

    /**
     * @type {Integer (Int32)}
     */
    static VideoDxgkHardwareProtectionTeardown => 11

    /**
     * @type {Integer (Int32)}
     */
    static VideoRepaintDesktop => 12

    /**
     * @type {Integer (Int32)}
     */
    static VideoUpdateCursor => 13

    /**
     * @type {Integer (Int32)}
     */
    static VideoDisableMultiPlaneOverlay => 14

    /**
     * @type {Integer (Int32)}
     */
    static VideoDesktopDuplicationChange => 15

    /**
     * @type {Integer (Int32)}
     */
    static VideoBlackScreenDiagnostics => 16

    /**
     * @type {Integer (Int32)}
     */
    static VideoForceCompositionRender => 17
}
