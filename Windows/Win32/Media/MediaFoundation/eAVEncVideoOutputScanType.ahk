#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the encoder interlaces the output video. This enumeration is used with the AVEncVideoOutputScanType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideooutputscantype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoOutputScanType{

    /**
     * Output frames are progressive.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputScan_Progressive => 0

    /**
     * Output frames are interlaced.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputScan_Interlaced => 1

    /**
     * The interlacing on the output frames matches the input frames.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputScan_SameAsInput => 2

    /**
     * Use the media type on the encoder's input pin to determine whether the frames are progressive or interlaced.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoOutputScan_Automatic => 3
}
