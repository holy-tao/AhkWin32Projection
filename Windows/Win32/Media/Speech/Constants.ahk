#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */

;@region Constants

/**
 * @type {String}
 */
export global SPDUI_EngineProperties := "EngineProperties"

/**
 * @type {String}
 */
export global SPDUI_AddRemoveWord := "AddRemoveWord"

/**
 * @type {String}
 */
export global SPDUI_UserTraining := "UserTraining"

/**
 * @type {String}
 */
export global SPDUI_MicTraining := "MicTraining"

/**
 * @type {String}
 */
export global SPDUI_RecoProfileProperties := "RecoProfileProperties"

/**
 * @type {String}
 */
export global SPDUI_AudioProperties := "AudioProperties"

/**
 * @type {String}
 */
export global SPDUI_AudioVolume := "AudioVolume"

/**
 * @type {String}
 */
export global SPDUI_UserEnrollment := "UserEnrollment"

/**
 * @type {String}
 */
export global SPDUI_ShareData := "ShareData"

/**
 * @type {String}
 */
export global SPDUI_Tutorial := "Tutorial"

/**
 * @type {String}
 */
export global SPREG_USER_ROOT := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech"

/**
 * @type {String}
 */
export global SPREG_LOCAL_MACHINE_ROOT := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech"

/**
 * @type {String}
 */
export global SPCAT_AUDIOOUT := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioOutput"

/**
 * @type {String}
 */
export global SPCAT_AUDIOIN := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioInput"

/**
 * @type {String}
 */
export global SPCAT_VOICES := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices"

/**
 * @type {String}
 */
export global SPCAT_RECOGNIZERS := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Recognizers"

/**
 * @type {String}
 */
export global SPCAT_APPLEXICONS := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AppLexicons"

/**
 * @type {String}
 */
export global SPCAT_PHONECONVERTERS := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\PhoneConverters"

/**
 * @type {String}
 */
export global SPCAT_TEXTNORMALIZERS := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\TextNormalizers"

/**
 * @type {String}
 */
export global SPCAT_RECOPROFILES := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\RecoProfiles"

/**
 * @type {String}
 */
export global SPMMSYS_AUDIO_IN_TOKEN_ID := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioInput\TokenEnums\MMAudioIn\"

/**
 * @type {String}
 */
export global SPMMSYS_AUDIO_OUT_TOKEN_ID := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioOutput\TokenEnums\MMAudioOut\"

/**
 * @type {String}
 */
export global SPCURRENT_USER_LEXICON_TOKEN_ID := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\CurrentUserLexicon"

/**
 * @type {String}
 */
export global SPCURRENT_USER_SHORTCUT_TOKEN_ID := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\CurrentUserShortcut"

/**
 * @type {String}
 */
export global SPTOKENVALUE_CLSID := "CLSID"

/**
 * @type {String}
 */
export global SPTOKENKEY_FILES := "Files"

/**
 * @type {String}
 */
export global SPTOKENKEY_UI := "UI"

/**
 * @type {String}
 */
export global SPTOKENKEY_ATTRIBUTES := "Attributes"

/**
 * @type {String}
 */
export global SPTOKENKEY_RETAINEDAUDIO := "SecondsPerRetainedAudioEvent"

/**
 * @type {String}
 */
export global SPTOKENKEY_AUDIO_LATENCY_WARNING := "LatencyWarningThreshold"

/**
 * @type {String}
 */
export global SPTOKENKEY_AUDIO_LATENCY_TRUNCATE := "LatencyTruncateThreshold"

/**
 * @type {String}
 */
export global SPTOKENKEY_AUDIO_LATENCY_UPDATE_INTERVAL := "LatencyUpdateInterval"

/**
 * @type {String}
 */
export global SPVOICECATEGORY_TTSRATE := "DefaultTTSRate"

/**
 * @type {String}
 */
export global SPPROP_RESOURCE_USAGE := "ResourceUsage"

/**
 * @type {String}
 */
export global SPPROP_HIGH_CONFIDENCE_THRESHOLD := "HighConfidenceThreshold"

/**
 * @type {String}
 */
export global SPPROP_NORMAL_CONFIDENCE_THRESHOLD := "NormalConfidenceThreshold"

/**
 * @type {String}
 */
export global SPPROP_LOW_CONFIDENCE_THRESHOLD := "LowConfidenceThreshold"

/**
 * @type {String}
 */
export global SPPROP_RESPONSE_SPEED := "ResponseSpeed"

/**
 * @type {String}
 */
export global SPPROP_COMPLEX_RESPONSE_SPEED := "ComplexResponseSpeed"

/**
 * @type {String}
 */
export global SPPROP_ADAPTATION_ON := "AdaptationOn"

/**
 * @type {String}
 */
export global SPPROP_PERSISTED_BACKGROUND_ADAPTATION := "PersistedBackgroundAdaptation"

/**
 * @type {String}
 */
export global SPPROP_PERSISTED_LANGUAGE_MODEL_ADAPTATION := "PersistedLanguageModelAdaptation"

/**
 * @type {String}
 */
export global SPPROP_UX_IS_LISTENING := "UXIsListening"

/**
 * @type {String}
 */
export global SPTOPIC_SPELLING := "Spelling"

/**
 * @type {String}
 */
export global SPWILDCARD := "..."

/**
 * @type {String}
 */
export global SPDICTATION := "*"

/**
 * @type {String}
 */
export global SPINFDICTATION := "*+"

/**
 * @type {String}
 */
export global SPREG_SAFE_USER_TOKENS := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\UserTokens"

/**
 * @type {Integer (Int32)}
 */
export global SP_LOW_CONFIDENCE := -1

/**
 * @type {Integer (UInt32)}
 */
export global SP_NORMAL_CONFIDENCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_WEIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SP_MAX_WORD_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global SP_MAX_PRON_LENGTH := 384

/**
 * @type {Integer (UInt32)}
 */
export global SP_EMULATE_RESULT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SP_STREAMPOS_ASAP := 0

/**
 * @type {Integer (Int32)}
 */
export global SP_STREAMPOS_REALTIME := -1

/**
 * @type {Integer (UInt32)}
 */
export global SPRP_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SP_MAX_LANGIDS := 20

/**
 * @type {String}
 */
export global SPRECOEXTENSION := "RecoExtension"

/**
 * @type {String}
 */
export global SPALTERNATESCLSID := "AlternatesCLSID"

/**
 * @type {String}
 */
export global SR_LOCALIZED_DESCRIPTION := "Description"

/**
 * @type {Integer (UInt32)}
 */
export global SAPI_ERROR_BASE := 20480

/**
 * @type {Float}
 */
export global Speech_Default_Weight := 1

/**
 * @type {Integer (Int32)}
 */
export global Speech_Max_Word_Length := 128

/**
 * @type {Integer (Int32)}
 */
export global Speech_Max_Pron_Length := 384

/**
 * @type {Integer (Int32)}
 */
export global Speech_StreamPos_Asap := 0

/**
 * @type {Integer (Int32)}
 */
export global Speech_StreamPos_RealTime := -1

/**
 * @type {Integer (Int32)}
 */
export global SpeechAllElements := -1
;@endregion Constants
