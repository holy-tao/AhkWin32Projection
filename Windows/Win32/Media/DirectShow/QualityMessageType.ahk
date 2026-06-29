#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a quality message type.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-qualitymessagetype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct QualityMessageType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Downstream filter needs more data.
     * @type {Integer (Int32)}
     */
    static Famine => 0

    /**
     * Downstream filter needs less data.
     * @type {Integer (Int32)}
     */
    static Flood => 1
}
