#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that indicate the current state of the write operation when using the IDiscFormat2DataEventArgs interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_data_write_action
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMAPI_FORMAT2_DATA_WRITE_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Validating that the current media is supported.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_VALIDATING_MEDIA => 0

    /**
     * Formatting media, when required.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_FORMATTING_MEDIA => 1

    /**
     * Initializing the hardware, for example, setting drive write speeds.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_INITIALIZING_HARDWARE => 2

    /**
     * Optimizing laser intensity for writing to the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_CALIBRATING_POWER => 3

    /**
     * Writing data to the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_WRITING_DATA => 4

    /**
     * Finalizing the write.  This state is media dependent and can include items such as closing the track or session, or finishing background formatting.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_FINALIZATION => 5

    /**
     * Successfully finished the write process.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_COMPLETED => 6

    /**
     * Verifying the integrity of the burned media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_WRITE_ACTION_VERIFYING => 7
}
