#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class POWER_MONITOR_REQUEST_REASON extends Win32Enum {

    /**
     * Native name: MonitorRequestReasonUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: MonitorRequestReasonPowerButton
     * @type {Integer (Int32)}
     */
    static PowerButton => 1

    /**
     * Native name: MonitorRequestReasonRemoteConnection
     * @type {Integer (Int32)}
     */
    static RemoteConnection => 2

    /**
     * Native name: MonitorRequestReasonScMonitorpower
     * @type {Integer (Int32)}
     */
    static ScMonitorpower => 3

    /**
     * Native name: MonitorRequestReasonUserInput
     * @type {Integer (Int32)}
     */
    static UserInput => 4

    /**
     * Native name: MonitorRequestReasonAcDcDisplayBurst
     * @type {Integer (Int32)}
     */
    static AcDcDisplayBurst => 5

    /**
     * Native name: MonitorRequestReasonUserDisplayBurst
     * @type {Integer (Int32)}
     */
    static UserDisplayBurst => 6

    /**
     * Native name: MonitorRequestReasonPoSetSystemState
     * @type {Integer (Int32)}
     */
    static PoSetSystemState => 7

    /**
     * Native name: MonitorRequestReasonSetThreadExecutionState
     * @type {Integer (Int32)}
     */
    static SetThreadExecutionState => 8

    /**
     * Native name: MonitorRequestReasonFullWake
     * @type {Integer (Int32)}
     */
    static FullWake => 9

    /**
     * Native name: MonitorRequestReasonSessionUnlock
     * @type {Integer (Int32)}
     */
    static SessionUnlock => 10

    /**
     * Native name: MonitorRequestReasonScreenOffRequest
     * @type {Integer (Int32)}
     */
    static ScreenOffRequest => 11

    /**
     * Native name: MonitorRequestReasonIdleTimeout
     * @type {Integer (Int32)}
     */
    static IdleTimeout => 12

    /**
     * Native name: MonitorRequestReasonPolicyChange
     * @type {Integer (Int32)}
     */
    static PolicyChange => 13

    /**
     * Native name: MonitorRequestReasonSleepButton
     * @type {Integer (Int32)}
     */
    static SleepButton => 14

    /**
     * Native name: MonitorRequestReasonLid
     * @type {Integer (Int32)}
     */
    static Lid => 15

    /**
     * Native name: MonitorRequestReasonBatteryCountChange
     * @type {Integer (Int32)}
     */
    static BatteryCountChange => 16

    /**
     * Native name: MonitorRequestReasonGracePeriod
     * @type {Integer (Int32)}
     */
    static GracePeriod => 17

    /**
     * Native name: MonitorRequestReasonPnP
     * @type {Integer (Int32)}
     */
    static PnP => 18

    /**
     * Native name: MonitorRequestReasonDP
     * @type {Integer (Int32)}
     */
    static ReasonDP => 19

    /**
     * Native name: MonitorRequestReasonSxTransition
     * @type {Integer (Int32)}
     */
    static SxTransition => 20

    /**
     * Native name: MonitorRequestReasonSystemIdle
     * @type {Integer (Int32)}
     */
    static SystemIdle => 21

    /**
     * Native name: MonitorRequestReasonNearProximity
     * @type {Integer (Int32)}
     */
    static NearProximity => 22

    /**
     * Native name: MonitorRequestReasonThermalStandby
     * @type {Integer (Int32)}
     */
    static ThermalStandby => 23

    /**
     * Native name: MonitorRequestReasonResumePdc
     * @type {Integer (Int32)}
     */
    static ResumePdc => 24

    /**
     * Native name: MonitorRequestReasonResumeS4
     * @type {Integer (Int32)}
     */
    static ResumeS4 => 25

    /**
     * Native name: MonitorRequestReasonTerminal
     * @type {Integer (Int32)}
     */
    static Terminal => 26

    /**
     * Native name: MonitorRequestReasonPdcSignal
     * @type {Integer (Int32)}
     */
    static PdcSignal => 27

    /**
     * Native name: MonitorRequestReasonAcDcDisplayBurstSuppressed
     * @type {Integer (Int32)}
     */
    static AcDcDisplayBurstSuppressed => 28

    /**
     * Native name: MonitorRequestReasonSystemStateEntered
     * @type {Integer (Int32)}
     */
    static SystemStateEntered => 29

    /**
     * Native name: MonitorRequestReasonWinrt
     * @type {Integer (Int32)}
     */
    static Winrt => 30

    /**
     * Native name: MonitorRequestReasonUserInputKeyboard
     * @type {Integer (Int32)}
     */
    static UserInputKeyboard => 31

    /**
     * Native name: MonitorRequestReasonUserInputMouse
     * @type {Integer (Int32)}
     */
    static UserInputMouse => 32

    /**
     * Native name: MonitorRequestReasonUserInputTouchpad
     * @type {Integer (Int32)}
     */
    static UserInputTouchpad => 33

    /**
     * Native name: MonitorRequestReasonUserInputPen
     * @type {Integer (Int32)}
     */
    static UserInputPen => 34

    /**
     * Native name: MonitorRequestReasonUserInputAccelerometer
     * @type {Integer (Int32)}
     */
    static UserInputAccelerometer => 35

    /**
     * Native name: MonitorRequestReasonUserInputHid
     * @type {Integer (Int32)}
     */
    static UserInputHid => 36

    /**
     * Native name: MonitorRequestReasonUserInputPoUserPresent
     * @type {Integer (Int32)}
     */
    static UserInputPoUserPresent => 37

    /**
     * Native name: MonitorRequestReasonUserInputSessionSwitch
     * @type {Integer (Int32)}
     */
    static UserInputSessionSwitch => 38

    /**
     * Native name: MonitorRequestReasonUserInputInitialization
     * @type {Integer (Int32)}
     */
    static UserInputInitialization => 39

    /**
     * Native name: MonitorRequestReasonPdcSignalWindowsMobilePwrNotif
     * @type {Integer (Int32)}
     */
    static PdcSignalWindowsMobilePwrNotif => 40

    /**
     * Native name: MonitorRequestReasonPdcSignalWindowsMobileShell
     * @type {Integer (Int32)}
     */
    static PdcSignalWindowsMobileShell => 41

    /**
     * Native name: MonitorRequestReasonPdcSignalHeyCortana
     * @type {Integer (Int32)}
     */
    static PdcSignalHeyCortana => 42

    /**
     * Native name: MonitorRequestReasonPdcSignalHolographicShell
     * @type {Integer (Int32)}
     */
    static PdcSignalHolographicShell => 43

    /**
     * Native name: MonitorRequestReasonPdcSignalFingerprint
     * @type {Integer (Int32)}
     */
    static PdcSignalFingerprint => 44

    /**
     * Native name: MonitorRequestReasonDirectedDrips
     * @type {Integer (Int32)}
     */
    static DirectedDrips => 45

    /**
     * Native name: MonitorRequestReasonDim
     * @type {Integer (Int32)}
     */
    static Dim => 46

    /**
     * Native name: MonitorRequestReasonBuiltinPanel
     * @type {Integer (Int32)}
     */
    static BuiltinPanel => 47

    /**
     * Native name: MonitorRequestReasonDisplayRequiredUnDim
     * @type {Integer (Int32)}
     */
    static DisplayRequiredUnDim => 48

    /**
     * Native name: MonitorRequestReasonBatteryCountChangeSuppressed
     * @type {Integer (Int32)}
     */
    static BatteryCountChangeSuppressed => 49

    /**
     * Native name: MonitorRequestReasonResumeModernStandby
     * @type {Integer (Int32)}
     */
    static ResumeModernStandby => 50

    /**
     * Native name: MonitorRequestReasonTerminalInit
     * @type {Integer (Int32)}
     */
    static TerminalInit => 51

    /**
     * Native name: MonitorRequestReasonPdcSignalSensorsHumanPresence
     * @type {Integer (Int32)}
     */
    static PdcSignalSensorsHumanPresence => 52

    /**
     * Native name: MonitorRequestReasonBatteryPreCritical
     * @type {Integer (Int32)}
     */
    static BatteryPreCritical => 53

    /**
     * Native name: MonitorRequestReasonUserInputTouch
     * @type {Integer (Int32)}
     */
    static UserInputTouch => 54

    /**
     * Native name: MonitorRequestReasonAusterityBatteryDrain
     * @type {Integer (Int32)}
     */
    static AusterityBatteryDrain => 55

    /**
     * Native name: MonitorRequestReasonDozeRestrictedStandby
     * @type {Integer (Int32)}
     */
    static DozeRestrictedStandby => 56

    /**
     * Native name: MonitorRequestReasonSmartRestrictedStandby
     * @type {Integer (Int32)}
     */
    static SmartRestrictedStandby => 57

    /**
     * Native name: MonitorRequestReasonMax
     * @type {Integer (Int32)}
     */
    static Max => 58
}
