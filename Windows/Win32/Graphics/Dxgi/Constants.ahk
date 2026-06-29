#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_MAX_SWAP_CHAIN_BUFFERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_DEBUG_BINARY_VERSION := 1

/**
 * @type {Guid}
 */
export global DXGI_DEBUG_ALL := Guid("{e48ae283-da80-490b-87e6-43e9a9cfda08}")

/**
 * @type {Guid}
 */
export global DXGI_DEBUG_DX := Guid("{35cdd7fc-13b2-421d-a5d7-7e4451287d64}")

/**
 * @type {Guid}
 */
export global DXGI_DEBUG_DXGI := Guid("{25cddaa4-b1c6-47e1-ac3e-98875b5a2e2a}")

/**
 * @type {Guid}
 */
export global DXGI_DEBUG_APP := Guid("{06cd6e01-4219-4ebd-8709-27ed23360c62}")

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT := 1024

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_INVALID_CALL := -2005270527

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_NOT_FOUND := -2005270526

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_MORE_DATA := -2005270525

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_UNSUPPORTED := -2005270524

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_DEVICE_REMOVED := -2005270523

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_DEVICE_HUNG := -2005270522

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_DEVICE_RESET := -2005270521

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_WAS_STILL_DRAWING := -2005270518

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_FRAME_STATISTICS_DISJOINT := -2005270517

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE := -2005270516

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_DRIVER_INTERNAL_ERROR := -2005270496

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_NONEXCLUSIVE := -2005270495

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_NOT_CURRENTLY_AVAILABLE := -2005270494

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_REMOTE_CLIENT_DISCONNECTED := -2005270493

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_REMOTE_OUTOFMEMORY := -2005270492

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_ACCESS_LOST := -2005270490

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_WAIT_TIMEOUT := -2005270489

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_SESSION_DISCONNECTED := -2005270488

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_RESTRICT_TO_OUTPUT_STALE := -2005270487

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_CANNOT_PROTECT_CONTENT := -2005270486

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_ACCESS_DENIED := -2005270485

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_NAME_ALREADY_EXISTS := -2005270484

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_SDK_COMPONENT_MISSING := -2005270483

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_NOT_CURRENT := -2005270482

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_HW_PROTECTION_OUTOFMEMORY := -2005270480

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_DYNAMIC_CODE_POLICY_VIOLATION := -2005270479

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_NON_COMPOSITED_UI := -2005270478

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_MODE_CHANGE_IN_PROGRESS := -2005270491

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_CACHE_CORRUPT := -2005270477

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_CACHE_FULL := -2005270476

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_CACHE_HASH_COLLISION := -2005270475

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_ALREADY_EXISTS := -2005270474

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_MPO_UNPINNED := -2005270428

/**
 * @type {Integer (Int32)}
 */
export global DXGI_ERROR_SETDISPLAYMODE_REQUIRED := -2005270427
;@endregion Constants
