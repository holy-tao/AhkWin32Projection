#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a Direct3D 12 feature or feature set to query about.
 * @remarks
 * 
 * Use a constant from  this enumeration in a call to [ID3D12Device::CheckFeatureSupport](./nf-d3d12-id3d12device-checkfeaturesupport.md) to query a driver about support for various Direct3D 12 features. Each value in this enumeration has a corresponding data structure that you must pass (by pointer reference) in the *pFeatureSupportData* parameter of **ID3D12Device::CheckFeatureSupport**.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_feature
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE{

    /**
     * Indicates a query for the level of support for basic Direct3D 12 feature options. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS => 0

    /**
     * Indicates a query for the adapter's architectural details, so that your application can better optimize for certain adapter properties. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_architecture">D3D12_FEATURE_DATA_ARCHITECTURE</a>.
 * 
 * <div class="alert"><b>Note</b>  This value has been superseded by the <b>D3D_FEATURE_DATA_ARCHITECTURE1</b> value. If your application targets Windows 10, version 1703 (Creators' Update) or higher, then use the <b>D3D_FEATURE_DATA_ARCHITECTURE1</b> value instead.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_ARCHITECTURE => 1

    /**
     * Indicates a query for info about the <a href="https://docs.microsoft.com/windows/win32/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> supported. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_feature_levels">D3D12_FEATURE_DATA_FEATURE_LEVELS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_FEATURE_LEVELS => 2

    /**
     * Indicates a query for the resources supported by the current graphics driver for a given format. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_format_support">D3D12_FEATURE_DATA_FORMAT_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_FORMAT_SUPPORT => 3

    /**
     * Indicates a query for the image quality levels for a given format and sample count. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_multisample_quality_levels">D3D12_FEATURE_DATA_MULTISAMPLE_QUALITY_LEVELS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_MULTISAMPLE_QUALITY_LEVELS => 4

    /**
     * Indicates a query for the DXGI data format. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_format_info">D3D12_FEATURE_DATA_FORMAT_INFO</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_FORMAT_INFO => 5

    /**
     * Indicates a query for the GPU's virtual address space limitations. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_gpu_virtual_address_support">D3D12_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT => 6

    /**
     * Indicates a query for the supported shader model. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_shader_model">D3D12_FEATURE_DATA_SHADER_MODEL</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_SHADER_MODEL => 7

    /**
     * Indicates a query for the level of support for HLSL 6.0 wave operations. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options1">D3D12_FEATURE_DATA_D3D12_OPTIONS1</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS1 => 8

    /**
     * Indicates a query for the level of support for protected resource sessions. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_support">D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_SUPPORT => 10

    /**
     * Indicates a query for root signature version support. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_root_signature">D3D12_FEATURE_DATA_ROOT_SIGNATURE</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_ROOT_SIGNATURE => 12

    /**
     * Indicates a query for each adapter's architectural details, so that your application can better optimize for certain adapter properties. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_architecture1">D3D12_FEATURE_DATA_ARCHITECTURE1</a>.
 * 
 * <div class="alert"><b>Note</b>  This value supersedes the <b>D3D_FEATURE_DATA_ARCHITECTURE</b> value. If your application targets Windows 10, version 1703 (Creators' Update) or higher, then use <b>D3D_FEATURE_DATA_ARCHITECTURE1</b>.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_ARCHITECTURE1 => 16

    /**
     * Indicates a query for the level of support for depth-bounds tests and programmable sample positions. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options2">D3D12_FEATURE_DATA_D3D12_OPTIONS2</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS2 => 18

    /**
     * Indicates a query for the level of support for shader caching. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_shader_cache">D3D12_FEATURE_DATA_SHADER_CACHE</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_SHADER_CACHE => 19

    /**
     * Indicates a query for the adapter's support for prioritization of different command queue types. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_command_queue_priority">D3D12_FEATURE_DATA_COMMAND_QUEUE_PRIORITY</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_COMMAND_QUEUE_PRIORITY => 20

    /**
     * Indicates a query for the level of support for timestamp queries, format-casting, immediate write, view instancing, and barycentrics. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options3">D3D12_FEATURE_DATA_D3D12_OPTIONS3</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS3 => 21

    /**
     * Indicates a query for whether or not the adapter supports creating heaps from existing system memory. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_existing_heaps">D3D12_FEATURE_DATA_EXISTING_HEAPS</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_EXISTING_HEAPS => 22

    /**
     * Indicates a query for the level of support for 64KB-aligned MSAA textures, cross-API sharing, and native 16-bit shader operations. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options4">D3D12_FEATURE_DATA_D3D12_OPTIONS4</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS4 => 23

    /**
     * Indicates a query for the level of support for heap serialization. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_serialization">D3D12_FEATURE_DATA_SERIALIZATION</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_SERIALIZATION => 24

    /**
     * Indicates a query for the level of support for the sharing of resources between different adapters&mdash;for example, multiple GPUs. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_cross_node">D3D12_FEATURE_DATA_CROSS_NODE</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_CROSS_NODE => 25

    /**
     * Starting with Windows 10, version 1809 (10.0; Build 17763), indicates a query for the level of support for render passes, ray tracing, and shader-resource view tier 3 tiled resources. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options5">D3D12_FEATURE_DATA_D3D12_OPTIONS5</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS5 => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_DISPLAYABLE => 28

    /**
     * Starting with Windows 10, version 1903 (10.0; Build 18362), indicates a query for the level of support for variable-rate shading (VRS), and indicates whether or not background processing is supported. For more info, see <a href="https://docs.microsoft.com/windows/win32/direct3d12/vrs">Variable-rate shading (VRS)</a>, and the <a href="https://microsoft.github.io/DirectX-Specs/d3d/BackgroundProcessing.html">Direct3D 12 background processing spec</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS6 => 30

    /**
     * Indicates a query for the level of support for metacommands. The corresponding data structure for this value is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_query_meta_command">D3D12_FEATURE_DATA_QUERY_META_COMMAND</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_QUERY_META_COMMAND => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS7 => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT => 33

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPES => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS8 => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS9 => 37

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS10 => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS11 => 40

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS12 => 41

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS13 => 42

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS14 => 43

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS15 => 44

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS16 => 45

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS17 => 46

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS18 => 47

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS19 => 48

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS20 => 49

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_PREDICATION => 50

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_PLACED_RESOURCE_SUPPORT_INFO => 51

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_HARDWARE_COPY => 52

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_OPTIONS21 => 53

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_D3D12_TIGHT_ALIGNMENT => 54

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_APPLICATION_SPECIFIC_DRIVER_STATE => 56

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_BYTECODE_BYPASS_HASH_SUPPORTED => 57

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FEATURE_SHADER_CACHE_ABI_SUPPORT => 61
}
