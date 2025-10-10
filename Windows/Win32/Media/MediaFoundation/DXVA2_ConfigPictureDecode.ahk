#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the configuration of a DXVA decoder device.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_configpicturedecode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_ConfigPictureDecode extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Defines the encryption protocol type for bit-stream data buffers. If no encryption is applied, the value is DXVA_NoEncrypt. If <b>ConfigBitstreamRaw</b> is 0, the value must be DXVA_NoEncrypt.
     * @type {Pointer<Guid>}
     */
    guidConfigBitstreamEncryption {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Defines the encryption protocol type for macroblock control data buffers. If no encryption is applied, the value is DXVA_NoEncrypt. If <b>ConfigBitstreamRaw</b> is 1, the value must be DXVA_NoEncrypt.
     * @type {Pointer<Guid>}
     */
    guidConfigMBcontrolEncryption {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Defines the encryption protocol type for residual difference decoding data buffers (buffers containing spatial-domain data or sets of transform-domain coefficients for accelerator-based IDCT). If no encryption is applied, the value is DXVA_NoEncrypt. If <b>ConfigBitstreamRaw</b> is 1, the value must be DXVA_NoEncrypt.
     * @type {Pointer<Guid>}
     */
    guidConfigResidDiffEncryption {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates whether the host-decoder sends raw bit-stream data. If the value is 1, the data for the pictures will be sent in bit-stream buffers as raw bit-stream content. If the value is 0, picture data will be sent using macroblock control command buffers. If either <b>ConfigResidDiffHost</b> or <b>ConfigResidDiffAccelerator</b> is 1, the value must be 0.
     * @type {Integer}
     */
    ConfigBitstreamRaw {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies whether macroblock control commands are in raster scan order or in arbitrary order. If the value is 1, the macroblock control commands within each macroblock control command buffer are in raster-scan order. If the value is 0, the order is arbitrary. For some types of bit streams, forcing raster order either greatly increases the number of required macroblock control buffers that must be processed, or requires host reordering of the control information. Therefore, supporting arbitrary order can be more efficient.
     * @type {Integer}
     */
    ConfigMBcontrolRasterOrder {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Contains the host residual difference configuration. If the value is 1, some residual difference decoding data may be sent as blocks in the spatial domain from the host. If the value is 0, spatial domain data will not be sent.
     * @type {Integer}
     */
    ConfigResidDiffHost {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Indicates the word size used to represent residual difference spatial-domain blocks for predicted (non-intra) pictures when using host-based residual difference decoding.
     *           
     * 
     * If <b>ConfigResidDiffHost</b> is 1 and <b>ConfigSpatialResid8</b> is 1, the host will send residual difference spatial-domain blocks for non-intra macroblocks using 8-bit signed samples and for intra macroblocks in predicted (non-intra) pictures in a format that depends on the value of <b>ConfigIntraResidUnsigned</b>:
     *           
     * 
     * <ul>
     * <li>If <b>ConfigIntraResidUnsigned</b> is 0, spatial-domain blocks for intra macroblocks are sent as 8-bit signed integer values relative to a constant reference value of 2^(BPP–1).
     *               </li>
     * <li>If <b>ConfigIntraResidUnsigned</b> is 1, spatial-domain blocks for intra macroblocks are sent as 8-bit unsigned integer values relative to a constant reference value of 0.
     *               </li>
     * </ul>
     * If <b>ConfigResidDiffHost</b> is 1 and <b>ConfigSpatialResid8</b> is 0, the host will send residual difference spatial-domain blocks of data for non-intra macroblocks using 16- bit signed samples and for intra macroblocks in predicted (non-intra) pictures in a format that depends on the value of <b>ConfigIntraResidUnsigned</b>:
     *           
     * 
     * <ul>
     * <li>If <b>ConfigIntraResidUnsigned</b> is 0, spatial domain blocks for intra macroblocks are sent as 16-bit signed integer values relative to a constant reference value of 2^(BPP–1).
     *               </li>
     * <li>If <b>ConfigIntraResidUnsigned</b> is 1, spatial domain blocks for intra macroblocks are sent as 16-bit unsigned integer values relative to a constant reference value of 0.
     *               </li>
     * </ul>
     * If <b>ConfigResidDiffHost</b> is 0, <b>ConfigSpatialResid8</b> must be 0.
     *           
     * 
     * For intra pictures, spatial-domain blocks must be sent using 8-bit samples if bits-per-pixel (BPP) is 8, and using 16-bit samples if BPP &gt; 8. If <b>ConfigIntraResidUnsigned</b> is 0, these samples are sent as signed integer values relative to a constant reference value of 2^(BPP–1), and if <b>ConfigIntraResidUnsigned</b> is 1, these samples are sent as unsigned integer values relative to a constant reference value of 0.
     * @type {Integer}
     */
    ConfigSpatialResid8 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * If the value is 1, 8-bit difference overflow blocks are subtracted rather than added. The value must be 0 unless <b>ConfigSpatialResid8</b> is 1.
     *           
     * 
     * The ability to subtract differences rather than add them enables 8-bit difference decoding to be fully compliant with the full ±255 range of values required in video decoder specifications, because +255 cannot be represented as the addition of two signed 8-bit numbers, but any number in the range ±255 can be represented as the difference between two signed 8-bit numbers (+255 = +127 minus –128).
     * @type {Integer}
     */
    ConfigResid8Subtraction {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * If the value is 1, spatial-domain blocks for intra macroblocks must be clipped to an 8-bit range on the host and spatial-domain blocks for non-intra macroblocks must be clipped to a 9-bit range on the host. If the value is 0, no such clipping is necessary by the host.
     *           
     * 
     * The value must be 0 unless <b>ConfigSpatialResid8</b> is 0 and <b>ConfigResidDiffHost</b> is 1.
     * @type {Integer}
     */
    ConfigSpatialHost8or9Clipping {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * If the value is 1, any spatial-domain residual difference data must be sent in a chrominance-interleaved form matching the YUV format chrominance interleaving pattern. The value must be 0 unless <b>ConfigResidDiffHost</b> is 1 and the YUV format is NV12 or NV21.
     * @type {Integer}
     */
    ConfigSpatialResidInterleaved {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Indicates the method of representation of spatial-domain blocks of residual difference data for intra blocks when using host-based difference decoding.
     *           
     * 
     * If <b>ConfigResidDiffHost</b> is 1 and <b>ConfigIntraResidUnsigned</b> is 0, spatial-domain residual difference data blocks for intra macroblocks must be sent as follows:
     *           
     * 
     * <ul>
     * <li>In a non-intra picture, if <b>ConfigSpatialResid8</b> is 0, the spatial-domain residual difference data blocks for intra macroblocks are sent as 16-bit signed integer values relative to a constant reference value of 2^(BPP–1).
     *               </li>
     * <li>In a non-intra picture, if <b>ConfigSpatialResid8</b> is 1, the spatial-domain residual difference data blocks for intra macroblocks are sent as 8-bit signed integer values relative to a constant reference value of 2^(BPP–1).
     *               </li>
     * <li>In an intra picture, if BPP is 8, the spatial-domain residual difference data blocks for intra macroblocks are sent as 8-bit signed integer values relative to a constant reference value of 2^(BPP–1), regardless of the value of <b>ConfigSpatialResid8</b>.
     *               </li>
     * </ul>
     * If <b>ConfigResidDiffHost</b> is 1 and <b>ConfigIntraResidUnsigned</b> is 1, spatial-domain residual difference data blocks for intra macroblocks must be sent as follows:
     *           
     * 
     * <ul>
     * <li>In a non-intra picture, if <b>ConfigSpatialResid8</b> is 0, the spatial-domain residual difference data blocks for intra macroblocks must be sent as 16-bit unsigned integer values relative to a constant reference value of 0.
     *               </li>
     * <li>In a non-intra picture, if <b>ConfigSpatialResid8</b> is 1, the spatial-domain residual difference data blocks for intra macroblocks are sent as 8-bit unsigned integer values relative to a constant reference value of 0.
     *               </li>
     * <li>In an intra picture, if BPP is 8, the spatial-domain residual difference data blocks for intra macroblocks are sent as 8-bit unsigned integer values relative to a constant reference value of 0, regardless of the value of <b>ConfigSpatialResid8</b>.
     *               </li>
     * </ul>
     * The value of the member must be 0 unless <b>ConfigResidDiffHost</b> is 1.
     * @type {Integer}
     */
    ConfigIntraResidUnsigned {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * If the value is 1, transform-domain blocks of coefficient data may be sent from the host for accelerator-based IDCT. If the value is 0, accelerator-based IDCT will not be used. If both <b>ConfigResidDiffHost</b> and <b>ConfigResidDiffAccelerator</b> are 1, this indicates that some residual difference decoding will be done on the host and some on the accelerator, as indicated by macroblock-level control commands.
     *           
     * 
     * The value must be 0 if <b>ConfigBitstreamRaw</b> is 1.
     * @type {Integer}
     */
    ConfigResidDiffAccelerator {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * If the value is 1, the inverse scan for transform-domain block processing will be performed on the host, and absolute indices will be sent instead for any transform coefficients. If the value is 0, the inverse scan will be performed on the accelerator.
     *           
     * 
     * The value must be 0 if <b>ConfigResidDiffAccelerator</b> is 0 or if <b>Config4GroupedCoefs</b> is 1.
     * @type {Integer}
     */
    ConfigHostInverseScan {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * If the value is 1, the IDCT specified in Annex W of ITU-T Recommendation H.263 is used. If the value is 0, any compliant IDCT can be used for off-host IDCT.
     *           
     * 
     * The H.263 annex does not comply with the IDCT requirements of MPEG-2 corrigendum 2, so the value must not be 1 for use with MPEG-2 video.
     *           
     * 
     * The value must be 0 if <b>ConfigResidDiffAccelerator</b> is 0, indicating purely host-based residual difference decoding.
     * @type {Integer}
     */
    ConfigSpecificIDCT {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * If the value is 1, transform coefficients for off-host IDCT will be sent using the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/dxva/ns-dxva-_dxva_tcoef4group">DXVA_TCoef4Group</a> structure. If the value is 0, the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/dxva/ns-dxva-_dxva_tcoefsingle">DXVA_TCoefSingle</a> structure is used. The value must be 0 if <b>ConfigResidDiffAccelerator</b> is 0 or if <b>ConfigHostInverseScan</b> is 1.
     * @type {Integer}
     */
    Config4GroupedCoefs {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies how many frames the decoder device processes at any one time.
     * @type {Integer}
     */
    ConfigMinRenderTargetBuffCount {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * Contains decoder-specific configuration information.
     * @type {Integer}
     */
    ConfigDecoderSpecific {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }
}
