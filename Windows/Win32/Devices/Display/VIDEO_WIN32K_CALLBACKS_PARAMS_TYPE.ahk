#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE extends Win32Enum {

    /**
     * Native name: VideoPowerNotifyCallout
     * @type {Integer (Int32)}
     */
    static PowerNotifyCallout => 1

    /**
     * Native name: VideoEnumChildPdoNotifyCallout
     * @type {Integer (Int32)}
     */
    static EnumChildPdoNotifyCallout => 3

    /**
     * Native name: VideoFindAdapterCallout
     * @type {Integer (Int32)}
     */
    static FindAdapterCallout => 4

    /**
     * Native name: VideoPnpNotifyCallout
     * @type {Integer (Int32)}
     */
    static PnpNotifyCallout => 7

    /**
     * Native name: VideoDxgkDisplaySwitchCallout
     * @type {Integer (Int32)}
     */
    static DxgkDisplaySwitchCallout => 8

    /**
     * Native name: VideoDxgkFindAdapterTdrCallout
     * @type {Integer (Int32)}
     */
    static DxgkFindAdapterTdrCallout => 10

    /**
     * Native name: VideoDxgkHardwareProtectionTeardown
     * @type {Integer (Int32)}
     */
    static DxgkHardwareProtectionTeardown => 11

    /**
     * Native name: VideoRepaintDesktop
     * @type {Integer (Int32)}
     */
    static RepaintDesktop => 12

    /**
     * Native name: VideoUpdateCursor
     * @type {Integer (Int32)}
     */
    static UpdateCursor => 13

    /**
     * Native name: VideoDisableMultiPlaneOverlay
     * @type {Integer (Int32)}
     */
    static DisableMultiPlaneOverlay => 14

    /**
     * Native name: VideoDesktopDuplicationChange
     * @type {Integer (Int32)}
     */
    static DesktopDuplicationChange => 15

    /**
     * Native name: VideoBlackScreenDiagnostics
     * @type {Integer (Int32)}
     */
    static BlackScreenDiagnostics => 16

    /**
     * Native name: VideoForceCompositionRender
     * @type {Integer (Int32)}
     */
    static ForceCompositionRender => 17
}
