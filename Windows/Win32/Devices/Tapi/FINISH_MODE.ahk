#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FINISH_MODE enum is used by applications to indicate the type of call finish required. Operations that the TAPI DLL performs vary depending on whether a call transfer is being completed or a call is being added to a conference.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-finish_mode
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct FINISH_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A call transfer is being finished.
     * @type {Integer (Int32)}
     */
    static FM_ASTRANSFER => 0

    /**
     * A call is being added to a conference call.
     * @type {Integer (Int32)}
     */
    static FM_ASCONFERENCE => 1
}
