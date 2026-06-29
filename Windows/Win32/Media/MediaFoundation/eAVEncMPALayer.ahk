#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the MPEG audio layer. This enumeration is used with the AVEncMPALayer property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpalayer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPALayer {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * MPEG Audio Layer-1.
     * @type {Integer (Int32)}
     */
    static eAVEncMPALayer_1 => 1

    /**
     * MPEG Audio Layer-2.
     * @type {Integer (Int32)}
     */
    static eAVEncMPALayer_2 => 2

    /**
     * MPEG Audio Layer-3.
     * @type {Integer (Int32)}
     */
    static eAVEncMPALayer_3 => 3
}
