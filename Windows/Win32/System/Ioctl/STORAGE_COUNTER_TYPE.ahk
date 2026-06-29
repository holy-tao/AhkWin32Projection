#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_COUNTER_TYPE {
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
    static StorageCounterTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeTemperatureCelsius => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeTemperatureCelsiusMax => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeReadErrorsTotal => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeReadErrorsCorrected => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeReadErrorsUncorrected => 5

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWriteErrorsTotal => 6

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWriteErrorsCorrected => 7

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWriteErrorsUncorrected => 8

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeManufactureDate => 9

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeStartStopCycleCount => 10

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeStartStopCycleCountMax => 11

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeLoadUnloadCycleCount => 12

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeLoadUnloadCycleCountMax => 13

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWearPercentage => 14

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWearPercentageWarning => 15

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWearPercentageMax => 16

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypePowerOnHours => 17

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeReadLatency100NSMax => 18

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeWriteLatency100NSMax => 19

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeFlushLatency100NSMax => 20

    /**
     * @type {Integer (Int32)}
     */
    static StorageCounterTypeMax => 21
}
