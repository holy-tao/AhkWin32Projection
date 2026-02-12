#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\System\WinRT\Apis.ahk
#Include ..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class Speech {

;@region Constants

    /**
     * @type {HSTRING}
     */
    static SPDUI_EngineProperties => "EngineProperties"

    /**
     * @type {HSTRING}
     */
    static SPDUI_AddRemoveWord => "AddRemoveWord"

    /**
     * @type {HSTRING}
     */
    static SPDUI_UserTraining => "UserTraining"

    /**
     * @type {HSTRING}
     */
    static SPDUI_MicTraining => "MicTraining"

    /**
     * @type {HSTRING}
     */
    static SPDUI_RecoProfileProperties => "RecoProfileProperties"

    /**
     * @type {HSTRING}
     */
    static SPDUI_AudioProperties => "AudioProperties"

    /**
     * @type {HSTRING}
     */
    static SPDUI_AudioVolume => "AudioVolume"

    /**
     * @type {HSTRING}
     */
    static SPDUI_UserEnrollment => "UserEnrollment"

    /**
     * @type {HSTRING}
     */
    static SPDUI_ShareData => "ShareData"

    /**
     * @type {HSTRING}
     */
    static SPDUI_Tutorial => "Tutorial"

    /**
     * @type {HSTRING}
     */
    static SPREG_USER_ROOT => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech"

    /**
     * @type {HSTRING}
     */
    static SPREG_LOCAL_MACHINE_ROOT => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech"

    /**
     * @type {HSTRING}
     */
    static SPCAT_AUDIOOUT => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioOutput"

    /**
     * @type {HSTRING}
     */
    static SPCAT_AUDIOIN => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioInput"

    /**
     * @type {HSTRING}
     */
    static SPCAT_VOICES => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices"

    /**
     * @type {HSTRING}
     */
    static SPCAT_RECOGNIZERS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Recognizers"

    /**
     * @type {HSTRING}
     */
    static SPCAT_APPLEXICONS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AppLexicons"

    /**
     * @type {HSTRING}
     */
    static SPCAT_PHONECONVERTERS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\PhoneConverters"

    /**
     * @type {HSTRING}
     */
    static SPCAT_TEXTNORMALIZERS => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\TextNormalizers"

    /**
     * @type {HSTRING}
     */
    static SPCAT_RECOPROFILES => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\RecoProfiles"

    /**
     * @type {HSTRING}
     */
    static SPMMSYS_AUDIO_IN_TOKEN_ID => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioInput\TokenEnums\MMAudioIn\"

    /**
     * @type {HSTRING}
     */
    static SPMMSYS_AUDIO_OUT_TOKEN_ID => "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\AudioOutput\TokenEnums\MMAudioOut\"

    /**
     * @type {HSTRING}
     */
    static SPCURRENT_USER_LEXICON_TOKEN_ID => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\CurrentUserLexicon"

    /**
     * @type {HSTRING}
     */
    static SPCURRENT_USER_SHORTCUT_TOKEN_ID => "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech\CurrentUserShortcut"

    /**
     * @type {HSTRING}
     */
    static SPTOKENVALUE_CLSID => "CLSID"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_FILES => "Files"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_UI => "UI"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_ATTRIBUTES => "Attributes"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_RETAINEDAUDIO => "SecondsPerRetainedAudioEvent"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_AUDIO_LATENCY_WARNING => "LatencyWarningThreshold"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_AUDIO_LATENCY_TRUNCATE => "LatencyTruncateThreshold"

    /**
     * @type {HSTRING}
     */
    static SPTOKENKEY_AUDIO_LATENCY_UPDATE_INTERVAL => "LatencyUpdateInterval"

    /**
     * @type {HSTRING}
     */
    static SPVOICECATEGORY_TTSRATE => "DefaultTTSRate"

    /**
     * @type {HSTRING}
     */
    static SPPROP_RESOURCE_USAGE => "ResourceUsage"

    /**
     * @type {HSTRING}
     */
    static SPPROP_HIGH_CONFIDENCE_THRESHOLD => "HighConfidenceThreshold"

    /**
     * @type {HSTRING}
     */
    static SPPROP_NORMAL_CONFIDENCE_THRESHOLD => "NormalConfidenceThreshold"

    /**
     * @type {HSTRING}
     */
    static SPPROP_LOW_CONFIDENCE_THRESHOLD => "LowConfidenceThreshold"

    /**
     * @type {HSTRING}
     */
    static SPPROP_RESPONSE_SPEED => "ResponseSpeed"

    /**
     * @type {HSTRING}
     */
    static SPPROP_COMPLEX_RESPONSE_SPEED => "ComplexResponseSpeed"

    /**
     * @type {HSTRING}
     */
    static SPPROP_ADAPTATION_ON => "AdaptationOn"

    /**
     * @type {HSTRING}
     */
    static SPPROP_PERSISTED_BACKGROUND_ADAPTATION => "PersistedBackgroundAdaptation"

    /**
     * @type {HSTRING}
     */
    static SPPROP_PERSISTED_LANGUAGE_MODEL_ADAPTATION => "PersistedLanguageModelAdaptation"

    /**
     * @type {HSTRING}
     */
    static SPPROP_UX_IS_LISTENING => "UXIsListening"

    /**
     * @type {HSTRING}
     */
    static SPTOPIC_SPELLING => "Spelling"

    /**
     * @type {HSTRING}
     */
    static SPWILDCARD => "..."

    /**
     * @type {HSTRING}
     */
    static SPDICTATION => "*"

    /**
     * @type {HSTRING}
     */
    static SPINFDICTATION => "*+"

    /**
     * @type {HSTRING}
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
     * @type {HSTRING}
     */
    static SPRECOEXTENSION => "RecoExtension"

    /**
     * @type {HSTRING}
     */
    static SPALTERNATESCLSID => "AlternatesCLSID"

    /**
     * @type {HSTRING}
     */
    static SR_LOCALIZED_DESCRIPTION => "Description"

    /**
     * @type {Integer (UInt32)}
     */
    static SAPI_ERROR_BASE => 20480

    /**
     * @type {Float}
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
