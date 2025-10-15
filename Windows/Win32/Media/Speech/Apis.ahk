#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class Speech {

;@region Constants

    /**
     * @type {String}
     */
    static SPDUI_EngineProperties => "EngineProperties"

    /**
     * @type {String}
     */
    static SPDUI_AddRemoveWord => "AddRemoveWord"

    /**
     * @type {String}
     */
    static SPDUI_UserTraining => "UserTraining"

    /**
     * @type {String}
     */
    static SPDUI_MicTraining => "MicTraining"

    /**
     * @type {String}
     */
    static SPDUI_RecoProfileProperties => "RecoProfileProperties"

    /**
     * @type {String}
     */
    static SPDUI_AudioProperties => "AudioProperties"

    /**
     * @type {String}
     */
    static SPDUI_AudioVolume => "AudioVolume"

    /**
     * @type {String}
     */
    static SPDUI_UserEnrollment => "UserEnrollment"

    /**
     * @type {String}
     */
    static SPDUI_ShareData => "ShareData"

    /**
     * @type {String}
     */
    static SPDUI_Tutorial => "Tutorial"

    /**
     * @type {String}
     */
    static SPREG_USER_ROOT => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech"

    /**
     * @type {String}
     */
    static SPREG_LOCAL_MACHINE_ROOT => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech"

    /**
     * @type {String}
     */
    static SPCAT_AUDIOOUT => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioOutput"

    /**
     * @type {String}
     */
    static SPCAT_AUDIOIN => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioInput"

    /**
     * @type {String}
     */
    static SPCAT_VOICES => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices"

    /**
     * @type {String}
     */
    static SPCAT_RECOGNIZERS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Recognizers"

    /**
     * @type {String}
     */
    static SPCAT_APPLEXICONS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AppLexicons"

    /**
     * @type {String}
     */
    static SPCAT_PHONECONVERTERS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\PhoneConverters"

    /**
     * @type {String}
     */
    static SPCAT_TEXTNORMALIZERS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\TextNormalizers"

    /**
     * @type {String}
     */
    static SPCAT_RECOPROFILES => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\RecoProfiles"

    /**
     * @type {String}
     */
    static SPMMSYS_AUDIO_IN_TOKEN_ID => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioInput\TokenEnums\MMAudioIn\"

    /**
     * @type {String}
     */
    static SPMMSYS_AUDIO_OUT_TOKEN_ID => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioOutput\TokenEnums\MMAudioOut\"

    /**
     * @type {String}
     */
    static SPCURRENT_USER_LEXICON_TOKEN_ID => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\CurrentUserLexicon"

    /**
     * @type {String}
     */
    static SPCURRENT_USER_SHORTCUT_TOKEN_ID => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\CurrentUserShortcut"

    /**
     * @type {String}
     */
    static SPTOKENVALUE_CLSID => "CLSID"

    /**
     * @type {String}
     */
    static SPTOKENKEY_FILES => "Files"

    /**
     * @type {String}
     */
    static SPTOKENKEY_UI => "UI"

    /**
     * @type {String}
     */
    static SPTOKENKEY_ATTRIBUTES => "Attributes"

    /**
     * @type {String}
     */
    static SPTOKENKEY_RETAINEDAUDIO => "SecondsPerRetainedAudioEvent"

    /**
     * @type {String}
     */
    static SPTOKENKEY_AUDIO_LATENCY_WARNING => "LatencyWarningThreshold"

    /**
     * @type {String}
     */
    static SPTOKENKEY_AUDIO_LATENCY_TRUNCATE => "LatencyTruncateThreshold"

    /**
     * @type {String}
     */
    static SPTOKENKEY_AUDIO_LATENCY_UPDATE_INTERVAL => "LatencyUpdateInterval"

    /**
     * @type {String}
     */
    static SPVOICECATEGORY_TTSRATE => "DefaultTTSRate"

    /**
     * @type {String}
     */
    static SPPROP_RESOURCE_USAGE => "ResourceUsage"

    /**
     * @type {String}
     */
    static SPPROP_HIGH_CONFIDENCE_THRESHOLD => "HighConfidenceThreshold"

    /**
     * @type {String}
     */
    static SPPROP_NORMAL_CONFIDENCE_THRESHOLD => "NormalConfidenceThreshold"

    /**
     * @type {String}
     */
    static SPPROP_LOW_CONFIDENCE_THRESHOLD => "LowConfidenceThreshold"

    /**
     * @type {String}
     */
    static SPPROP_RESPONSE_SPEED => "ResponseSpeed"

    /**
     * @type {String}
     */
    static SPPROP_COMPLEX_RESPONSE_SPEED => "ComplexResponseSpeed"

    /**
     * @type {String}
     */
    static SPPROP_ADAPTATION_ON => "AdaptationOn"

    /**
     * @type {String}
     */
    static SPPROP_PERSISTED_BACKGROUND_ADAPTATION => "PersistedBackgroundAdaptation"

    /**
     * @type {String}
     */
    static SPPROP_PERSISTED_LANGUAGE_MODEL_ADAPTATION => "PersistedLanguageModelAdaptation"

    /**
     * @type {String}
     */
    static SPPROP_UX_IS_LISTENING => "UXIsListening"

    /**
     * @type {String}
     */
    static SPTOPIC_SPELLING => "Spelling"

    /**
     * @type {String}
     */
    static SPWILDCARD => "..."

    /**
     * @type {String}
     */
    static SPDICTATION => "*"

    /**
     * @type {String}
     */
    static SPINFDICTATION => "*+"

    /**
     * @type {String}
     */
    static SPREG_SAFE_USER_TOKENS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\UserTokens"

    /**
     * @type {Integer (Int32)}
     */
    static SP_LOW_CONFIDENCE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static SP_NORMAL_CONFIDENCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_WEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SP_MAX_WORD_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SP_MAX_PRON_LENGTH => 384

    /**
     * @type {Integer (UInt32)}
     */
    static SP_EMULATE_RESULT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SP_STREAMPOS_ASAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static SP_STREAMPOS_REALTIME => -1

    /**
     * @type {Integer (UInt32)}
     */
    static SPRP_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SP_MAX_LANGIDS => 20

    /**
     * @type {String}
     */
    static SPRECOEXTENSION => "RecoExtension"

    /**
     * @type {String}
     */
    static SPALTERNATESCLSID => "AlternatesCLSID"

    /**
     * @type {String}
     */
    static SR_LOCALIZED_DESCRIPTION => "Description"

    /**
     * @type {Integer (UInt32)}
     */
    static SAPI_ERROR_BASE => 20480

    /**
     * @type {Integer (Single)}
     */
    static Speech_Default_Weight => 1

    /**
     * @type {Integer (Int32)}
     */
    static Speech_Max_Word_Length => 128

    /**
     * @type {Integer (Int32)}
     */
    static Speech_Max_Pron_Length => 384

    /**
     * @type {Integer (Int32)}
     */
    static Speech_StreamPos_Asap => 0

    /**
     * @type {Integer (Int32)}
     */
    static Speech_StreamPos_RealTime => -1

    /**
     * @type {Integer (Int32)}
     */
    static SpeechAllElements => -1
;@endregion Constants

;@region Methods
;@endregion Methods
}
