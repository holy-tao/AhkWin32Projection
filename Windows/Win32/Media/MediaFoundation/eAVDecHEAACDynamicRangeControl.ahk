#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether an AAC decoder performs dynamic range control.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecheaacdynamicrangecontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecHEAACDynamicRangeControl {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The decoder does not apply dynamic range control.
     * @type {Integer (Int32)}
     */
    static eAVDecHEAACDynamicRangeControl_OFF => 0

    /**
     * The decoder applies dynamic range control to any AAC stream that contains an extension payload of type EXT_DYNAMIC_RANGE, as defined in ISO/IEC 14496-3 (Table 4.105, "Values of the extension_type field").
     * @type {Integer (Int32)}
     */
    static eAVDecHEAACDynamicRangeControl_ON => 1
}
