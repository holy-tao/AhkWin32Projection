#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class Apo {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_ALREADY_INITIALIZED => -2005073919

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_NOT_INITIALIZED => -2005073918

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_FORMAT_NOT_SUPPORTED => -2005073917

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_APO_CLSID => -2005073916

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_BUFFERS_OVERLAP => -2005073915

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_ALREADY_UNLOCKED => -2005073914

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_NUM_CONNECTIONS_INVALID => -2005073913

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_OUTPUT_MAXFRAMECOUNT => -2005073912

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_CONNECTION_FORMAT => -2005073911

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_APO_LOCKED => -2005073910

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_COEFFCOUNT => -2005073909

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_COEFFICIENT => -2005073908

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_CURVE_PARAM => -2005073907

    /**
     * @type {Integer (Int32)}
     */
    static APOERR_INVALID_INPUTID => -2005073906

    /**
     * @type {Float}
     */
    static AUDIO_MIN_FRAMERATE => 10

    /**
     * @type {Float}
     */
    static AUDIO_MAX_FRAMERATE => 384000

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_MIN_CHANNELS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_MAX_CHANNELS => 4096

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_Association {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 0
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_PreMixEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_PostMixEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_UserInterfaceClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_FriendlyName {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_StreamEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_ModeEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_EndpointEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_KeywordDetector_StreamEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_KeywordDetector_ModeEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_KeywordDetector_EndpointEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_Offload_StreamEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_Offload_ModeEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_StreamEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_ModeEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_EndpointEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_KeywordDetector_StreamEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_KeywordDetector_ModeEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_Offload_StreamEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 19
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CompositeFX_Offload_ModeEffectClsid {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 20
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_SupportAppLauncher {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 21
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_SupportedFormats {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 22
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_Enumerator {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 23
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_VersionMajor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 24
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_VersionMinor {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 25
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_Author {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 26
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_ObjectId {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 27
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_State {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 28
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_EffectPackSchema_Version {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 29
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_ApplyToBluetooth {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 30
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_ApplyToUsb {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 31
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_ApplyToRender {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_ApplyToCapture {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 33
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_RequestSetAsDefault {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 34
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_RequestSetAsDefaultPriority {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 35
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_FX_OEM_Preferred_EffectPack_Id {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 36
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SFX_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MFX_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_EFX_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_APO_SWFallback_ProcessingModes {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static PKEY_FX_EffectPack_Schema_V1 => Guid("{7abf23d9-727e-4d0b-86a3-dd501d260001}")

    /**
     * @type {Guid}
     */
    static SID_AudioProcessingObjectRTQueue => Guid("{458c1a1f-6899-4c12-99ac-e2e6ac253104}")

    /**
     * @type {Guid}
     */
    static SID_AudioProcessingObjectLoggingService => Guid("{8b8008af-09f9-456e-a173-bdb58499bce7}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_AudioEnvironment_SpatialAudioActive {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{4afb7b88-a653-44a5-99db-687fd74af0bb}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMEDIATYPE_EQUAL_FORMAT_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA => 8
;@endregion Constants

;@region Methods
;@endregion Methods
}
