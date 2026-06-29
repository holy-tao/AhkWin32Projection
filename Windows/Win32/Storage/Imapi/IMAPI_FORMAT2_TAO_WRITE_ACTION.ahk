#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that indicate the current state of the write operation when using the IDiscFormat2TrackAtOnceEventArgs interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/ne-imapi2-imapi_format2_tao_write_action
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMAPI_FORMAT2_TAO_WRITE_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates an unknown state.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_UNKNOWN => 0

    /**
     * Preparing to write the track.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_PREPARING => 1

    /**
     * Writing the track.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_WRITING => 2

    /**
     * Closing the track or closing the session.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_FINISHING => 3

    /**
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_TAO_WRITE_ACTION_VERIFYING => 4
}
