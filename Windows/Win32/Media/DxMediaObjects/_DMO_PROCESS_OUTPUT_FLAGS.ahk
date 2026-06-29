#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DMO_PROCESS_OUTPUT_FLAGS enumeration defines flags that specify output processing requests.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_process_output_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct _DMO_PROCESS_OUTPUT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Discard the output when the pointer to the output buffer is <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER => 1
}
