#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the quality level for a pipeline component.
 * @remarks
 * 
  * Each successive quality level decreases the amount of processing that is needed, while also reducing the resulting quality of the audio or video. The specific algorithm used to reduce quality depends on the component. Mode 1 is the least aggressive mode, and mode 5 is the most aggressive. A component is not required to implement all five levels. Also, the same quality level might not be comparable between two different components.
  *       
  * 
  * Video decoders can often reduce quality by leaving out certain post-processing steps. The enhanced video renderer (EVR) can sometimes reduce quality by switching to a different deinterlacing mode.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_quality_level
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_QUALITY_LEVEL{

    /**
     * Normal quality.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_NORMAL => 0

    /**
     * One level below normal quality.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_NORMAL_MINUS_1 => 1

    /**
     * Two levels below normal quality.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_NORMAL_MINUS_2 => 2

    /**
     * Three levels below normal quality.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_NORMAL_MINUS_3 => 3

    /**
     * Four levels below normal quality.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_NORMAL_MINUS_4 => 4

    /**
     * Five levels below normal quality.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_NORMAL_MINUS_5 => 5

    /**
     * Maximum number of quality levels. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static MF_NUM_QUALITY_LEVELS => 6
}
