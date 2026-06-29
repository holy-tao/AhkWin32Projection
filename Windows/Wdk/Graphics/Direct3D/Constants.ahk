#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_MAX_OVERLAYS_BITCOUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_BITS_PER_COMPONENT_06 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_BITS_PER_COMPONENT_08 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_BITS_PER_COMPONENT_10 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_BITS_PER_COMPONENT_12 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_BITS_PER_COMPONENT_14 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_BITS_PER_COMPONENT_16 := 32

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYID_DETAILED_TIMING_TYPE_I_SIZE := 20

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_MACROVISION_OEMCOPYPROTECTION_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_I2C_NO_FLAGS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_I2C_DEVICE_TRANSMITS_DATA_LENGTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_OMAC_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_128_BIT_RANDOM_NUMBER_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_ENCRYPTED_PARAMETERS_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_CONFIGURE_SETTING_DATA_SIZE := 4056

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_GET_INFORMATION_PARAMETERS_SIZE := 4056

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_REQUESTED_INFORMATION_SIZE := 4076

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_HDCP_KEY_SELECTION_VECTOR_SIZE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DXGKMDT_OPM_PROTECTION_TYPE_SIZE := 4

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_CURRENT_HDCP_SRM_VERSION := Guid("{99c5ceff-5f1d-4879-81c1-c52443c9482b}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION := Guid("{0db59d74-a992-492e-a0bd-c23fda564e00}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_CONNECTOR_TYPE := Guid("{81d0bfd5-6afe-48c2-99c0-95a08f97c5da}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_SUPPORTED_PROTECTION_TYPES := Guid("{38f2a801-9a6c-48bb-9107-b6696e6f1797}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_VIRTUAL_PROTECTION_LEVEL := Guid("{b2075857-3eda-4d5d-88db-748f8c1a0549}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_ACTUAL_PROTECTION_LEVEL := Guid("{1957210a-7766-452a-b99a-d27aed54f03a}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_ACTUAL_OUTPUT_FORMAT := Guid("{d7bf1ba3-ad13-4f8e-af98-0dcb3ca204cc}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_ADAPTER_BUS_TYPE := Guid("{c6f4d673-6174-4184-8e35-f6db5200bcba}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_ACP_AND_CGMSA_SIGNALING := Guid("{6629a591-3b79-4cf3-924a-11e8e7811671}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_OUTPUT_ID := Guid("{72cb6df3-244f-40ce-b09e-20506af6302f}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_DVI_CHARACTERISTICS := Guid("{a470b3bb-5dd7-4172-839c-3d3776e0ebf5}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_OUTPUT_HARDWARE_PROTECTION_SUPPORT := Guid("{3b129589-2af8-4ef0-96a2-704a845a218e}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_GET_CODEC_INFO := Guid("{4f374491-8f5f-4445-9dba-95588f6b58b4}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_SET_PROTECTION_LEVEL := Guid("{9bb9327c-4eb5-4727-9f00-b42b0919c0da}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_SET_ACP_AND_CGMSA_SIGNALING := Guid("{09a631a5-d684-4c60-8e4d-d3bb0f0be3ee}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_SET_HDCP_SRM := Guid("{8b5ef5d1-c30d-44ff-84a5-ea71dce78f13}")

/**
 * @type {Guid}
 */
export global DXGKMDT_OPM_SET_PROTECTION_LEVEL_ACCORDING_TO_CSS_DVD := Guid("{39ce333e-4cc0-44ae-bfcc-da50b5f82e72}")

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_BRIGHTNESS_MAXIMUM_NIT_RANGE_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_MAX_METADATA_NAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_MAX_GPUVERSION_NAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_PRESENT_HISTORY_RECTS := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_PRESENT_HISTORY_SCATTERBLTS := 12

/**
 * @type {Integer (UInt32)}
 */
export global FLIPEX_TIMEOUT_USER := 2000

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_MULTIPLANE_OVERLAY_PLANES := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_MULTIPLANE_OVERLAY_ALLOCATIONS_PER_PLANE := 256

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_ALLOCATION_WRITE := 1

/**
 * @type {String}
 */
export global D3DKMT_SUBKEY_DX9 := "DX9"

/**
 * @type {String}
 */
export global D3DKMT_SUBKEY_OPENGL := "OpenGL"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ENUM_ADAPTERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_GET_PTE_MAX := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_SEGMENT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_DIAG_PROCESS_NAME_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_QUERYRESULT_PREEMPTION_ATTEMPT_RESULT_MAX := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_QUERYSTATISTICS_DMA_PACKET_TYPE_MAX := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_QUERYSTATISTICS_QUEUE_PACKET_TYPE_MAX := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_QUERYSTATISTICS_ALLOCATION_PRIORITY_CLASS_MAX := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_QUERYSTATISTICS_SEGMENT_PREFERENCE_MAX := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_QUERYSTATISTICS_PROCESS_INTERFERENCE_BUCKET_COUNT := 9

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_GETPRESENTHISTORY_MAXTOKENS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_WAITFORVERTICALBLANK_OBJECTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_SETCONTEXTSCHEDULINGPRIORITY_ABSOLUTE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global OUTPUTDUPL_CREATE_MAX_KEYEDMUTXES := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_OBJECTS_PER_HANDLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_MAX_BUNDLE_OBJECTS_PER_HANDLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_GDI_STYLE_HANDLE_DECORATION := 2

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_GRAPHICSPOWER := Guid("{ea5c6870-e93c-4588-bef1-fec42fc9429a}")

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_GRAPHICSPOWER_REGISTER := 2304007

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_GRAPHICSPOWER_VERSION_1_0 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_GRAPHICSPOWER_VERSION_1_1 := 4097

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_GRAPHICSPOWER_VERSION_1_2 := 4098

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_GRAPHICSPOWER_VERSION := 4098

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_VISTA := 4178

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_VISTA_SP1 := 4179

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WIN7 := 8197

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WIN8 := 12302

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM1_3 := 16386

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM1_3_PATH_INDEPENDENT_ROTATION := 16387

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_0 := 20515

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_1 := 24579

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_1_5 := 24592

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_1_6 := 24593

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_2 := 28682

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_3 := 32769

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_4 := 36870

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_5 := 40971

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_6 := 45060

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_7 := 49156

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_8 := 53249

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM2_9 := 57347

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM3_0 := 61443

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION_WDDM3_1 := 65540

/**
 * @type {Integer (UInt32)}
 */
export global DXGKDDI_INTERFACE_VERSION := 65540

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_VISTA := 12

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WIN7 := 8195

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WIN8_M3 := 12289

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WIN8_CP := 12290

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WIN8_RC := 12291

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WIN8 := 12292

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM1_3 := 16386

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_0_M1 := 20480

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_0_M1_3 := 20481

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_0_M2_2 := 20482

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_0 := 20482

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_1_1 := 24576

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_1_2 := 24577

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_1_3 := 24578

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_1_4 := 24579

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_1 := 24579

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_2_1 := 28672

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_2_2 := 28673

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_2 := 28673

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_3_1 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_3_2 := 32769

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_3 := 32769

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_4_1 := 36864

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_4_2 := 36865

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_4 := 36865

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_5_1 := 40960

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_5_2 := 40961

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_5_3 := 40962

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_5 := 40962

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_6_1 := 45056

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_6_2 := 45057

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_6_3 := 45058

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_6_4 := 45059

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_6 := 45059

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_7_1 := 49152

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_7_2 := 49153

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_7 := 49153

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_8_1 := 53248

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_8 := 53248

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_9_1 := 57344

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM2_9 := 57344

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM3_0_1 := 61440

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM3_0 := 61440

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM3_1_1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION_WDDM3_1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global D3D_UMD_INTERFACE_VERSION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_MAX_PAGE_TABLE_LEVEL_COUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_MIN_PAGE_TABLE_LEVEL_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GPUP_DRIVER_ESCAPE := 2253920

/**
 * @type {Integer (UInt32)}
 */
export global D3DGPU_NULL := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_MAX_WRITTEN_PRIMARIES := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_MAX_MPO_PRESENT_DIRTY_RECTS := 4095

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMDT_MAX_VIDPN_SOURCES_BITCOUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_MAX_OBJECT_WAITED_ON := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_MAX_OBJECT_SIGNALED := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_SYNC_OBJECT_WAIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_SYNC_OBJECT_SIGNAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_DOORBELL_PRIVATEDATA_MAX_BYTES_WDDM3_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_MAX_BROADCAST_CONTEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_ALLOCATIONPRIORITY_MINIMUM := 671088640

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_ALLOCATIONPRIORITY_LOW := 1342177280

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_ALLOCATIONPRIORITY_NORMAL := 2013265920

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_ALLOCATIONPRIORITY_HIGH := 2684354560

/**
 * @type {Integer (UInt32)}
 */
export global D3DDDI_ALLOCATIONPRIORITY_MAXIMUM := 3355443200

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_CROSS_ADAPTER_RESOURCE_PITCH_ALIGNMENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DKMT_CROSS_ADAPTER_RESOURCE_HEIGHT_ALIGNMENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_NUMCLIPVERTICES := 20

/**
 * @type {Integer (UInt32)}
 */
export global D3DTRANSFORMSTATE_WORLD_DX7 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DTRANSFORMSTATE_WORLD1_DX7 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DTRANSFORMSTATE_WORLD2_DX7 := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3DTRANSFORMSTATE_WORLD3_DX7 := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_MAX_RSTATES_DX6 := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_MAX_RSTATES_DX7 := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_MAX_RSTATES_DX8 := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_MAX_RSTATES_DX9 := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_MAX_RSTATES := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_MAX_TEXTURESTATES := 13

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_TEXTURESTATEBUF_SIZE := 14

/**
 * @type {Integer (Int32)}
 */
export global D3DPRASTERCAPS_STRETCHBLTMULTISAMPLE := 8388608

/**
 * @type {Integer (Int32)}
 */
export global D3DPRASTERCAPS_PAT := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DVTXPCAPS_NO_VSDT_UBYTE4 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DTEXF_FLATCUBIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DTEXF_GAUSSIANCUBIC := 5

/**
 * @type {Integer (Int32)}
 */
export global D3DPMISCCAPS_LINEPATTERNREP := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DCLEAR_COMPUTERECTS := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL2_CB32_SETRENDERTARGET := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL2_CB32_CLEAR := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL2_CB32_DRAWONEPRIMITIVE := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL2_CB32_DRAWONEINDEXEDPRIMITIVE := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL2_CB32_DRAWPRIMITIVES := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_STATESETBEGIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_STATESETEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_STATESETDELETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_STATESETEXECUTE := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_STATESETCAPTURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_STATESETCREATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_SETLIGHT_ENABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_SETLIGHT_DISABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_SETLIGHT_DATA := 2

/**
 * @type {Integer (Int32)}
 */
export global RTPATCHFLAG_HASSEGS := 1

/**
 * @type {Integer (Int32)}
 */
export global RTPATCHFLAG_HASINFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_ROW_WEIGHTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_COL_WEIGHTS := 2

/**
 * @type {Integer (Int32)}
 */
export global DP2BLT_POINT := 1

/**
 * @type {Integer (Int32)}
 */
export global DP2BLT_LINEAR := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_USERMEMVERTICES := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_EXECUTEBUFFER := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_SWAPVERTEXBUFFER := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_SWAPCOMMANDBUFFER := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_REQVERTEXBUFSIZE := 16

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_REQCOMMANDBUFSIZE := 32

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_VIDMEMVERTEXBUF := 64

/**
 * @type {Integer (Int32)}
 */
export global D3DHALDP2_VIDMEMCOMMANDBUF := 128

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL3_CB32_CLEAR2 := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL3_CB32_RESERVED := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL3_CB32_VALIDATETEXTURESTAGESTATE := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL3_CB32_DRAWPRIMITIVES2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_TSS_RENDERSTATEBASE := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_TSS_MAXSTAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_TSS_STATESPERSTAGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3DTSS_TEXTUREMAP := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_SAMPLER_MAXSAMP := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DHAL_SAMPLER_MAXVERTEXSAMP := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL_SCENE_CAPTURE_START := 0

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL_SCENE_CAPTURE_END := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL_EXECUTE_NORMAL := 0

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL_EXECUTE_OVERRIDE := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DHALSTATE_GET_TRANSFORM := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DHALSTATE_GET_LIGHT := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DHALSTATE_GET_RENDER := 4

/**
 * @type {Integer (Int64)}
 */
export global D3DHAL_CONTEXT_BAD := 512

/**
 * @type {Integer (Int64)}
 */
export global D3DHAL_OUTOFCONTEXTS := 513

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL_EXECUTE_ABORT := 528

/**
 * @type {Integer (Int32)}
 */
export global D3DHAL_EXECUTE_UNHANDLED := 529

/**
 * @type {Integer (UInt32)}
 */
export global D3DRENDERSTATE_EVICTMANAGEDTEXTURES := 61

/**
 * @type {Integer (UInt32)}
 */
export global D3DRENDERSTATE_SCENECAPTURE := 62

/**
 * @type {Integer (UInt32)}
 */
export global D3DRS_DELETERTPATCH := 169

/**
 * @type {Integer (UInt32)}
 */
export global D3DINFINITEINSTRUCTIONS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_MAGIC := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETD3DCAPS8 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETFORMATCOUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETFORMAT := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_DXVERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETD3DCAPS9 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETEXTENDEDMODECOUNT := 17

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETEXTENDEDMODE := 18

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETADAPTERGROUP := 19

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETMULTISAMPLEQUALITYLEVELS := 22

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_DEFERRED_AGP_AWARE := 24

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_FREE_DEFERRED_AGP := 25

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_DEFER_AGP_FREES := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETD3DQUERYCOUNT := 33

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETD3DQUERY := 34

/**
 * @type {Integer (UInt32)}
 */
export global D3DGDI2_TYPE_GETDDIVERSION := 35

/**
 * @type {Integer (UInt32)}
 */
export global DX9_DDI_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DDEVINFOID_VCACHE := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DDEVCAPS_HWVERTEXBUFFER := 33554432

/**
 * @type {Integer (Int32)}
 */
export global D3DDEVCAPS_HWINDEXBUFFER := 67108864

/**
 * @type {Integer (Int32)}
 */
export global D3DDEVCAPS_SUBVOLUMELOCK := 134217728

/**
 * @type {Integer (Int32)}
 */
export global D3DPMISCCAPS_FOGINFVF := 8192

/**
 * @type {Integer (Int32)}
 */
export global D3DFVF_FOG := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXINSTRUCTIONCOUNT_V1_1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_LABEL_MAX_V3_0 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TCRDOUTREG_MAX_V1_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TCRDOUTREG_MAX_V2_0 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TCRDOUTREG_MAX_V2_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_OUTPUTREG_MAX_V3_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_OUTPUTREG_MAX_SW_DX9 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ATTROUTREG_MAX_V1_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ATTROUTREG_MAX_V2_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ATTROUTREG_MAX_V2_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_INPUTREG_MAX_V1_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_INPUTREG_MAX_V2_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_INPUTREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_INPUTREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TEMPREG_MAX_V1_1 := 12

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TEMPREG_MAX_V2_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TEMPREG_MAX_V2_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_TEMPREG_MAX_V3_0 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTREG_MAX_V1_1 := 96

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTREG_MAX_V2_0 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTREG_MAX_V2_1 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTREG_MAX_V3_0 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTINTREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTINTREG_MAX_V2_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTINTREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTINTREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTBOOLREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTBOOLREG_MAX_V2_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTBOOLREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_CONSTBOOLREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ADDRREG_MAX_V1_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ADDRREG_MAX_V2_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ADDRREG_MAX_V2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_ADDRREG_MAX_V3_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPSTEP_V2_0 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPSTEP_V2_1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPSTEP_V3_0 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPINITVALUE_V2_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPINITVALUE_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPINITVALUE_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPITERATIONCOUNT_V2_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPITERATIONCOUNT_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_MAXLOOPITERATIONCOUNT_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_PREDICATE_MAX_V2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVS_PREDICATE_MAX_V3_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V1_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V1_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V1_3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V1_4 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V2_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V2_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_V3_0 := 10

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_SW_DX9 := 14

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V1_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V1_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V1_3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V1_4 := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V2_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V2_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_V3_0 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V1_1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V1_2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V1_3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V1_4 := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V2_0 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V2_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_V3_0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_COLOROUT_MAX_V2_0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_COLOROUT_MAX_V2_1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_COLOROUT_MAX_V3_0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_PREDICATE_MAX_V2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_PREDICATE_MAX_V3_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V1_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V1_2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V1_3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V1_4 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V2_0 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V2_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_V3_0 := 224

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_SW_DX9 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTBOOLREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTBOOLREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTBOOLREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTINTREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTINTREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTINTREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_MAXLOOPSTEP_V2_1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_MAXLOOPSTEP_V3_0 := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_MAXLOOPINITVALUE_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_MAXLOOPINITVALUE_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_MAXLOOPITERATIONCOUNT_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_MAXLOOPITERATIONCOUNT_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_INPUTREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEMPREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_CONSTREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DPS_TEXTUREREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_FLOAT1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_FLOAT2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_FLOAT3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_FLOAT4 := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_D3DCOLOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_UBYTE4 := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_SHORT2 := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDT_SHORT4 := 7

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_POSITION := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_BLENDWEIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_BLENDINDICES := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_NORMAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_PSIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_DIFFUSE := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_SPECULAR := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD0 := 7

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD2 := 9

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD3 := 10

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD4 := 11

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD5 := 12

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD6 := 13

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_TEXCOORD7 := 14

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_POSITION2 := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSDE_NORMAL2 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_TOKENTYPESHIFT := 29

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_STREAMNUMBERSHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_DATALOADTYPESHIFT := 28

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_DATATYPESHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_SKIPCOUNTSHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_VERTEXREGSHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_VERTEXREGINSHIFT := 20

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_CONSTCOUNTSHIFT := 25

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_CONSTADDRESSSHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_CONSTRSSHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_EXTCOUNTSHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_EXTINFOSHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3DVSD_STREAMTESSSHIFT := 28

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_NUMCLIPVERTICES := 20

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL_SCENE_CAPTURE_START := 0

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL_SCENE_CAPTURE_END := 1

/**
 * @type {Integer (Int64)}
 */
export global D3DNTHAL_CONTEXT_BAD := 512

/**
 * @type {Integer (Int64)}
 */
export global D3DNTHAL_OUTOFCONTEXTS := 513

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL2_CB32_SETRENDERTARGET := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_USERMEMVERTICES := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_EXECUTEBUFFER := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_SWAPVERTEXBUFFER := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_SWAPCOMMANDBUFFER := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_REQVERTEXBUFSIZE := 16

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_REQCOMMANDBUFSIZE := 32

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_VIDMEMVERTEXBUF := 64

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHALDP2_VIDMEMCOMMANDBUF := 128

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL3_CB32_CLEAR2 := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL3_CB32_RESERVED := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL3_CB32_VALIDATETEXTURESTAGESTATE := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DNTHAL3_CB32_DRAWPRIMITIVES2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_TSS_RENDERSTATEBASE := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_TSS_MAXSTAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_TSS_STATESPERSTAGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3DRS_MAXVERTEXSHADERINST := 196

/**
 * @type {Integer (UInt32)}
 */
export global D3DRS_MAXPIXELSHADERINST := 197

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DRS_DELETERTPATCH := 169

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_STATESETCREATE := 5

/**
 * @type {Integer (Int32)}
 */
export global D3DNTCLEAR_COMPUTERECTS := 8

/**
 * @type {Integer (Int32)}
 */
export global _NT_RTPATCHFLAG_HASSEGS := 1

/**
 * @type {Integer (Int32)}
 */
export global _NT_RTPATCHFLAG_HASINFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_ROW_WEIGHTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3DNTHAL_COL_WEIGHTS := 2

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_EXTENDED_PRESENTATION_STRETCHFACTOR := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_MAGIC := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETD3DCAPS8 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETFORMATCOUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETFORMAT := 3

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_DXVERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_DEFERRED_AGP_AWARE := 24

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_FREE_DEFERRED_AGP := 25

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_DEFER_AGP_FREES := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETD3DCAPS9 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETEXTENDEDMODECOUNT := 17

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETEXTENDEDMODE := 18

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETADAPTERGROUP := 19

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETMULTISAMPLEQUALITYLEVELS := 22

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETD3DQUERYCOUNT := 33

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETD3DQUERY := 34

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DGDI2_TYPE_GETDDIVERSION := 35

/**
 * @type {Integer (Int32)}
 */
export global _NT_D3DDEVCAPS_HWVERTEXBUFFER := 33554432

/**
 * @type {Integer (Int32)}
 */
export global _NT_D3DDEVCAPS_HWINDEXBUFFER := 67108864

/**
 * @type {Integer (Int32)}
 */
export global _NT_D3DDEVCAPS_SUBVOLUMELOCK := 134217728

/**
 * @type {Integer (Int32)}
 */
export global _NT_D3DPMISCCAPS_FOGINFVF := 8192

/**
 * @type {Integer (Int32)}
 */
export global _NT_D3DFVF_FOG := 8192

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXINSTRUCTIONCOUNT_V1_1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_LABEL_MAX_V3_0 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TCRDOUTREG_MAX_V1_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TCRDOUTREG_MAX_V2_0 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TCRDOUTREG_MAX_V2_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_OUTPUTREG_MAX_V3_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_OUTPUTREG_MAX_SW_DX9 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ATTROUTREG_MAX_V1_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ATTROUTREG_MAX_V2_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ATTROUTREG_MAX_V2_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_INPUTREG_MAX_V1_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_INPUTREG_MAX_V2_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_INPUTREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_INPUTREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TEMPREG_MAX_V1_1 := 12

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TEMPREG_MAX_V2_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TEMPREG_MAX_V2_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_TEMPREG_MAX_V3_0 := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTREG_MAX_V1_1 := 96

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTREG_MAX_V2_0 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTREG_MAX_V2_1 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTREG_MAX_V3_0 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTINTREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTINTREG_MAX_V2_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTINTREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTINTREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTBOOLREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTBOOLREG_MAX_V2_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTBOOLREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_CONSTBOOLREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ADDRREG_MAX_V1_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ADDRREG_MAX_V2_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ADDRREG_MAX_V2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_ADDRREG_MAX_V3_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPSTEP_V2_0 := 128

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPSTEP_V2_1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPSTEP_V3_0 := 128

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPINITVALUE_V2_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPINITVALUE_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPINITVALUE_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPITERATIONCOUNT_V2_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPITERATIONCOUNT_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_MAXLOOPITERATIONCOUNT_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_PREDICATE_MAX_V2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DVS_PREDICATE_MAX_V3_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V1_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V1_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V1_3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V1_4 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V2_0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V2_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_V3_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V1_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V1_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V1_3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V1_4 := 6

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V2_0 := 12

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V2_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_V3_0 := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V1_1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V1_2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V1_3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V1_4 := 6

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V2_0 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V2_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_V3_0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_COLOROUT_MAX_V2_0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_COLOROUT_MAX_V2_1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_COLOROUT_MAX_V3_0 := 4

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_PREDICATE_MAX_V2_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_PREDICATE_MAX_V3_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_SW_DX9 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V1_1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V1_2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V1_3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V1_4 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V2_0 := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V2_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_V3_0 := 224

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTBOOLREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTBOOLREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTBOOLREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTINTREG_MAX_SW_DX9 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTINTREG_MAX_V2_1 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTINTREG_MAX_V3_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_MAXLOOPSTEP_V2_1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_MAXLOOPSTEP_V3_0 := 128

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_MAXLOOPINITVALUE_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_MAXLOOPINITVALUE_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_MAXLOOPITERATIONCOUNT_V2_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_MAXLOOPITERATIONCOUNT_V3_0 := 255

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_INPUTREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEMPREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_CONSTREG_MAX_DX8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global _NT_D3DPS_TEXTUREREG_MAX_DX8 := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DKMT_MAX_DMM_ESCAPE_DATASIZE := 102400
;@endregion Constants
