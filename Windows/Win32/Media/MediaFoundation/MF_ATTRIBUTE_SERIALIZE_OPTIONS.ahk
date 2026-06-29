#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags for serializing and deserializing attribute stores.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_ATTRIBUTE_SERIALIZE_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If this flag is set, <b>IUnknown</b> pointers in the attribute store are marshaled to and from the stream. If this flag is absent, <b>IUnknown</b> pointers in the attribute store are not marshaled or serialized.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF => 1
}
