#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_SET_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: HalProfileSourceInterval
     * @type {Integer (Int32)}
     */
    static ProfileSourceInterval => 0

    /**
     * Native name: HalProfileSourceInterruptHandler
     * @type {Integer (Int32)}
     */
    static ProfileSourceInterruptHandler => 1

    /**
     * Native name: HalMcaRegisterDriver
     * @type {Integer (Int32)}
     */
    static McaRegisterDriver => 2

    /**
     * Native name: HalKernelErrorHandler
     * @type {Integer (Int32)}
     */
    static KernelErrorHandler => 3

    /**
     * Native name: HalCmcRegisterDriver
     * @type {Integer (Int32)}
     */
    static CmcRegisterDriver => 4

    /**
     * Native name: HalCpeRegisterDriver
     * @type {Integer (Int32)}
     */
    static CpeRegisterDriver => 5

    /**
     * Native name: HalMcaLog
     * @type {Integer (Int32)}
     */
    static McaLog => 6

    /**
     * Native name: HalCmcLog
     * @type {Integer (Int32)}
     */
    static CmcLog => 7

    /**
     * Native name: HalCpeLog
     * @type {Integer (Int32)}
     */
    static CpeLog => 8

    /**
     * Native name: HalGenerateCmcInterrupt
     * @type {Integer (Int32)}
     */
    static GenerateCmcInterrupt => 9

    /**
     * Native name: HalProfileSourceTimerHandler
     * @type {Integer (Int32)}
     */
    static ProfileSourceTimerHandler => 10

    /**
     * Native name: HalEnlightenment
     * @type {Integer (Int32)}
     */
    static Enlightenment => 11

    /**
     * Native name: HalProfileDpgoSourceInterruptHandler
     * @type {Integer (Int32)}
     */
    static ProfileDpgoSourceInterruptHandler => 12

    /**
     * Native name: HalRegisterSecondaryInterruptInterface
     * @type {Integer (Int32)}
     */
    static RegisterSecondaryInterruptInterface => 13

    /**
     * Native name: HalSetChannelPowerInformation
     * @type {Integer (Int32)}
     */
    static ChannelPowerInformation => 14

    /**
     * @type {Integer (Int32)}
     */
    static HalI386ExceptionChainTerminatorInformation => 15

    /**
     * Native name: HalSetResetParkDisposition
     * @type {Integer (Int32)}
     */
    static ResetParkDisposition => 16

    /**
     * Native name: HalSetPsciSuspendMode
     * @type {Integer (Int32)}
     */
    static PsciSuspendMode => 17

    /**
     * Native name: HalSetHvciEnabled
     * @type {Integer (Int32)}
     */
    static HvciEnabled => 18

    /**
     * Native name: HalSetProcessorTraceInterruptHandler
     * @type {Integer (Int32)}
     */
    static ProcessorTraceInterruptHandler => 19

    /**
     * Native name: HalProfileSourceAdd
     * @type {Integer (Int32)}
     */
    static ProfileSourceAdd => 20

    /**
     * Native name: HalProfileSourceRemove
     * @type {Integer (Int32)}
     */
    static ProfileSourceRemove => 21

    /**
     * Native name: HalSetSwInterruptHandler
     * @type {Integer (Int32)}
     */
    static SwInterruptHandler => 22

    /**
     * Native name: HalSetClockTimerMinimumInterval
     * @type {Integer (Int32)}
     */
    static ClockTimerMinimumInterval => 23
}
