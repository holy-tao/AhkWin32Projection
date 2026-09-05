#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the encoder interlaces the output video. This enumeration is used with the AVEncVideoOutputScanType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideooutputscantype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoOutputScanType extends Win32Enum {

    /**
     * Output frames are progressive.
     * Native name: eAVEncVideoOutputScan_Progressive
     * @type {Integer (Int32)}
     */
    static Progressive => 0

    /**
     * Output frames are interlaced.
     * Native name: eAVEncVideoOutputScan_Interlaced
     * @type {Integer (Int32)}
     */
    static Interlaced => 1

    /**
     * The interlacing on the output frames matches the input frames.
     * Native name: eAVEncVideoOutputScan_SameAsInput
     * @type {Integer (Int32)}
     */
    static SameAsInput => 2

    /**
     * Use the media type on the encoder's input pin to determine whether the frames are progressive or interlaced.
     * Native name: eAVEncVideoOutputScan_Automatic
     * @type {Integer (Int32)}
     */
    static Automatic => 3
}
