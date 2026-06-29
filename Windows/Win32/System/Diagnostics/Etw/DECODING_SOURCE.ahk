#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the source of the event data.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-decoding_source
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct DECODING_SOURCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The source of the event data is a XML manifest.
     * @type {Integer (Int32)}
     */
    static DecodingSourceXMLFile => 0

    /**
     * The source of the event data is a WMI MOF class.
     * @type {Integer (Int32)}
     */
    static DecodingSourceWbem => 1

    /**
     * The source of the event data is a TMF file.
     * @type {Integer (Int32)}
     */
    static DecodingSourceWPP => 2

    /**
     * Indicates that the event was a self-describing event and was decoded using TraceLogging metadata.
     * @type {Integer (Int32)}
     */
    static DecodingSourceTlg => 3

    /**
     * @type {Integer (Int32)}
     */
    static DecodingSourceMax => 4
}
