#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DxMediaObjects
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global DMO_E_INVALIDSTREAMINDEX := -2147220991

/**
 * @type {Integer (Int32)}
 */
export global DMO_E_INVALIDTYPE := -2147220990

/**
 * @type {Integer (Int32)}
 */
export global DMO_E_TYPE_NOT_SET := -2147220989

/**
 * @type {Integer (Int32)}
 */
export global DMO_E_NOTACCEPTING := -2147220988

/**
 * @type {Integer (Int32)}
 */
export global DMO_E_TYPE_NOT_ACCEPTED := -2147220987

/**
 * @type {Integer (Int32)}
 */
export global DMO_E_NO_MORE_ITEMS := -2147220986

/**
 * @type {Guid}
 */
export global DMOCATEGORY_AUDIO_DECODER := Guid("{57f2db8b-e6bb-4513-9d43-dcd2a6593125}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_AUDIO_ENCODER := Guid("{33d9a761-90c8-11d0-bd43-00a0c911ce86}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_VIDEO_DECODER := Guid("{4a69b442-28be-4991-969c-b500adf5d8a8}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_VIDEO_ENCODER := Guid("{33d9a760-90c8-11d0-bd43-00a0c911ce86}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_AUDIO_EFFECT := Guid("{f3602b3f-0592-48df-a4cd-674721e7ebeb}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_VIDEO_EFFECT := Guid("{d990ee14-776c-4723-be46-3da2f56f10b9}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_AUDIO_CAPTURE_EFFECT := Guid("{f665aaba-3e09-4920-aa5f-219811148f09}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_ACOUSTIC_ECHO_CANCEL := Guid("{bf963d80-c559-11d0-8a2b-00a0c9255ac1}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_AUDIO_NOISE_SUPPRESS := Guid("{e07f903f-62fd-4e60-8cdd-dea7236665b5}")

/**
 * @type {Guid}
 */
export global DMOCATEGORY_AGC := Guid("{e88c9ba0-c557-11d0-8a2b-00a0c9255ac1}")
;@endregion Constants
