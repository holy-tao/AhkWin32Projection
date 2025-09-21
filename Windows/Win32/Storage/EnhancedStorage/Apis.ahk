#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class EnhancedStorage {

;@region Constants

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_ENHANCED_STORAGE_SILO => "{3897f6a4-fd35-4bc8-a0b7-5dbba36adafa}"

    /**
     * @type {String}
     */
    static WPD_CATEGORY_ENHANCED_STORAGE => "{91248166-b832-4ad4-baa4-7ca0b6b2798c}"

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_NO_AUTHENTICATION_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_NOT_AUTHENTICATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_AUTHENTICATION_DENIED => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static ENHANCED_STORAGE_AUTHN_STATE_DEVICE_ERROR => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_EMPTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_ASCm => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_PCp => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_ASCh => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_HCh => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_TYPE_SIGNER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_BASIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_VALIDATION_POLICY_EXTENDED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_HASH_ALG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_ASYMMETRIC_KEY_CRYPTOGRAPHY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_SIGNATURE_ALG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_CERTIFICATE_SUPPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CAPABILITY_OPTIONAL_FEATURES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_MAX_CAPABILITY => 255

    /**
     * @type {String}
     */
    static CERT_RSA_1024_OID => "1.2.840.113549.1.1.1,1024"

    /**
     * @type {String}
     */
    static CERT_RSA_2048_OID => "1.2.840.113549.1.1.1,2048"

    /**
     * @type {String}
     */
    static CERT_RSA_3072_OID => "1.2.840.113549.1.1.1,3072"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA1_OID => "1.2.840.113549.1.1.10,1.3.14.3.2.26"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA256_OID => "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.1"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA384_OID => "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.2"

    /**
     * @type {String}
     */
    static CERT_RSASSA_PSS_SHA512_OID => "1.2.840.113549.1.1.10,2.16.840.1.101.3.4.2.3"

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_CHANNELCOUNT_MONO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_CHANNELCOUNT_STEREO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATOROPENWITHUIOPTION_HIDDEN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CREATOROPENWITHUIOPTION_VISIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_NONOWNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISDEFAULTSAVE_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_NOTAVAILABLEOFFLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_PARTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_COMPLETE_PINNED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_EXCLUDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOFFLINEAVAILABILITYSTATUS_FOLDER_EMPTY => 5

    /**
     * @type {Integer (Int32)}
     */
    static FLAGSTATUS_NOTFLAGGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLAGSTATUS_COMPLETED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLAGSTATUS_FOLLOWUP => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_LOW_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_LOW_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_LOW_MAX => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_NORMAL_MIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_NORMAL_SET => 3

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_NORMAL_MAX => 4

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_HIGH_MIN => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_HIGH_SET => 5

    /**
     * @type {Integer (Int32)}
     */
    static IMPORTANCE_HIGH_MAX => 5

    /**
     * @type {String}
     */
    static KIND_CALENDAR => "calendar"

    /**
     * @type {String}
     */
    static KIND_COMMUNICATION => "communication"

    /**
     * @type {String}
     */
    static KIND_CONTACT => "contact"

    /**
     * @type {String}
     */
    static KIND_DOCUMENT => "document"

    /**
     * @type {String}
     */
    static KIND_EMAIL => "email"

    /**
     * @type {String}
     */
    static KIND_FEED => "feed"

    /**
     * @type {String}
     */
    static KIND_FOLDER => "folder"

    /**
     * @type {String}
     */
    static KIND_GAME => "game"

    /**
     * @type {String}
     */
    static KIND_INSTANTMESSAGE => "instantmessage"

    /**
     * @type {String}
     */
    static KIND_JOURNAL => "journal"

    /**
     * @type {String}
     */
    static KIND_LINK => "link"

    /**
     * @type {String}
     */
    static KIND_MOVIE => "movie"

    /**
     * @type {String}
     */
    static KIND_MUSIC => "music"

    /**
     * @type {String}
     */
    static KIND_NOTE => "note"

    /**
     * @type {String}
     */
    static KIND_PICTURE => "picture"

    /**
     * @type {String}
     */
    static KIND_PLAYLIST => "playlist"

    /**
     * @type {String}
     */
    static KIND_PROGRAM => "program"

    /**
     * @type {String}
     */
    static KIND_RECORDEDTV => "recordedtv"

    /**
     * @type {String}
     */
    static KIND_SEARCHFOLDER => "searchfolder"

    /**
     * @type {String}
     */
    static KIND_TASK => "task"

    /**
     * @type {String}
     */
    static KIND_VIDEO => "video"

    /**
     * @type {String}
     */
    static KIND_WEBHISTORY => "webhistory"

    /**
     * @type {String}
     */
    static KIND_UNKNOWN => "unknown"

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEAVAILABILITY_NOT_AVAILABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEAVAILABILITY_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINEAVAILABILITY_ALWAYS_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_ONLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_FORCED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_SLOW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_ITEM_VERSION_CONFLICT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLINESTATUS_OFFLINE_SUSPENDED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_ONE_STAR_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_ONE_STAR_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_ONE_STAR_MAX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_TWO_STARS_MIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_TWO_STARS_SET => 25

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_TWO_STARS_MAX => 37

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_THREE_STARS_MIN => 38

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_THREE_STARS_SET => 50

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_THREE_STARS_MAX => 62

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FOUR_STARS_MIN => 63

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FOUR_STARS_SET => 75

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FOUR_STARS_MAX => 87

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FIVE_STARS_MIN => 88

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FIVE_STARS_SET => 99

    /**
     * @type {Integer (UInt32)}
     */
    static RATING_FIVE_STARS_MAX => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SHARINGSTATUS_NOTSHARED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHARINGSTATUS_SHARED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHARINGSTATUS_PRIVATE => 2

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_PRIVATE => "Private"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_SHARED => "Shared"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_PUBLIC => "Public"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_GROUP => "Group"

    /**
     * @type {String}
     */
    static STORAGE_PROVIDER_SHARE_STATUS_OWNER => "Owner"

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_NOTSHARED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_SHARED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PRIVATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_SHARED_OWNED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_SHARED_COOWNED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_OWNED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROVIDER_SHARINGSTATUS_PUBLIC_COOWNED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_ADDRESS_TYPE_PUBLIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_ADDRESS_TYPE_RANDOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_CACHE_MODE_CACHED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_CACHED_MODE_UNCACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_STOPPED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_PLAYING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_TRANSITIONING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_PAUSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_RECORDINGPAUSED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_RECORDING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PLAYBACKSTATE_NOMEDIA => 7

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_ALPHA => "alpha"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_BETA => "beta"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_GAMMA => "gamma"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFB_DELTA => "delta"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_ALPHA => "alpha"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_BETA => "beta"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_GAMMA => "gamma"

    /**
     * @type {String}
     */
    static LAYOUTPATTERN_CVMFS_DELTA => "delta"

    /**
     * @type {Integer (Int32)}
     */
    static LINK_STATUS_RESOLVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static LINK_STATUS_BROKEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_CONTRAST_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_CONTRAST_SOFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_CONTRAST_HARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_NORMAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_APERTURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_SHUTTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_CREATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_ACTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_PORTRAIT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_EXPOSUREPROGRAM_LANDSCAPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_WITHOUTSTROBE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_WITHSTROBE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_NORETURNLIGHT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_RETURNLIGHT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NONE_COMPULSORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NONE_AUTO => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_NORETURNLIGHT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_RETURNLIGHT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_NOFUNCTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_REDEYE => 65

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_REDEYE_NORETURNLIGHT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_REDEYE_RETURNLIGHT => 71

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_REDEYE => 73

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_NORETURNLIGHT => 77

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_COMPULSORY_REDEYE_RETURNLIGHT => 79

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_REDEYE => 89

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_REDEYE_NORETURNLIGHT => 93

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_FLASH_FLASH_AUTO_REDEYE_RETURNLIGHT => 95

    /**
     * @type {Integer (Double)}
     */
    static PHOTO_GAINCONTROL_NONE => 0

    /**
     * @type {Integer (Double)}
     */
    static PHOTO_GAINCONTROL_LOWGAINUP => 1

    /**
     * @type {Integer (Double)}
     */
    static PHOTO_GAINCONTROL_HIGHGAINUP => 2

    /**
     * @type {Integer (Double)}
     */
    static PHOTO_GAINCONTROL_LOWGAINDOWN => 3

    /**
     * @type {Integer (Double)}
     */
    static PHOTO_GAINCONTROL_HIGHGAINDOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_DAYLIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_FLUORESCENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_TUNGSTEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_STANDARD_A => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_STANDARD_B => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_STANDARD_C => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_D55 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_D65 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_LIGHTSOURCE_D75 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_NOTDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_NORMAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_APERTURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_SHUTTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_CREATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_ACTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_PORTRAIT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_PROGRAMMODE_LANDSCAPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SATURATION_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SATURATION_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SATURATION_HIGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SHARPNESS_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SHARPNESS_SOFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_SHARPNESS_HARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_WHITEBALANCE_AUTO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTO_WHITEBALANCE_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_FREQUENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_PINNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_RECENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HOMEGROUPING_RECOMMENDATIONS => 4

    /**
     * @type {String}
     */
    static SFGAOSTR_FILESYS => "filesys"

    /**
     * @type {String}
     */
    static SFGAOSTR_FILEANC => "fileanc"

    /**
     * @type {String}
     */
    static SFGAOSTR_STORAGEANC => "storageanc"

    /**
     * @type {String}
     */
    static SFGAOSTR_STREAM => "stream"

    /**
     * @type {String}
     */
    static SFGAOSTR_LINK => "link"

    /**
     * @type {String}
     */
    static SFGAOSTR_HIDDEN => "hidden"

    /**
     * @type {String}
     */
    static SFGAOSTR_SUPERHIDDEN => "superhidden"

    /**
     * @type {String}
     */
    static SFGAOSTR_FOLDER => "folder"

    /**
     * @type {String}
     */
    static SFGAOSTR_NONENUM => "nonenum"

    /**
     * @type {String}
     */
    static SFGAOSTR_BROWSABLE => "browsable"

    /**
     * @type {String}
     */
    static SFGAOSTR_SYSTEM => "system"

    /**
     * @type {String}
     */
    static SFGAOSTR_PLACEHOLDER => "placeholder"

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_SPARSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_IN_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PINNED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PENDING_UPLOAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PENDING_DOWNLOAD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_TRANSFERRING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_ERROR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_WARNING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_EXCLUDED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGEPROVIDERSTATE_PENDING_UNSPECIFIED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static APPUSERMODEL_STARTPINOPTION_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPUSERMODEL_STARTPINOPTION_NOPINONINSTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPUSERMODEL_STARTPINOPTION_USERPINNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_OTHER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_PROGRAMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_DEVICES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_FOLDERS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_WEBSERVICES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_HANDLERTYPE_COMPUTERS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_NOTSETUP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_SYNCNOTRUN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_IDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_STATE_SYNCING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_AUTHORIZE_ON_RESUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_AUTHORIZE_ON_SESSION_UNLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_UNAUTHORIZE_ON_SUSPEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACT_UNAUTHORIZE_ON_SESSION_LOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_COM_ERROR_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_COM_ERROR_END => 511

    /**
     * @type {Integer (UInt32)}
     */
    static ES_GENERAL_ERROR_START => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ES_GENERAL_ERROR_END => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static ES_AUTHN_ERROR_START => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ES_AUTHN_ERROR_END => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_ERROR_START => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_ERROR_END => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static ES_PW_SILO_ERROR_START => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static ES_PW_SILO_ERROR_END => 4607

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_SPECIFIC_ERROR_START => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static ES_RESERVED_SILO_SPECIFIC_ERROR_END => 49151

    /**
     * @type {Integer (UInt32)}
     */
    static ES_VENDOR_ERROR_START => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static ES_VENDOR_ERROR_END => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_ENHANCED_STORAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_RESPONSE => 3221488128

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_UNPROVISIONED_HARDWARE => 3221488132

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_UNSUPPORTED_HARDWARE => 3221488133

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INCOMPLETE_COMMAND => 3221488134

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_BAD_SEQUENCE => 3221488135

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_NO_PROBE => 3221488136

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_SILO => 3221488137

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_CAPABILITY => 3221488138

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_GROUP_POLICY_FORBIDDEN_USE => 3221488139

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_GROUP_POLICY_FORBIDDEN_OPERATION => 3221488140

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_PARAM_COMBINATION => 3221488141

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_PARAM_LENGTH => 3221488142

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INCONSISTENT_PARAM_LENGTH => 3221488143

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_NO_AUTHENTICATION_REQUIRED => 3221488640

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_INVALID_FIELD_IDENTIFIER => 3221491968

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_CHALLENGE_MISMATCH => 3221491969

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_CHALLENGE_SIZE_MISMATCH => 3221491970

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_FRIENDLY_NAME_TOO_LONG => 3221491971

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_SILO_NAME_TOO_LONG => 3221491972

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_PASSWORD_TOO_LONG => 3221491973

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_PASSWORD_HINT_TOO_LONG => 3221491974

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_OTHER_SECURITY_PROTOCOL_ACTIVE => 3221491975

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_DEVICE_DIGEST_MISSING => 3221491976

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_NOT_AUTHORIZED_UNEXPECTED => 3221491977

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_AUTHORIZED_UNEXPECTED => 3221491978

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_PROVISIONED_UNEXPECTED => 3221491979

    /**
     * @type {Integer (UInt32)}
     */
    static ES_E_UNKNOWN_DIGEST_ALGORITHM => 3221491980
;@endregion Constants

;@region Methods
;@endregion Methods
}
