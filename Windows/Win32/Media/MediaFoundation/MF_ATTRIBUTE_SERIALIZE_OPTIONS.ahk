#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags for serializing and deserializing attribute stores.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_ATTRIBUTE_SERIALIZE_OPTIONS{

    /**
     * If this flag is set, <b>IUnknown</b> pointers in the attribute store are marshaled to and from the stream. If this flag is absent, <b>IUnknown</b> pointers in the attribute store are not marshaled or serialized.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF => 1
}
