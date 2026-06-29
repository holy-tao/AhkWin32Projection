#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TfAnchor enumeration specify the start anchor or end anchor of an ITfRange object.
 * @remarks
 * A range refers to a span of text in a document. Each range is delimited by a start anchor and an end anchor.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tfanchor
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TfAnchor {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies the start anchor of the <b>ITfRange</b> object.
     * @type {Integer (Int32)}
     */
    static TF_ANCHOR_START => 0

    /**
     * Specifies the end anchor of the <b>ITfRange</b> object.
     * @type {Integer (Int32)}
     */
    static TF_ANCHOR_END => 1
}
