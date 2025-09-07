#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the encoder produces encoded fields or encoded frames. This enumeration is used with the AVEncMPVFrameFieldMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvframefieldmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVFrameFieldMode{

    /**
     * The encoder produces an MPEG picture for each field in the source video.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVFrameFieldMode_FieldMode => 0

    /**
     * The encoder produces an MPEG picture for each frame (or pair of fields) in the source video.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVFrameFieldMode_FrameMode => 1
}
