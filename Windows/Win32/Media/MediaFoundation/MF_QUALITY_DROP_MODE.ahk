#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how aggressively a pipeline component should drop samples.
 * @remarks
 * In drop mode, a component drops samples, more or less aggressively depending on the level of the drop mode. The specific algorithm used depends on the component. Mode 1 is the least aggressive mode, and mode 5 is the most aggressive. A component is not required to implement all five levels.
  * 
  * For example, suppose an encoded video stream has three B-frames between each pair of P-frames. A decoder might implement the following drop modes:
  * 
  * <ul>
  * <li>
  * Mode 1: Drop one out of every three B frames.
  * 
  * </li>
  * <li>
  * Mode 2: Drop one out of every two B frames.
  * 
  * </li>
  * <li>
  * Mode 3: Drop all delta frames.
  * 
  * </li>
  * <li>
  * Modes 4 and 5: Unsupported.
  * 
  * </li>
  * </ul>
  * The enhanced video renderer (EVR) can drop video frames before sending them to the EVR mixer.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_quality_drop_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_QUALITY_DROP_MODE{

    /**
     * Normal processing of samples. Drop mode is disabled.
     * @type {Integer (Int32)}
     */
    static MF_DROP_MODE_NONE => 0

    /**
     * First drop mode (least aggressive).
     * @type {Integer (Int32)}
     */
    static MF_DROP_MODE_1 => 1

    /**
     * Second drop mode.
     * @type {Integer (Int32)}
     */
    static MF_DROP_MODE_2 => 2

    /**
     * Third drop mode.
     * @type {Integer (Int32)}
     */
    static MF_DROP_MODE_3 => 3

    /**
     * Fourth drop mode.
     * @type {Integer (Int32)}
     */
    static MF_DROP_MODE_4 => 4

    /**
     * Fifth drop mode (most aggressive, if it is supported; see Remarks).
     * @type {Integer (Int32)}
     */
    static MF_DROP_MODE_5 => 5

    /**
     * Maximum number of drop modes. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static MF_NUM_DROP_MODES => 6
}
