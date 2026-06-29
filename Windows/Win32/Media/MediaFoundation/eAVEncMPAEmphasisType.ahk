#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of de-emphasis filter that should be used when decoding. This enumeration is used with the AVEncMPAEmphasisType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpaemphasistype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPAEmphasisType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_None => 0

    /**
     * 50/15 Î¼s.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_50_15 => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_Reserved => 2

    /**
     * CCITT J.17.
     * @type {Integer (Int32)}
     */
    static eAVEncMPAEmphasisType_CCITT_J17 => 3
}
