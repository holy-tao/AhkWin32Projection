#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_COUNTER_TYPE extends Win32Enum {

    /**
     * Native name: StorageCounterTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageCounterTypeTemperatureCelsius
     * @type {Integer (Int32)}
     */
    static TemperatureCelsius => 1

    /**
     * Native name: StorageCounterTypeTemperatureCelsiusMax
     * @type {Integer (Int32)}
     */
    static TemperatureCelsiusMax => 2

    /**
     * Native name: StorageCounterTypeReadErrorsTotal
     * @type {Integer (Int32)}
     */
    static ReadErrorsTotal => 3

    /**
     * Native name: StorageCounterTypeReadErrorsCorrected
     * @type {Integer (Int32)}
     */
    static ReadErrorsCorrected => 4

    /**
     * Native name: StorageCounterTypeReadErrorsUncorrected
     * @type {Integer (Int32)}
     */
    static ReadErrorsUncorrected => 5

    /**
     * Native name: StorageCounterTypeWriteErrorsTotal
     * @type {Integer (Int32)}
     */
    static WriteErrorsTotal => 6

    /**
     * Native name: StorageCounterTypeWriteErrorsCorrected
     * @type {Integer (Int32)}
     */
    static WriteErrorsCorrected => 7

    /**
     * Native name: StorageCounterTypeWriteErrorsUncorrected
     * @type {Integer (Int32)}
     */
    static WriteErrorsUncorrected => 8

    /**
     * Native name: StorageCounterTypeManufactureDate
     * @type {Integer (Int32)}
     */
    static ManufactureDate => 9

    /**
     * Native name: StorageCounterTypeStartStopCycleCount
     * @type {Integer (Int32)}
     */
    static StartStopCycleCount => 10

    /**
     * Native name: StorageCounterTypeStartStopCycleCountMax
     * @type {Integer (Int32)}
     */
    static StartStopCycleCountMax => 11

    /**
     * Native name: StorageCounterTypeLoadUnloadCycleCount
     * @type {Integer (Int32)}
     */
    static LoadUnloadCycleCount => 12

    /**
     * Native name: StorageCounterTypeLoadUnloadCycleCountMax
     * @type {Integer (Int32)}
     */
    static LoadUnloadCycleCountMax => 13

    /**
     * Native name: StorageCounterTypeWearPercentage
     * @type {Integer (Int32)}
     */
    static WearPercentage => 14

    /**
     * Native name: StorageCounterTypeWearPercentageWarning
     * @type {Integer (Int32)}
     */
    static WearPercentageWarning => 15

    /**
     * Native name: StorageCounterTypeWearPercentageMax
     * @type {Integer (Int32)}
     */
    static WearPercentageMax => 16

    /**
     * Native name: StorageCounterTypePowerOnHours
     * @type {Integer (Int32)}
     */
    static PowerOnHours => 17

    /**
     * Native name: StorageCounterTypeReadLatency100NSMax
     * @type {Integer (Int32)}
     */
    static ReadLatency100NSMax => 18

    /**
     * Native name: StorageCounterTypeWriteLatency100NSMax
     * @type {Integer (Int32)}
     */
    static WriteLatency100NSMax => 19

    /**
     * Native name: StorageCounterTypeFlushLatency100NSMax
     * @type {Integer (Int32)}
     */
    static FlushLatency100NSMax => 20

    /**
     * Native name: StorageCounterTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 21
}
