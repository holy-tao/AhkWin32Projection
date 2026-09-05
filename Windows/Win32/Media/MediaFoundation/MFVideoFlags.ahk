#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that describe a video stream.
 * @remarks
 * Developers are encouraged to use media type attributes instead of using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The following table lists the attributes that correspond to the flags defined in this enumeration.
 * 
 * <table>
 * <tr>
 * <th>Flags</th>
 * <th>Media Type Attribute</th>
 * </tr>
 * <tr>
 * <td>
 * MFVideoFlag_PAD_TO_None
 * 
 * MFVideoFlag_PAD_TO_4x3
 * 
 * MFVideoFlag_PAD_TO_16x9
 * 
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pad-control-flags-attribute">MF_MT_PAD_CONTROL_FLAGS</a>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * MFVideoFlag_SrcContentHint16x9
 * 
 * MFVideoFlag_SrcContentHint16x9
 * 
 * MFVideoFlag_SrcContentHint235_1
 * 
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-source-content-hint-attribute">MF_MT_SOURCE_CONTENT_HINT</a>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * MFVideoFlag_AnalogProtected
 * 
 * MFVideoFlag_DigitallyProtected
 * 
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-drm-flags-attribute">MF_MT_DRM_FLAGS</a>
 * </td>
 * </tr>
 * <tr>
 * <td>MFVideoFlag_PanScanEnabled</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pan-scan-enabled-attribute">MF_MT_PAN_SCAN_ENABLED</a>
 * </td>
 * </tr>
 * <tr>
 * <td>MFVideoFlag_BottomUpLinearRep</td>
 * <td>Use the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-default-stride-attribute">MF_MT_DEFAULT_STRIDE</a> attribute to specify a negative stride.</td>
 * </tr>
 * </table>
 *  
 * 
 * The following flags were defined to describe per-sample interlacing information, but are obsolete:
 * 
 * <ul>
 * <li>MFVideoFlag_ProgressiveContent
 *           </li>
 * <li>MFVideoFlag_FieldRepeatCountMask
 *           </li>
 * <li>MFVideoFlag_FieldRepeatCountShift
 *           </li>
 * <li>MFVideoFlag_ProgressiveSeqReset
 *           </li>
 * <li>MFVideoFlag_LowerFieldFirst
 *             
 *           </li>
 * </ul>
 * Instead, components should use sample attributes to describe per-sample interlacing information, as described in the topic <a href="https://docs.microsoft.com/windows/desktop/medfound/video-interlacing">Video Interlacing</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideoflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoFlags extends Win32Enum {

    /**
     * Use this value to mask out the next three flags, which describe the effective aspect ratio of the image. This value by itself is not a valid flag.
     * Native name: MFVideoFlag_PAD_TO_Mask
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_Mask => 3

    /**
     * Do not modify the picture aspect ratio.
     * Native name: MFVideoFlag_PAD_TO_None
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_None => 0

    /**
     * Display the image in a 4 x 3 area. If this flag is set, the geometrical aperture of the picture should be expanded to a 4 x 3 area by letterboxing or pillarboxing. The geometrical aperture is the portion of the image that is intended to be viewed, without any overscan region.
     * Native name: MFVideoFlag_PAD_TO_4x3
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_4x3 => 1

    /**
     * Display the image in a 16 x 9 area. If this flag is set, the geometrical aperture of the picture should be expanded to a 16 x 9 area by letterboxing or pillarboxing.
     * Native name: MFVideoFlag_PAD_TO_16x9
     * @type {Integer (Int32)}
     */
    static Flag_PAD_TO_16x9 => 2

    /**
     * Use this value to mask out the next three flags, which describe the source content. This value by itself is not a valid flag.
     * Native name: MFVideoFlag_SrcContentHintMask
     * @type {Integer (Int32)}
     */
    static Flag_SrcContentHintMask => 28

    /**
     * There is no additional information about the source content .
     * Native name: MFVideoFlag_SrcContentHintNone
     * @type {Integer (Int32)}
     */
    static Flag_SrcContentHintNone => 0

    /**
     * The source is a 16 x 9 image encoded within a 4 x 3 area.
     * Native name: MFVideoFlag_SrcContentHint16x9
     * @type {Integer (Int32)}
     */
    static Flag_SrcContentHint16x9 => 4

    /**
     * The source is a 2.35:1 image encoded within a 16 x 9 or 4 x 3 area.
     * Native name: MFVideoFlag_SrcContentHint235_1
     * @type {Integer (Int32)}
     */
    static Flag_SrcContentHint235_1 => 8

    /**
     * Analog copy protection should be applied.
     * Native name: MFVideoFlag_AnalogProtected
     * @type {Integer (Int32)}
     */
    static Flag_AnalogProtected => 32

    /**
     * Digital copy protection should be applied.
     * Native name: MFVideoFlag_DigitallyProtected
     * @type {Integer (Int32)}
     */
    static Flag_DigitallyProtected => 64

    /**
     * The video source is progressive content encoded as interlaced video, possibly using 3:2 pulldown. This flag is obsolete. See Remarks.
     * Native name: MFVideoFlag_ProgressiveContent
     * @type {Integer (Int32)}
     */
    static Flag_ProgressiveContent => 128

    /**
     * Used to extract the field repeat count. This flag is obsolete. See Remarks.
     * Native name: MFVideoFlag_FieldRepeatCountMask
     * @type {Integer (Int32)}
     */
    static Flag_FieldRepeatCountMask => 1792

    /**
     * Used to extract the field repeat count. This flag is obsolete. See Remarks.
     * Native name: MFVideoFlag_FieldRepeatCountShift
     * @type {Integer (Int32)}
     */
    static Flag_FieldRepeatCountShift => 8

    /**
     * The progressive sequence was disrupted and the sequence is interlaced at the break. This flag is obsolete. See Remarks.
     * Native name: MFVideoFlag_ProgressiveSeqReset
     * @type {Integer (Int32)}
     */
    static Flag_ProgressiveSeqReset => 2048

    /**
     * Apply the pan and scan rectangle on the output.
     * Native name: MFVideoFlag_PanScanEnabled
     * @type {Integer (Int32)}
     */
    static Flag_PanScanEnabled => 131072

    /**
     * The sample contains the lower field. This flag applies only if the interlace mode is single fields (MFVideoInterlace_FieldSingleUpperFirst or MFVideoInterlace_FieldSingleLowerFirst). This flag is obsolete. See Remarks.
     * Native name: MFVideoFlag_LowerFieldFirst
     * @type {Integer (Int32)}
     */
    static Flag_LowerFieldFirst => 262144

    /**
     * The image is represented bottom-up in memory. This flag should be used only with RGB formats.
     * Native name: MFVideoFlag_BottomUpLinearRep
     * @type {Integer (Int32)}
     */
    static Flag_BottomUpLinearRep => 524288

    /**
     * Reserved. Do not use.
     * Native name: MFVideoFlags_DXVASurface
     * @type {Integer (Int32)}
     */
    static DXVASurface => 1048576

    /**
     * Reserved. Do not use.
     * Native name: MFVideoFlags_RenderTargetSurface
     * @type {Integer (Int32)}
     */
    static RenderTargetSurface => 4194304

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>QWORD</b> value.
     * Native name: MFVideoFlags_ForceQWORD
     * @type {Integer (Int32)}
     */
    static ForceQWORD => 2147483647
}
