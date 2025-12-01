#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a Direct3D 12 video feature or feature set to query about.
 * @remarks
 * | Field | Value | Description |
 * |-----------|-----------|------------|
 * | D3D12_FEATURE_VIDEO_ENCODER_CODEC | 33 | Checks support for a given codec. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC](ne-d3d12video-d3d12_video_encoder_levels_hevc.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_PROFILE_LEVEL | 34 | Checks support for a given profile and returns the supported levels range for that profile. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_PROFILE_LEVEL](ns-d3d12video-d3d12_feature_data_video_encoder_profile_level.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT | 35 | Checks support for the number of resolution ratios available. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT](ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution_ratios_count.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_OUTPUT_RESOLUTION | 36 | Checks support for the rules that resolutions must meet. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_OUTPUT_RESOLUTION](ns-d3d12video-d3d12_feature_data_video_encoder_output_resolution.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_INPUT_FORMAT | 37 | Checks support for a given input format. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_INPUT_FORMAT](ns-d3d12video-d3d12_feature_data_video_encoder_input_format.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_RATE_CONTROL_MODE | 38 | Checks support for a given rate control mode. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_RATE_CONTROL_MODE](ns-d3d12video-d3d12_feature_data_video_encoder_rate_control_mode.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_INTRA_REFRESH_MODE | 39 | Checks support for a given intra refresh mode. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_INTRA_REFRESH_MODE](ns-d3d12video-d3d12_feature_data_video_encoder_intra_refresh_mode.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE | 40 | Checks support for a given subregion layout mode. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE](ns-d3d12video-d3d12_feature_data_video_encoder_frame_subregion_layout_mode.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_HEAP_SIZE | 41 | Retrieves the memory requirements of a video encoder heap created with the given encoder heap properties. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_HEAP_SIZE](ns-d3d12video-d3d12_feature_data_video_encoder_heap_size.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT | 42 | Retrieves a set of codec specific configuration limits. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT](ns-d3d12video-d3d12_feature_data_video_encoder_codec_configuration_support.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_SUPPORT | 43 | Retrieves the feature support details on the requested configuration. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_SUPPORT](ns-d3d12video-d3d12_feature_data_video_encoder_support.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT | 44 | Retrieves the codec specific capabilities related to the reference picture management limitations. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT](ns-d3d12video-d3d12_feature_data_video_encoder_codec_picture_control_support.md).|
 * | D3D12_FEATURE_VIDEO_ENCODER_RESOURCE_REQUIREMENTS | 45 | Retrieves the requirements for alignment for resource access. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOURCE_REQUIREMENTS](ns-d3d12video-d3d12_feature_data_video_encoder_resource_requirements.md).|
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_feature_video
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_VIDEO extends Win32Enum{

    /**
     * Check if a decode profile, bitstream encryption, resolution, and format are supported.  The result is a <a href="ne-d3d12video-d3d12_video_decode_tier.md">D3D12_VIDEO_DECODE_TIER</a> indicating the level of support.  The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_decode_support.md">D3D12_FEATURE_DATA_VIDEO_DECODE_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_SUPPORT => 0

    /**
     * Retrieve the list of decode profiles supported by the adapter.  Call **CheckFeatureSupport** specifying the feature D3D12_FEATURE_VIDEO_DECODE_PROFILE_COUNT to get the number of profiles before calling **CheckFeatureSupport** for the D3D12_FEATURE_VIDEO_DECODE_PROFILES feature.  The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_decode_profiles.md">D3D12_FEATURE_DATA_VIDEO_DECODE_PROFILES</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_PROFILES => 1

    /**
     * Retrieves the list of supported decode formats for a <a href="ns-d3d12video-d3d12_video_decode_configuration.md">D3D12_VIDEO_DECODE_CONFIGURATION</a>. Call **CheckFeatureSupport** specifying the feature D3D12_FEATURE_VIDEO_DECODE_FORMAT_COUNT to get the number of profiles before calling **CheckFeatureSupport** for the D3D12_FEATURE_VIDEO_DECODE_PROFILES feature.The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_decode_formats.md">D3D12_FEATURE_DATA_VIDEO_DECODE_FORMATS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_FORMATS => 2

    /**
     * Check if a colorspace conversion, format conversion, and scale are supported.  The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_decode_conversion_support.md">D3D12_FEATURE_DATA_VIDEO_DECODE_CONVERSION_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_CONVERSION_SUPPORT => 3

    /**
     * Retrieves the video processor capabilities.  The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_process_support.md">D3D12_FEATURE_DATA_VIDEO_PROCESS_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_PROCESS_SUPPORT => 5

    /**
     * Retrieves the maximum number of streams that can be enabled at the same time.  The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_process_max_input_streams.md">D3D12_FEATURE_DATA_VIDEO_PROCESS_MAX_INPUT_STREAMS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_PROCESS_MAX_INPUT_STREAMS => 6

    /**
     * Retrieves the number of past and future frames required for a given deinterlace mode, filters, frame rate conversion, and features.  The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_process_reference_info.md">D3D12_FEATURE_DATA_VIDEO_PROCESS_REFERENCE_INFO</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_PROCESS_REFERENCE_INFO => 7

    /**
     * Checks the allocation size of a video decoder heap. The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_decoder_heap_size.md">D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE</a>. For information on residency budgeting for heaps, see [Residency](/windows/win32/direct3d12/residency).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODER_HEAP_SIZE => 8

    /**
     * Checks the allocation size of a video processor heap. The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_processor_size.md">D3D12_FEATURE_DATA_VIDEO_PROCESSOR_SIZE</a>. For information on residency budgeting for heaps, see [Residency](/windows/win32/direct3d12/residency).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_PROCESSOR_SIZE => 9

    /**
     * Retrieves the number of supported decoder profiles. The returned count is used when querying for **D3D12_FEATURE_VIDEO_DECODE_PROFILES**.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_PROFILE_COUNT => 10

    /**
     * Retrieves the number of supported decoder profiles. The returned count is used when querying for **D3D12_FEATURE_VIDEO_DECODE_FORMATS**.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_FORMAT_COUNT => 11

    /**
     * Indicates if the video engine is IO coherent with the CPU.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ARCHITECTURE => 17

    /**
     * Retrieves the supported components, bin count, and counter bit depth for the a decode histogram with the specified decode profile, resolution, and format. The associated data structure is <a href="ns-d3d12video-d3d12_feature_data_video_decode_histogram.md">D3D12_FEATURE_DATA_VIDEO_DECODE_HISTOGRAM</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_HISTOGRAM => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_FEATURE_AREA_SUPPORT => 19

    /**
     * Retrieves the supported resolutions, search block sizes, and precision for motion estimation. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR](ns-d3d12video-d3d12_feature_data_video_motion_estimator.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR => 20

    /**
     * Checks the allocation size of a motion estimator heap. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_SIZE](ns-d3d12video-d3d12_feature_data_video_motion_estimator_size.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR_SIZE => 21

    /**
     * Retrieves the supported number of video extension commands.  The associated data structure is [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_COUNT](ns-d3d12video-d3d12_feature_data_video_extension_command_count.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_COUNT => 22

    /**
     * Retrieves a list of [D3D12_VIDEO_EXTENSION_COMMAND_INFO](ns-d3d12video-d3d12_video_extension_command_info.md) structures describing video extension commands. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_COUNT](ns-d3d12video-d3d12_feature_data_video_extension_command_count.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_EXTENSION_COMMANDS => 23

    /**
     * Retrieves the parameter count for the specified parameter stage. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT](ns-d3d12video-d3d12_feature_data_video_extension_command_parameter_count.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT => 24

    /**
     * Retrieves a list of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO](ns-d3d12video-d3d12_video_extension_command_parameter_info.md) structures describing video extension command parameters for the specified parameter stage. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETERS](ns-d3d12video-d3d12_feature_data_video_extension_command_parameters.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS => 25

    /**
     * Queries for command-defined support information. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_SUPPORT](ns-d3d12video-d3d12_feature_data_video_extension_command_support.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_SUPPORT => 26

    /**
     * Checks the allocation size of a video extension command. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_SIZE](ns-d3d12video-d3d12_feature_data_video_extension_command_size.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_SIZE => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODE_PROTECTED_RESOURCES => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_PROCESS_PROTECTED_RESOURCES => 29

    /**
     * Checks support for motion estimation with protected resources. The associated data structure is [D3D12_FEATURE_DATA_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES](ns-d3d12video-d3d12_feature_data_video_motion_estimator_protected_resources.md).
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_MOTION_ESTIMATOR_PROTECTED_RESOURCES => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_DECODER_HEAP_SIZE1 => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_PROCESSOR_SIZE1 => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_CODEC => 33

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_PROFILE_LEVEL => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_OUTPUT_RESOLUTION_RATIOS_COUNT => 35

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_OUTPUT_RESOLUTION => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_INPUT_FORMAT => 37

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_RATE_CONTROL_MODE => 38

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_INTRA_REFRESH_MODE => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_MODE => 40

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_HEAP_SIZE => 41

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT => 42

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_SUPPORT => 43

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT => 44

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_RESOURCE_REQUIREMENTS => 45

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_FRAME_SUBREGION_LAYOUT_CONFIG => 46

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_SUPPORT1 => 47

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_RESOURCE_REQUIREMENTS1 => 48

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT => 49

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_QPMAP_INPUT => 50

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_DIRTY_REGIONS => 51

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_MOTION_SEARCH => 52

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_SUPPORT2 => 55

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_HEAP_SIZE1 => 56

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_VIDEO_ENCODER_RATE_CONTROL_FRAME_ANALYSIS => 57
}
