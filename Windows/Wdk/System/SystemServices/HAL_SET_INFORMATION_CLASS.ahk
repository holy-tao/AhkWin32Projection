#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_SET_INFORMATION_CLASS {
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
    static HalProfileSourceInterval => 0

    /**
     * @type {Integer (Int32)}
     */
    static HalProfileSourceInterruptHandler => 1

    /**
     * @type {Integer (Int32)}
     */
    static HalMcaRegisterDriver => 2

    /**
     * @type {Integer (Int32)}
     */
    static HalKernelErrorHandler => 3

    /**
     * @type {Integer (Int32)}
     */
    static HalCmcRegisterDriver => 4

    /**
     * @type {Integer (Int32)}
     */
    static HalCpeRegisterDriver => 5

    /**
     * @type {Integer (Int32)}
     */
    static HalMcaLog => 6

    /**
     * @type {Integer (Int32)}
     */
    static HalCmcLog => 7

    /**
     * @type {Integer (Int32)}
     */
    static HalCpeLog => 8

    /**
     * @type {Integer (Int32)}
     */
    static HalGenerateCmcInterrupt => 9

    /**
     * @type {Integer (Int32)}
     */
    static HalProfileSourceTimerHandler => 10

    /**
     * @type {Integer (Int32)}
     */
    static HalEnlightenment => 11

    /**
     * @type {Integer (Int32)}
     */
    static HalProfileDpgoSourceInterruptHandler => 12

    /**
     * @type {Integer (Int32)}
     */
    static HalRegisterSecondaryInterruptInterface => 13

    /**
     * @type {Integer (Int32)}
     */
    static HalSetChannelPowerInformation => 14

    /**
     * @type {Integer (Int32)}
     */
    static HalI386ExceptionChainTerminatorInformation => 15

    /**
     * @type {Integer (Int32)}
     */
    static HalSetResetParkDisposition => 16

    /**
     * @type {Integer (Int32)}
     */
    static HalSetPsciSuspendMode => 17

    /**
     * @type {Integer (Int32)}
     */
    static HalSetHvciEnabled => 18

    /**
     * @type {Integer (Int32)}
     */
    static HalSetProcessorTraceInterruptHandler => 19

    /**
     * @type {Integer (Int32)}
     */
    static HalProfileSourceAdd => 20

    /**
     * @type {Integer (Int32)}
     */
    static HalProfileSourceRemove => 21

    /**
     * @type {Integer (Int32)}
     */
    static HalSetSwInterruptHandler => 22

    /**
     * @type {Integer (Int32)}
     */
    static HalSetClockTimerMinimumInterval => 23
}
