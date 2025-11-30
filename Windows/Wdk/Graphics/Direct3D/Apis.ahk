#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class Direct3D {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_MAX_OVERLAYS_BITCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_BITS_PER_COMPONENT_06 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_BITS_PER_COMPONENT_08 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_BITS_PER_COMPONENT_10 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_BITS_PER_COMPONENT_12 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_BITS_PER_COMPONENT_14 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_BITS_PER_COMPONENT_16 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPLAYID_DETAILED_TIMING_TYPE_I_SIZE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_MACROVISION_OEMCOPYPROTECTION_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_I2C_NO_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_I2C_DEVICE_TRANSMITS_DATA_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_OMAC_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_128_BIT_RANDOM_NUMBER_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_ENCRYPTED_PARAMETERS_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_CONFIGURE_SETTING_DATA_SIZE => 4056

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_GET_INFORMATION_PARAMETERS_SIZE => 4056

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_REQUESTED_INFORMATION_SIZE => 4076

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_HDCP_KEY_SELECTION_VECTOR_SIZE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_SIZE => 4

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_CURRENT_HDCP_SRM_VERSION => Guid("{99c5ceff-5f1d-4879-81c1-c52443c9482b}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION => Guid("{0db59d74-a992-492e-a0bd-c23fda564e00}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_CONNECTOR_TYPE => Guid("{81d0bfd5-6afe-48c2-99c0-95a08f97c5da}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_SUPPORTED_PROTECTION_TYPES => Guid("{38f2a801-9a6c-48bb-9107-b6696e6f1797}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_VIRTUAL_PROTECTION_LEVEL => Guid("{b2075857-3eda-4d5d-88db-748f8c1a0549}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_ACTUAL_PROTECTION_LEVEL => Guid("{1957210a-7766-452a-b99a-d27aed54f03a}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_ACTUAL_OUTPUT_FORMAT => Guid("{d7bf1ba3-ad13-4f8e-af98-0dcb3ca204cc}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_ADAPTER_BUS_TYPE => Guid("{c6f4d673-6174-4184-8e35-f6db5200bcba}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_ACP_AND_CGMSA_SIGNALING => Guid("{6629a591-3b79-4cf3-924a-11e8e7811671}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_OUTPUT_ID => Guid("{72cb6df3-244f-40ce-b09e-20506af6302f}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_DVI_CHARACTERISTICS => Guid("{a470b3bb-5dd7-4172-839c-3d3776e0ebf5}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_OUTPUT_HARDWARE_PROTECTION_SUPPORT => Guid("{3b129589-2af8-4ef0-96a2-704a845a218e}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_GET_CODEC_INFO => Guid("{4f374491-8f5f-4445-9dba-95588f6b58b4}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_SET_PROTECTION_LEVEL => Guid("{9bb9327c-4eb5-4727-9f00-b42b0919c0da}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_SET_ACP_AND_CGMSA_SIGNALING => Guid("{09a631a5-d684-4c60-8e4d-d3bb0f0be3ee}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_SET_HDCP_SRM => Guid("{8b5ef5d1-c30d-44ff-84a5-ea71dce78f13}")

    /**
     * @type {Guid}
     */
    static DXGKMDT_OPM_SET_PROTECTION_LEVEL_ACCORDING_TO_CSS_DVD => Guid("{39ce333e-4cc0-44ae-bfcc-da50b5f82e72}")

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_BRIGHTNESS_MAXIMUM_NIT_RANGE_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_MAX_METADATA_NAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_MAX_GPUVERSION_NAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_PRESENT_HISTORY_RECTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_PRESENT_HISTORY_SCATTERBLTS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FLIPEX_TIMEOUT_USER => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_MULTIPLANE_OVERLAY_PLANES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_MULTIPLANE_OVERLAY_ALLOCATIONS_PER_PLANE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_ALLOCATION_WRITE => 1

    /**
     * @type {String}
     */
    static D3DKMT_SUBKEY_DX9 => "DX9"

    /**
     * @type {String}
     */
    static D3DKMT_SUBKEY_OPENGL => "OpenGL"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ENUM_ADAPTERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_GET_PTE_MAX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_SEGMENT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_DIAG_PROCESS_NAME_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_QUERYRESULT_PREEMPTION_ATTEMPT_RESULT_MAX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_QUERYSTATISTICS_DMA_PACKET_TYPE_MAX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_QUERYSTATISTICS_QUEUE_PACKET_TYPE_MAX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_QUERYSTATISTICS_ALLOCATION_PRIORITY_CLASS_MAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_QUERYSTATISTICS_SEGMENT_PREFERENCE_MAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_QUERYSTATISTICS_PROCESS_INTERFERENCE_BUCKET_COUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_GETPRESENTHISTORY_MAXTOKENS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_WAITFORVERTICALBLANK_OBJECTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_SETCONTEXTSCHEDULINGPRIORITY_ABSOLUTE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static OUTPUTDUPL_CREATE_MAX_KEYEDMUTXES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_OBJECTS_PER_HANDLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_MAX_BUNDLE_OBJECTS_PER_HANDLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_GDI_STYLE_HANDLE_DECORATION => 2

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_GRAPHICSPOWER => Guid("{ea5c6870-e93c-4588-bef1-fec42fc9429a}")

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_GRAPHICSPOWER_REGISTER => 2304007

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_GRAPHICSPOWER_VERSION_1_0 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_GRAPHICSPOWER_VERSION_1_1 => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_GRAPHICSPOWER_VERSION_1_2 => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_GRAPHICSPOWER_VERSION => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_VISTA => 4178

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_VISTA_SP1 => 4179

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WIN7 => 8197

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WIN8 => 12302

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM1_3 => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM1_3_PATH_INDEPENDENT_ROTATION => 16387

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_0 => 20515

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_1 => 24579

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_1_5 => 24592

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_1_6 => 24593

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_2 => 28682

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_3 => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_4 => 36870

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_5 => 40971

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_6 => 45060

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_7 => 49156

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_8 => 53249

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM2_9 => 57347

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM3_0 => 61443

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION_WDDM3_1 => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static DXGKDDI_INTERFACE_VERSION => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_VISTA => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WIN7 => 8195

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WIN8_M3 => 12289

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WIN8_CP => 12290

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WIN8_RC => 12291

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WIN8 => 12292

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM1_3 => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_0_M1 => 20480

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_0_M1_3 => 20481

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_0_M2_2 => 20482

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_0 => 20482

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_1_1 => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_1_2 => 24577

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_1_3 => 24578

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_1_4 => 24579

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_1 => 24579

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_2_1 => 28672

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_2_2 => 28673

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_2 => 28673

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_3_1 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_3_2 => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_3 => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_4_1 => 36864

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_4_2 => 36865

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_4 => 36865

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_5_1 => 40960

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_5_2 => 40961

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_5_3 => 40962

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_5 => 40962

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_6_1 => 45056

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_6_2 => 45057

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_6_3 => 45058

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_6_4 => 45059

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_6 => 45059

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_7_1 => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_7_2 => 49153

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_7 => 49153

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_8_1 => 53248

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_8 => 53248

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_9_1 => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM2_9 => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM3_0_1 => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM3_0 => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM3_1_1 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION_WDDM3_1 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_UMD_INTERFACE_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_MAX_PAGE_TABLE_LEVEL_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DXGK_MIN_PAGE_TABLE_LEVEL_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GPUP_DRIVER_ESCAPE => 2253920

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGPU_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_MAX_WRITTEN_PRIMARIES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_MAX_MPO_PRESENT_DIRTY_RECTS => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMDT_MAX_VIDPN_SOURCES_BITCOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_MAX_OBJECT_WAITED_ON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_MAX_OBJECT_SIGNALED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_SYNC_OBJECT_WAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_SYNC_OBJECT_SIGNAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_DOORBELL_PRIVATEDATA_MAX_BYTES_WDDM3_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_MAX_BROADCAST_CONTEXT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_ALLOCATIONPRIORITY_MINIMUM => 671088640

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_ALLOCATIONPRIORITY_LOW => 1342177280

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_ALLOCATIONPRIORITY_NORMAL => 2013265920

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_ALLOCATIONPRIORITY_HIGH => 2684354560

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDI_ALLOCATIONPRIORITY_MAXIMUM => 3355443200

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_CROSS_ADAPTER_RESOURCE_PITCH_ALIGNMENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DKMT_CROSS_ADAPTER_RESOURCE_HEIGHT_ALIGNMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_NUMCLIPVERTICES => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTRANSFORMSTATE_WORLD_DX7 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTRANSFORMSTATE_WORLD1_DX7 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTRANSFORMSTATE_WORLD2_DX7 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTRANSFORMSTATE_WORLD3_DX7 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_MAX_RSTATES_DX6 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_MAX_RSTATES_DX7 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_MAX_RSTATES_DX8 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_MAX_RSTATES_DX9 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_MAX_RSTATES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_MAX_TEXTURESTATES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_TEXTURESTATEBUF_SIZE => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_STRETCHBLTMULTISAMPLE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_PAT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_NO_VSDT_UBYTE4 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTEXF_FLATCUBIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTEXF_GAUSSIANCUBIC => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_LINEPATTERNREP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLEAR_COMPUTERECTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL2_CB32_SETRENDERTARGET => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL2_CB32_CLEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL2_CB32_DRAWONEPRIMITIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL2_CB32_DRAWONEINDEXEDPRIMITIVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL2_CB32_DRAWPRIMITIVES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_STATESETBEGIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_STATESETEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_STATESETDELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_STATESETEXECUTE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_STATESETCAPTURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_STATESETCREATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_SETLIGHT_ENABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_SETLIGHT_DISABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_SETLIGHT_DATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTPATCHFLAG_HASSEGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTPATCHFLAG_HASINFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_ROW_WEIGHTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_COL_WEIGHTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DP2BLT_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DP2BLT_LINEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_USERMEMVERTICES => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_EXECUTEBUFFER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_SWAPVERTEXBUFFER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_SWAPCOMMANDBUFFER => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_REQVERTEXBUFSIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_REQCOMMANDBUFSIZE => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_VIDMEMVERTEXBUF => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALDP2_VIDMEMCOMMANDBUF => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL3_CB32_CLEAR2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL3_CB32_RESERVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL3_CB32_VALIDATETEXTURESTAGESTATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL3_CB32_DRAWPRIMITIVES2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_TSS_RENDERSTATEBASE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_TSS_MAXSTAGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_TSS_STATESPERSTAGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTSS_TEXTUREMAP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_SAMPLER_MAXSAMP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DHAL_SAMPLER_MAXVERTEXSAMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL_SCENE_CAPTURE_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL_SCENE_CAPTURE_END => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL_EXECUTE_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL_EXECUTE_OVERRIDE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALSTATE_GET_TRANSFORM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALSTATE_GET_LIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DHALSTATE_GET_RENDER => 4

    /**
     * @type {Integer (Int64)}
     */
    static D3DHAL_CONTEXT_BAD => 512

    /**
     * @type {Integer (Int64)}
     */
    static D3DHAL_OUTOFCONTEXTS => 513

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL_EXECUTE_ABORT => 528

    /**
     * @type {Integer (Int32)}
     */
    static D3DHAL_EXECUTE_UNHANDLED => 529

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRENDERSTATE_EVICTMANAGEDTEXTURES => 61

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRENDERSTATE_SCENECAPTURE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRS_DELETERTPATCH => 169

    /**
     * @type {Integer (UInt32)}
     */
    static D3DINFINITEINSTRUCTIONS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_MAGIC => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETD3DCAPS8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETFORMATCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETFORMAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_DXVERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETD3DCAPS9 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETEXTENDEDMODECOUNT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETEXTENDEDMODE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETADAPTERGROUP => 19

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETMULTISAMPLEQUALITYLEVELS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_DEFERRED_AGP_AWARE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_FREE_DEFERRED_AGP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_DEFER_AGP_FREES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETD3DQUERYCOUNT => 33

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETD3DQUERY => 34

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGDI2_TYPE_GETDDIVERSION => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DX9_DDI_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDEVINFOID_VCACHE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_HWVERTEXBUFFER => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_HWINDEXBUFFER => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_SUBVOLUMELOCK => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_FOGINFVF => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DFVF_FOG => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXINSTRUCTIONCOUNT_V1_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_LABEL_MAX_V3_0 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TCRDOUTREG_MAX_V1_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TCRDOUTREG_MAX_V2_0 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TCRDOUTREG_MAX_V2_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_OUTPUTREG_MAX_V3_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_OUTPUTREG_MAX_SW_DX9 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ATTROUTREG_MAX_V1_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ATTROUTREG_MAX_V2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ATTROUTREG_MAX_V2_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_INPUTREG_MAX_V1_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_INPUTREG_MAX_V2_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_INPUTREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_INPUTREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TEMPREG_MAX_V1_1 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TEMPREG_MAX_V2_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TEMPREG_MAX_V2_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_TEMPREG_MAX_V3_0 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTREG_MAX_V1_1 => 96

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTREG_MAX_V2_0 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTREG_MAX_V2_1 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTREG_MAX_V3_0 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTINTREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTINTREG_MAX_V2_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTINTREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTINTREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTBOOLREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTBOOLREG_MAX_V2_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTBOOLREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_CONSTBOOLREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ADDRREG_MAX_V1_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ADDRREG_MAX_V2_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ADDRREG_MAX_V2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ADDRREG_MAX_V3_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPSTEP_V2_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPSTEP_V2_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPSTEP_V3_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPINITVALUE_V2_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPINITVALUE_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPINITVALUE_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPITERATIONCOUNT_V2_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPITERATIONCOUNT_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_MAXLOOPITERATIONCOUNT_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_PREDICATE_MAX_V2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_PREDICATE_MAX_V3_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V1_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V1_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V1_3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V1_4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V2_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_V3_0 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_SW_DX9 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V1_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V1_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V1_3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V1_4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V2_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V2_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_V3_0 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V1_1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V1_2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V1_3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V1_4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V2_0 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V2_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_V3_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_COLOROUT_MAX_V2_0 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_COLOROUT_MAX_V2_1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_COLOROUT_MAX_V3_0 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_PREDICATE_MAX_V2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_PREDICATE_MAX_V3_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V1_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V1_2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V1_3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V1_4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V2_0 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V2_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_V3_0 => 224

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_SW_DX9 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTBOOLREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTBOOLREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTBOOLREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTINTREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTINTREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTINTREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_MAXLOOPSTEP_V2_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_MAXLOOPSTEP_V3_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_MAXLOOPINITVALUE_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_MAXLOOPINITVALUE_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_MAXLOOPITERATIONCOUNT_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_MAXLOOPITERATIONCOUNT_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_INPUTREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEMPREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_CONSTREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS_TEXTUREREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_FLOAT1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_FLOAT2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_FLOAT3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_FLOAT4 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_D3DCOLOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_UBYTE4 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_SHORT2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDT_SHORT4 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_POSITION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_BLENDWEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_BLENDINDICES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_NORMAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_PSIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_DIFFUSE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_SPECULAR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD0 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD2 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD3 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD4 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD5 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD6 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_TEXCOORD7 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_POSITION2 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSDE_NORMAL2 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_TOKENTYPESHIFT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_STREAMNUMBERSHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_DATALOADTYPESHIFT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_DATATYPESHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_SKIPCOUNTSHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_VERTEXREGSHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_VERTEXREGINSHIFT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_CONSTCOUNTSHIFT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_CONSTADDRESSSHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_CONSTRSSHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_EXTCOUNTSHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_EXTINFOSHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVSD_STREAMTESSSHIFT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_NUMCLIPVERTICES => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL_SCENE_CAPTURE_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL_SCENE_CAPTURE_END => 1

    /**
     * @type {Integer (Int64)}
     */
    static D3DNTHAL_CONTEXT_BAD => 512

    /**
     * @type {Integer (Int64)}
     */
    static D3DNTHAL_OUTOFCONTEXTS => 513

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL2_CB32_SETRENDERTARGET => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_USERMEMVERTICES => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_EXECUTEBUFFER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_SWAPVERTEXBUFFER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_SWAPCOMMANDBUFFER => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_REQVERTEXBUFSIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_REQCOMMANDBUFSIZE => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_VIDMEMVERTEXBUF => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHALDP2_VIDMEMCOMMANDBUF => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL3_CB32_CLEAR2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL3_CB32_RESERVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL3_CB32_VALIDATETEXTURESTAGESTATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTHAL3_CB32_DRAWPRIMITIVES2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_TSS_RENDERSTATEBASE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_TSS_MAXSTAGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_TSS_STATESPERSTAGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRS_MAXVERTEXSHADERINST => 196

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRS_MAXPIXELSHADERINST => 197

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DRS_DELETERTPATCH => 169

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_STATESETCREATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DNTCLEAR_COMPUTERECTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static _NT_RTPATCHFLAG_HASSEGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static _NT_RTPATCHFLAG_HASINFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_ROW_WEIGHTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DNTHAL_COL_WEIGHTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_EXTENDED_PRESENTATION_STRETCHFACTOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_MAGIC => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETD3DCAPS8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETFORMATCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETFORMAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_DXVERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_DEFERRED_AGP_AWARE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_FREE_DEFERRED_AGP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_DEFER_AGP_FREES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETD3DCAPS9 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETEXTENDEDMODECOUNT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETEXTENDEDMODE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETADAPTERGROUP => 19

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETMULTISAMPLEQUALITYLEVELS => 22

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETD3DQUERYCOUNT => 33

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETD3DQUERY => 34

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DGDI2_TYPE_GETDDIVERSION => 35

    /**
     * @type {Integer (Int32)}
     */
    static _NT_D3DDEVCAPS_HWVERTEXBUFFER => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static _NT_D3DDEVCAPS_HWINDEXBUFFER => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static _NT_D3DDEVCAPS_SUBVOLUMELOCK => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static _NT_D3DPMISCCAPS_FOGINFVF => 8192

    /**
     * @type {Integer (Int32)}
     */
    static _NT_D3DFVF_FOG => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXINSTRUCTIONCOUNT_V1_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_LABEL_MAX_V3_0 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TCRDOUTREG_MAX_V1_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TCRDOUTREG_MAX_V2_0 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TCRDOUTREG_MAX_V2_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_OUTPUTREG_MAX_V3_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_OUTPUTREG_MAX_SW_DX9 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ATTROUTREG_MAX_V1_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ATTROUTREG_MAX_V2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ATTROUTREG_MAX_V2_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_INPUTREG_MAX_V1_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_INPUTREG_MAX_V2_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_INPUTREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_INPUTREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TEMPREG_MAX_V1_1 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TEMPREG_MAX_V2_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TEMPREG_MAX_V2_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_TEMPREG_MAX_V3_0 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTREG_MAX_V1_1 => 96

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTREG_MAX_V2_0 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTREG_MAX_V2_1 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTREG_MAX_V3_0 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTINTREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTINTREG_MAX_V2_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTINTREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTINTREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTBOOLREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTBOOLREG_MAX_V2_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTBOOLREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_CONSTBOOLREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ADDRREG_MAX_V1_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ADDRREG_MAX_V2_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ADDRREG_MAX_V2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_ADDRREG_MAX_V3_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPSTEP_V2_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPSTEP_V2_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPSTEP_V3_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPINITVALUE_V2_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPINITVALUE_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPINITVALUE_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPITERATIONCOUNT_V2_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPITERATIONCOUNT_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_MAXLOOPITERATIONCOUNT_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_PREDICATE_MAX_V2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DVS_PREDICATE_MAX_V3_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V1_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V1_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V1_3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V1_4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V2_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_V3_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V1_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V1_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V1_3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V1_4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V2_0 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V2_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_V3_0 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V1_1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V1_2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V1_3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V1_4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V2_0 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V2_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_V3_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_COLOROUT_MAX_V2_0 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_COLOROUT_MAX_V2_1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_COLOROUT_MAX_V3_0 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_PREDICATE_MAX_V2_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_PREDICATE_MAX_V3_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_SW_DX9 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V1_1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V1_2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V1_3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V1_4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V2_0 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V2_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_V3_0 => 224

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTBOOLREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTBOOLREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTBOOLREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTINTREG_MAX_SW_DX9 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTINTREG_MAX_V2_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTINTREG_MAX_V3_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_MAXLOOPSTEP_V2_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_MAXLOOPSTEP_V3_0 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_MAXLOOPINITVALUE_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_MAXLOOPINITVALUE_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_MAXLOOPITERATIONCOUNT_V2_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_MAXLOOPITERATIONCOUNT_V3_0 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_INPUTREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEMPREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_CONSTREG_MAX_DX8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static _NT_D3DPS_TEXTUREREG_MAX_DX8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MAX_DMM_ESCAPE_DATASIZE => 102400
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<D3DKMT_CREATEALLOCATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateAllocation(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateAllocation", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEALLOCATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateAllocation2(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateAllocation2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYRESOURCEINFO>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryResourceInfo(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryResourceInfo", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYRESOURCEINFOFROMNTHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryResourceInfoFromNtHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryResourceInfoFromNtHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cObjects 
     * @param {Pointer<Integer>} hObjects 
     * @param {Pointer<OBJECT_ATTRIBUTES>} pObjectAttributes 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<HANDLE>} phSharedNtHandle 
     * @returns {NTSTATUS} 
     */
    static D3DKMTShareObjects(cObjects, hObjects, pObjectAttributes, dwDesiredAccess, phSharedNtHandle) {
        hObjectsMarshal := hObjects is VarRef ? "uint*" : "ptr"

        result := DllCall("GDI32.dll\D3DKMTShareObjects", "uint", cObjects, hObjectsMarshal, hObjects, "ptr", pObjectAttributes, "uint", dwDesiredAccess, "ptr", phSharedNtHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENNTHANDLEFROMNAME>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenNtHandleFromName(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenNtHandleFromName", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENRESOURCEFROMNTHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenResourceFromNtHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenResourceFromNtHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENSYNCOBJECTFROMNTHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenSyncObjectFromNtHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenSyncObjectFromNtHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENRESOURCE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenResource(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenResource", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENRESOURCE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenResource2(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenResource2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYALLOCATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyAllocation(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyAllocation", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYALLOCATION2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyAllocation2(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyAllocation2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETALLOCATIONPRIORITY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetAllocationPriority(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetAllocationPriority", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYALLOCATIONRESIDENCY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryAllocationResidency(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryAllocationResidency", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEDEVICE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateDevice(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateDevice", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYDEVICE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyDevice(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyDevice", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATECONTEXT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateContext(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateContext", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYCONTEXT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyContext(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyContext", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATESYNCHRONIZATIONOBJECT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateSynchronizationObject(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateSynchronizationObject", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATESYNCHRONIZATIONOBJECT2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateSynchronizationObject2(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateSynchronizationObject2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENSYNCHRONIZATIONOBJECT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenSynchronizationObject(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenSynchronizationObject", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYSYNCHRONIZATIONOBJECT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroySynchronizationObject(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroySynchronizationObject", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForSynchronizationObject(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObject", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForSynchronizationObject2(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObject2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSignalSynchronizationObject(param0) {
        result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObject", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSignalSynchronizationObject2(param0) {
        result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObject2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_LOCK>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTLock(param0) {
        result := DllCall("GDI32.dll\D3DKMTLock", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_UNLOCK>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTUnlock(param0) {
        result := DllCall("GDI32.dll\D3DKMTUnlock", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETDISPLAYMODELIST>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetDisplayModeList(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetDisplayModeList", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETDISPLAYMODE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetDisplayMode(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetDisplayMode", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETMULTISAMPLEMETHODLIST>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetMultisampleMethodList(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetMultisampleMethodList", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_PRESENT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTPresent(param0) {
        result := DllCall("GDI32.dll\D3DKMTPresent", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_RENDER>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTRender(param0) {
        result := DllCall("GDI32.dll\D3DKMTRender", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETRUNTIMEDATA>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetRuntimeData(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetRuntimeData", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYADAPTERINFO>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryAdapterInfo(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryAdapterInfo", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENADAPTERFROMHDC>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenAdapterFromHdc(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromHdc", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenAdapterFromGdiDisplayName(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromGdiDisplayName", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENADAPTERFROMDEVICENAME>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenAdapterFromDeviceName(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromDeviceName", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CLOSEADAPTER>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCloseAdapter(param0) {
        result := DllCall("GDI32.dll\D3DKMTCloseAdapter", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETSHAREDPRIMARYHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetSharedPrimaryHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetSharedPrimaryHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ESCAPE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTEscape(param0) {
        result := DllCall("GDI32.dll\D3DKMTEscape", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYSTATISTICS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryStatistics(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryStatistics", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETVIDPNSOURCEOWNER>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetVidPnSourceOwner(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceOwner", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETPRESENTHISTORY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetPresentHistory(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetPresentHistory", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Integer} hAdapter 
     * @param {Pointer<HANDLE>} param1 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetPresentQueueEvent(hAdapter, param1) {
        result := DllCall("GDI32.dll\D3DKMTGetPresentQueueEvent", "uint", hAdapter, "ptr", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEOVERLAY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateOverlay(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateOverlay", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_UPDATEOVERLAY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTUpdateOverlay(param0) {
        result := DllCall("GDI32.dll\D3DKMTUpdateOverlay", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_FLIPOVERLAY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTFlipOverlay(param0) {
        result := DllCall("GDI32.dll\D3DKMTFlipOverlay", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYOVERLAY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyOverlay(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyOverlay", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORVERTICALBLANKEVENT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForVerticalBlankEvent(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForVerticalBlankEvent", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETGAMMARAMP>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetGammaRamp(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetGammaRamp", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETDEVICESTATE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetDeviceState(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetDeviceState", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEDCFROMMEMORY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateDCFromMemory(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateDCFromMemory", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYDCFROMMEMORY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyDCFromMemory(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyDCFromMemory", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETCONTEXTSCHEDULINGPRIORITY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetContextSchedulingPriority(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetContextSchedulingPriority", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETCONTEXTSCHEDULINGPRIORITY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetContextSchedulingPriority(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetContextSchedulingPriority", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Integer} param1 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetProcessSchedulingPriorityClass(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("GDI32.dll\D3DKMTSetProcessSchedulingPriorityClass", "ptr", param0, "int", param1, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetProcessSchedulingPriorityClass(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := DllCall("GDI32.dll\D3DKMTGetProcessSchedulingPriorityClass", "ptr", param0, param1Marshal, param1, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTReleaseProcessVidPnSourceOwners(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := DllCall("GDI32.dll\D3DKMTReleaseProcessVidPnSourceOwners", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETSCANLINE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetScanLine(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetScanLine", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHANGESURFACEPOINTER>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTChangeSurfacePointer(param0) {
        result := DllCall("GDI32.dll\D3DKMTChangeSurfacePointer", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETQUEUEDLIMIT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetQueuedLimit(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetQueuedLimit", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_POLLDISPLAYCHILDREN>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTPollDisplayChildren(param0) {
        result := DllCall("GDI32.dll\D3DKMTPollDisplayChildren", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_INVALIDATEACTIVEVIDPN>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTInvalidateActiveVidPn(param0) {
        result := DllCall("GDI32.dll\D3DKMTInvalidateActiveVidPn", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKOCCLUSION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckOcclusion(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckOcclusion", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORIDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForIdle(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForIdle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKMONITORPOWERSTATE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckMonitorPowerState(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckMonitorPowerState", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static D3DKMTCheckExclusiveOwnership() {
        result := DllCall("GDI32.dll\D3DKMTCheckExclusiveOwnership", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKVIDPNEXCLUSIVEOWNERSHIP>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckVidPnExclusiveOwnership(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckVidPnExclusiveOwnership", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetDisplayPrivateDriverFormat(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetDisplayPrivateDriverFormat", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SHAREDPRIMARYLOCKNOTIFICATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSharedPrimaryLockNotification(param0) {
        result := DllCall("GDI32.dll\D3DKMTSharedPrimaryLockNotification", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SHAREDPRIMARYUNLOCKNOTIFICATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSharedPrimaryUnLockNotification(param0) {
        result := DllCall("GDI32.dll\D3DKMTSharedPrimaryUnLockNotification", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEKEYEDMUTEX>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateKeyedMutex(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateKeyedMutex", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENKEYEDMUTEX>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenKeyedMutex(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenKeyedMutex", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYKEYEDMUTEX>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyKeyedMutex(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyKeyedMutex", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ACQUIREKEYEDMUTEX>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTAcquireKeyedMutex(param0) {
        result := DllCall("GDI32.dll\D3DKMTAcquireKeyedMutex", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_RELEASEKEYEDMUTEX>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTReleaseKeyedMutex(param0) {
        result := DllCall("GDI32.dll\D3DKMTReleaseKeyedMutex", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEKEYEDMUTEX2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateKeyedMutex2(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateKeyedMutex2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENKEYEDMUTEX2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenKeyedMutex2(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenKeyedMutex2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ACQUIREKEYEDMUTEX2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTAcquireKeyedMutex2(param0) {
        result := DllCall("GDI32.dll\D3DKMTAcquireKeyedMutex2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_RELEASEKEYEDMUTEX2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTReleaseKeyedMutex2(param0) {
        result := DllCall("GDI32.dll\D3DKMTReleaseKeyedMutex2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CONFIGURESHAREDRESOURCE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTConfigureSharedResource(param0) {
        result := DllCall("GDI32.dll\D3DKMTConfigureSharedResource", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETOVERLAYSTATE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetOverlayState(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetOverlayState", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKSHAREDRESOURCEACCESS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckSharedResourceAccess(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckSharedResourceAccess", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OFFERALLOCATIONS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOfferAllocations(param0) {
        result := DllCall("GDI32.dll\D3DKMTOfferAllocations", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_RECLAIMALLOCATIONS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTReclaimAllocations(param0) {
        result := DllCall("GDI32.dll\D3DKMTReclaimAllocations", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATE_OUTPUTDUPL>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateOutputDupl(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateOutputDupl", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROY_OUTPUTDUPL>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyOutputDupl(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyOutputDupl", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OUTPUTDUPL_GET_FRAMEINFO>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOutputDuplGetFrameInfo(param0) {
        result := DllCall("GDI32.dll\D3DKMTOutputDuplGetFrameInfo", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OUTPUTDUPL_METADATA>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOutputDuplGetMetaData(param0) {
        result := DllCall("GDI32.dll\D3DKMTOutputDuplGetMetaData", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OUTPUTDUPL_GET_POINTER_SHAPE_DATA>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOutputDuplGetPointerShapeData(param0) {
        result := DllCall("GDI32.dll\D3DKMTOutputDuplGetPointerShapeData", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OUTPUTDUPL_RELEASE_FRAME>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOutputDuplReleaseFrame(param0) {
        result := DllCall("GDI32.dll\D3DKMTOutputDuplReleaseFrame", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OUTPUTDUPLPRESENT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOutputDuplPresent(param0) {
        result := DllCall("GDI32.dll\D3DKMTOutputDuplPresent", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ENUMADAPTERS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTEnumAdapters(param0) {
        result := DllCall("GDI32.dll\D3DKMTEnumAdapters", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ENUMADAPTERS2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTEnumAdapters2(param0) {
        result := DllCall("GDI32.dll\D3DKMTEnumAdapters2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENADAPTERFROMLUID>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenAdapterFromLuid(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromLuid", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYREMOTEVIDPNSOURCEFROMGDIDISPLAYNAME>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryRemoteVidPnSourceFromGdiDisplayName(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryRemoteVidPnSourceFromGdiDisplayName", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETVIDPNSOURCEOWNER1>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetVidPnSourceOwner1(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceOwner1", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORVERTICALBLANKEVENT2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForVerticalBlankEvent2(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForVerticalBlankEvent2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETSYNCREFRESHCOUNTWAITTARGET>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetSyncRefreshCountWaitTarget(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetSyncRefreshCountWaitTarget", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETVERTICALBLANKEVENT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetDWMVerticalBlankEvent(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetDWMVerticalBlankEvent", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_PRESENT_MULTIPLANE_OVERLAY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTPresentMultiPlaneOverlay(param0) {
        result := DllCall("GDI32.dll\D3DKMTPresentMultiPlaneOverlay", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETSHAREDRESOURCEADAPTERLUID>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetSharedResourceAdapterLuid(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetSharedResourceAdapterLuid", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckMultiPlaneOverlaySupport(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckMultiPlaneOverlaySupport", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETCONTEXTINPROCESSSCHEDULINGPRIORITY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetContextInProcessSchedulingPriority(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetContextInProcessSchedulingPriority", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETCONTEXTINPROCESSSCHEDULINGPRIORITY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetContextInProcessSchedulingPriority(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetContextInProcessSchedulingPriority", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDDI_MAKERESIDENT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTMakeResident(param0) {
        result := DllCall("GDI32.dll\D3DKMTMakeResident", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_EVICT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTEvict(param0) {
        result := DllCall("GDI32.dll\D3DKMTEvict", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMCPU>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForSynchronizationObjectFromCpu(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObjectFromCpu", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMCPU>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSignalSynchronizationObjectFromCpu(param0) {
        result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObjectFromCpu", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMGPU>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTWaitForSynchronizationObjectFromGpu(param0) {
        result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObjectFromGpu", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSignalSynchronizationObjectFromGpu(param0) {
        result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObjectFromGpu", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSignalSynchronizationObjectFromGpu2(param0) {
        result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObjectFromGpu2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEPAGINGQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreatePagingQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreatePagingQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDDI_DESTROYPAGINGQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyPagingQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyPagingQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_LOCK2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTLock2(param0) {
        result := DllCall("GDI32.dll\D3DKMTLock2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_UNLOCK2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTUnlock2(param0) {
        result := DllCall("GDI32.dll\D3DKMTUnlock2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_INVALIDATECACHE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTInvalidateCache(param0) {
        result := DllCall("GDI32.dll\D3DKMTInvalidateCache", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDDI_MAPGPUVIRTUALADDRESS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTMapGpuVirtualAddress(param0) {
        result := DllCall("GDI32.dll\D3DKMTMapGpuVirtualAddress", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDDI_RESERVEGPUVIRTUALADDRESS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTReserveGpuVirtualAddress(param0) {
        result := DllCall("GDI32.dll\D3DKMTReserveGpuVirtualAddress", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_FREEGPUVIRTUALADDRESS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTFreeGpuVirtualAddress(param0) {
        result := DllCall("GDI32.dll\D3DKMTFreeGpuVirtualAddress", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_UPDATEGPUVIRTUALADDRESS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTUpdateGpuVirtualAddress(param0) {
        result := DllCall("GDI32.dll\D3DKMTUpdateGpuVirtualAddress", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDDI_GETRESOURCEPRESENTPRIVATEDRIVERDATA>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetResourcePresentPrivateDriverData(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetResourcePresentPrivateDriverData", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATECONTEXTVIRTUAL>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateContextVirtual(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateContextVirtual", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SUBMITCOMMAND>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSubmitCommand(param0) {
        result := DllCall("GDI32.dll\D3DKMTSubmitCommand", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenSyncObjectFromNtHandle2(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenSyncObjectFromNtHandle2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENSYNCOBJECTNTHANDLEFROMNAME>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenSyncObjectNtHandleFromName(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenSyncObjectNtHandleFromName", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYVIDEOMEMORYINFO>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryVideoMemoryInfo(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryVideoMemoryInfo", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHANGEVIDEOMEMORYRESERVATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTChangeVideoMemoryReservation(param0) {
        result := DllCall("GDI32.dll\D3DKMTChangeVideoMemoryReservation", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_REGISTERTRIMNOTIFICATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTRegisterTrimNotification(param0) {
        result := DllCall("GDI32.dll\D3DKMTRegisterTrimNotification", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_UNREGISTERTRIMNOTIFICATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTUnregisterTrimNotification(param0) {
        result := DllCall("GDI32.dll\D3DKMTUnregisterTrimNotification", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckMultiPlaneOverlaySupport2(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckMultiPlaneOverlaySupport2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_PRESENT_MULTIPLANE_OVERLAY2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTPresentMultiPlaneOverlay2(param0) {
        result := DllCall("GDI32.dll\D3DKMTPresentMultiPlaneOverlay2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_RECLAIMALLOCATIONS2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTReclaimAllocations2(param0) {
        result := DllCall("GDI32.dll\D3DKMTReclaimAllocations2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETSTABLEPOWERSTATE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetStablePowerState(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetStablePowerState", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYCLOCKCALIBRATION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryClockCalibration(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryClockCalibration", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryVidPnExclusiveOwnership(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryVidPnExclusiveOwnership", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ADJUSTFULLSCREENGAMMA>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTAdjustFullscreenGamma(param0) {
        result := DllCall("GDI32.dll\D3DKMTAdjustFullscreenGamma", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETVIDPNSOURCEHWPROTECTION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetVidPnSourceHwProtection(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceHwProtection", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_MARKDEVICEASERROR>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTMarkDeviceAsError(param0) {
        result := DllCall("GDI32.dll\D3DKMTMarkDeviceAsError", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_FLUSHHEAPTRANSITIONS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTFlushHeapTransitions(param0) {
        result := DllCall("GDI32.dll\D3DKMTFlushHeapTransitions", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETHWPROTECTIONTEARDOWNRECOVERY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetHwProtectionTeardownRecovery(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetHwProtectionTeardownRecovery", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYPROCESSOFFERINFO>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryProcessOfferInfo(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryProcessOfferInfo", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_TRIMPROCESSCOMMITMENT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTTrimProcessCommitment(param0) {
        result := DllCall("GDI32.dll\D3DKMTTrimProcessCommitment", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDDI_UPDATEALLOCPROPERTY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTUpdateAllocationProperty(param0) {
        result := DllCall("GDI32.dll\D3DKMTUpdateAllocationProperty", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCheckMultiPlaneOverlaySupport3(param0) {
        result := DllCall("GDI32.dll\D3DKMTCheckMultiPlaneOverlaySupport3", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_PRESENT_MULTIPLANE_OVERLAY3>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTPresentMultiPlaneOverlay3(param0) {
        result := DllCall("GDI32.dll\D3DKMTPresentMultiPlaneOverlay3", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETFSEBLOCK>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetFSEBlock(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetFSEBlock", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYFSEBLOCK>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryFSEBlock(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryFSEBlock", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEHWCONTEXT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateHwContext(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateHwContext", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYHWCONTEXT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyHwContext(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyHwContext", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateHwQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyHwQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SUBMITCOMMANDTOHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSubmitCommandToHwQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTSubmitCommandToHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SUBMITWAITFORSYNCOBJECTSTOHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSubmitWaitForSyncObjectsToHwQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTSubmitWaitForSyncObjectsToHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SUBMITSIGNALSYNCOBJECTSTOHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSubmitSignalSyncObjectsToHwQueue(param0) {
        result := DllCall("GDI32.dll\D3DKMTSubmitSignalSyncObjectsToHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETALLOCATIONPRIORITY>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetAllocationPriority(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetAllocationPriority", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GET_MULTIPLANE_OVERLAY_CAPS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetMultiPlaneOverlayCaps(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetMultiPlaneOverlayCaps", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GET_POST_COMPOSITION_CAPS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetPostCompositionCaps(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetPostCompositionCaps", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_PRESENT_REDIRECTED>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTPresentRedirected(param0) {
        result := DllCall("GDI32.dll\D3DKMTPresentRedirected", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SETVIDPNSOURCEOWNER2>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetVidPnSourceOwner2(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceOwner2", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SET_COLORSPACE_TRANSFORM>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSetMonitorColorSpaceTransform(param0) {
        result := DllCall("GDI32.dll\D3DKMTSetMonitorColorSpaceTransform", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CREATEPROTECTEDSESSION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCreateProtectedSession(param0) {
        result := DllCall("GDI32.dll\D3DKMTCreateProtectedSession", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_DESTROYPROTECTEDSESSION>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTDestroyProtectedSession(param0) {
        result := DllCall("GDI32.dll\D3DKMTDestroyProtectedSession", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYPROTECTEDSESSIONSTATUS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryProtectedSessionStatus(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryProtectedSessionStatus", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_QUERYPROTECTEDSESSIONINFOFROMNTHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTQueryProtectedSessionInfoFromNtHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTQueryProtectedSessionInfoFromNtHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENPROTECTEDSESSIONFROMNTHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenProtectedSessionFromNtHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenProtectedSessionFromNtHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTGetProcessDeviceRemovalSupport(param0) {
        result := DllCall("GDI32.dll\D3DKMTGetProcessDeviceRemovalSupport", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOpenKeyedMutexFromNtHandle(param0) {
        result := DllCall("GDI32.dll\D3DKMTOpenKeyedMutexFromNtHandle", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTRegisterVailProcess(param0) {
        result := DllCall("GDI32.dll\D3DKMTRegisterVailProcess", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SUBMITPRESENTBLTTOHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSubmitPresentBltToHwQueue(param0) {
        result := DllCall("api-ms-win-dx-d3dkmt-l1-1-4.dll\D3DKMTSubmitPresentBltToHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_SUBMITPRESENTTOHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTSubmitPresentToHwQueue(param0) {
        result := DllCall("api-ms-win-dx-d3dkmt-l1-1-4.dll\D3DKMTSubmitPresentToHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_OUTPUTDUPLPRESENTTOHWQUEUE>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTOutputDuplPresentToHwQueue(param0) {
        result := DllCall("api-ms-win-dx-d3dkmt-l1-1-4.dll\D3DKMTOutputDuplPresentToHwQueue", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_ENUMADAPTERS3>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTEnumAdapters3(param0) {
        result := DllCall("api-ms-win-dx-d3dkmt-l1-1-6.dll\D3DKMTEnumAdapters3", "ptr", param0, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DKMT_CANCEL_PRESENTS>} param0 
     * @returns {NTSTATUS} 
     */
    static D3DKMTCancelPresents(param0) {
        result := DllCall("GDI32.dll\D3DKMTCancelPresents", "ptr", param0, "int")
        return result
    }

;@endregion Methods
}
