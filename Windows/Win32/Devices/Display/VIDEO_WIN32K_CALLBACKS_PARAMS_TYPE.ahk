#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
