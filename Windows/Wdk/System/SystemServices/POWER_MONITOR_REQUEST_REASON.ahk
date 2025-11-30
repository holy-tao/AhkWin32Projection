#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class POWER_MONITOR_REQUEST_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPowerButton => 1

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonRemoteConnection => 2

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonScMonitorpower => 3

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInput => 4

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonAcDcDisplayBurst => 5

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserDisplayBurst => 6

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPoSetSystemState => 7

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonSetThreadExecutionState => 8

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonFullWake => 9

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonSessionUnlock => 10

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonScreenOffRequest => 11

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonIdleTimeout => 12

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPolicyChange => 13

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonSleepButton => 14

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonLid => 15

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonBatteryCountChange => 16

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonGracePeriod => 17

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPnP => 18

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonDP => 19

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonSxTransition => 20

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonSystemIdle => 21

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonNearProximity => 22

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonThermalStandby => 23

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonResumePdc => 24

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonResumeS4 => 25

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonTerminal => 26

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignal => 27

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonAcDcDisplayBurstSuppressed => 28

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonSystemStateEntered => 29

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonWinrt => 30

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputKeyboard => 31

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputMouse => 32

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputTouchpad => 33

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputPen => 34

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputAccelerometer => 35

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputHid => 36

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputPoUserPresent => 37

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputSessionSwitch => 38

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputInitialization => 39

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignalWindowsMobilePwrNotif => 40

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignalWindowsMobileShell => 41

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignalHeyCortana => 42

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignalHolographicShell => 43

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignalFingerprint => 44

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonDirectedDrips => 45

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonDim => 46

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonBuiltinPanel => 47

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonDisplayRequiredUnDim => 48

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonBatteryCountChangeSuppressed => 49

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonResumeModernStandby => 50

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonTerminalInit => 51

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonPdcSignalSensorsHumanPresence => 52

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonBatteryPreCritical => 53

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonUserInputTouch => 54

    /**
     * @type {Integer (Int32)}
     */
    static MonitorRequestReasonMax => 55
}
