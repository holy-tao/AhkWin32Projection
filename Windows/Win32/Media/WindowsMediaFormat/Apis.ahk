#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriter.ahk
#Include .\IWMReader.ahk
#Include .\IWMSyncReader.ahk
#Include .\IWMMetadataEditor.ahk
#Include .\IWMIndexer.ahk
#Include .\IWMLicenseBackup.ahk
#Include .\IWMProfileManager.ahk
#Include .\IWMWriterFileSink.ahk
#Include .\IWMWriterNetworkSink.ahk
#Include .\IWMWriterPushSink.ahk
#Include ..\..\System\WinRT\Apis.ahk
#Include ..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WindowsMediaFormat {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_INPUT_FRAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_USES_CURRENT_INPUT_FRAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_USES_PREVIOUS_INPUT_FRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_MOTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_ROTATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_BLENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING => 8

    /**
     * @type {Integer (Int32)}
     */
    static WMT_VIDEOIMAGE_INTEGER_DENOMINATOR => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_MAGIC_NUMBER => 491406834

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_MAGIC_NUMBER_2 => 491406835

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_BOW_TIE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_CIRCLE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_CROSS_FADE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_DIAGONAL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_DIAMOND => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_FADE_TO_COLOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_FILLED_V => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_FLIP => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_INSET => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_IRIS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_PAGE_ROLL => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_RECTANGLE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_REVEAL => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_SLIDE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_SPLIT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_STAR => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WMT_VIDEOIMAGE_TRANSITION_WHEEL => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WM_SampleExtension_ContentType_Size => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WM_SampleExtension_PixelAspectRatio_Size => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WM_SampleExtension_Timecode_Size => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WM_SampleExtension_SampleDuration_Size => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WM_SampleExtension_ChromaLocation_Size => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WM_SampleExtension_ColorSpaceInfo_Size => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CT_REPEAT_FIRST_FIELD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CT_BOTTOM_FIELD_FIRST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CT_TOP_FIELD_FIRST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CT_INTERLACED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CL_INTERLACED420 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CL_PROGRESSIVE420 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WM_MAX_VIDEO_STREAMS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static WM_MAX_STREAMS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static WMDRM_IMPORT_INIT_STRUCT_DEFINED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_OPL_TYPES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static g_dwWMSpecialAttributes => 20

    /**
     * @type {HSTRING}
     */
    static g_wszWMDuration => "Duration"

    /**
     * @type {HSTRING}
     */
    static g_wszWMBitrate => "Bitrate"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSeekable => "Seekable"

    /**
     * @type {HSTRING}
     */
    static g_wszWMStridable => "Stridable"

    /**
     * @type {HSTRING}
     */
    static g_wszWMBroadcast => "Broadcast"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProtected => "Is_Protected"

    /**
     * @type {HSTRING}
     */
    static g_wszWMTrusted => "Is_Trusted"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSignature_Name => "Signature_Name"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasAudio => "HasAudio"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasImage => "HasImage"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasScript => "HasScript"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasVideo => "HasVideo"

    /**
     * @type {HSTRING}
     */
    static g_wszWMCurrentBitrate => "CurrentBitrate"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOptimalBitrate => "OptimalBitrate"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasAttachedImages => "HasAttachedImages"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSkipBackward => "Can_Skip_Backward"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSkipForward => "Can_Skip_Forward"

    /**
     * @type {HSTRING}
     */
    static g_wszWMNumberOfFrames => "NumberOfFrames"

    /**
     * @type {HSTRING}
     */
    static g_wszWMFileSize => "FileSize"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasArbitraryDataStream => "HasArbitraryDataStream"

    /**
     * @type {HSTRING}
     */
    static g_wszWMHasFileTransferStream => "HasFileTransferStream"

    /**
     * @type {HSTRING}
     */
    static g_wszWMContainerFormat => "WM/ContainerFormat"

    /**
     * @type {Integer (UInt32)}
     */
    static g_dwWMContentAttributes => 5

    /**
     * @type {HSTRING}
     */
    static g_wszWMTitle => "Title"

    /**
     * @type {HSTRING}
     */
    static g_wszWMTitleSort => "TitleSort"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAuthor => "Author"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAuthorSort => "AuthorSort"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDescription => "Description"

    /**
     * @type {HSTRING}
     */
    static g_wszWMRating => "Rating"

    /**
     * @type {HSTRING}
     */
    static g_wszWMCopyright => "Copyright"

    /**
     * @type {HSTRING}
     */
    static g_wszWMUse_DRM => "Use_DRM"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_Flags => "DRM_Flags"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_Level => "DRM_Level"

    /**
     * @type {HSTRING}
     */
    static g_wszWMUse_Advanced_DRM => "Use_Advanced_DRM"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_KeySeed => "DRM_KeySeed"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_KeyID => "DRM_KeyID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_ContentID => "DRM_ContentID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_SourceID => "DRM_SourceID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_IndividualizedVersion => "DRM_IndividualizedVersion"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_LicenseAcqURL => "DRM_LicenseAcqURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_V1LicenseAcqURL => "DRM_V1LicenseAcqURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_HeaderSignPrivKey => "DRM_HeaderSignPrivKey"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_LASignaturePrivKey => "DRM_LASignaturePrivKey"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_LASignatureCert => "DRM_LASignatureCert"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_LASignatureLicSrvCert => "DRM_LASignatureLicSrvCert"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM_LASignatureRootCert => "DRM_LASignatureRootCert"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAlbumTitle => "WM/AlbumTitle"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAlbumTitleSort => "WM/AlbumTitleSort"

    /**
     * @type {HSTRING}
     */
    static g_wszWMTrack => "WM/Track"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPromotionURL => "WM/PromotionURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAlbumCoverURL => "WM/AlbumCoverURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMGenre => "WM/Genre"

    /**
     * @type {HSTRING}
     */
    static g_wszWMYear => "WM/Year"

    /**
     * @type {HSTRING}
     */
    static g_wszWMGenreID => "WM/GenreID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMCDI => "WM/MCDI"

    /**
     * @type {HSTRING}
     */
    static g_wszWMComposer => "WM/Composer"

    /**
     * @type {HSTRING}
     */
    static g_wszWMComposerSort => "WM/ComposerSort"

    /**
     * @type {HSTRING}
     */
    static g_wszWMLyrics => "WM/Lyrics"

    /**
     * @type {HSTRING}
     */
    static g_wszWMTrackNumber => "WM/TrackNumber"

    /**
     * @type {HSTRING}
     */
    static g_wszWMToolName => "WM/ToolName"

    /**
     * @type {HSTRING}
     */
    static g_wszWMToolVersion => "WM/ToolVersion"

    /**
     * @type {HSTRING}
     */
    static g_wszWMIsVBR => "IsVBR"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAlbumArtist => "WM/AlbumArtist"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAlbumArtistSort => "WM/AlbumArtistSort"

    /**
     * @type {HSTRING}
     */
    static g_wszWMBannerImageType => "BannerImageType"

    /**
     * @type {HSTRING}
     */
    static g_wszWMBannerImageData => "BannerImageData"

    /**
     * @type {HSTRING}
     */
    static g_wszWMBannerImageURL => "BannerImageURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMCopyrightURL => "CopyrightURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAspectRatioX => "AspectRatioX"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAspectRatioY => "AspectRatioY"

    /**
     * @type {HSTRING}
     */
    static g_wszASFLeakyBucketPairs => "ASFLeakyBucketPairs"

    /**
     * @type {Integer (UInt32)}
     */
    static g_dwWMNSCAttributes => 5

    /**
     * @type {HSTRING}
     */
    static g_wszWMNSCName => "NSC_Name"

    /**
     * @type {HSTRING}
     */
    static g_wszWMNSCAddress => "NSC_Address"

    /**
     * @type {HSTRING}
     */
    static g_wszWMNSCPhone => "NSC_Phone"

    /**
     * @type {HSTRING}
     */
    static g_wszWMNSCEmail => "NSC_Email"

    /**
     * @type {HSTRING}
     */
    static g_wszWMNSCDescription => "NSC_Description"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWriter => "WM/Writer"

    /**
     * @type {HSTRING}
     */
    static g_wszWMConductor => "WM/Conductor"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProducer => "WM/Producer"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDirector => "WM/Director"

    /**
     * @type {HSTRING}
     */
    static g_wszWMContentGroupDescription => "WM/ContentGroupDescription"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSubTitle => "WM/SubTitle"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPartOfSet => "WM/PartOfSet"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProtectionType => "WM/ProtectionType"

    /**
     * @type {HSTRING}
     */
    static g_wszWMVideoHeight => "WM/VideoHeight"

    /**
     * @type {HSTRING}
     */
    static g_wszWMVideoWidth => "WM/VideoWidth"

    /**
     * @type {HSTRING}
     */
    static g_wszWMVideoFrameRate => "WM/VideoFrameRate"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaClassPrimaryID => "WM/MediaClassPrimaryID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaClassSecondaryID => "WM/MediaClassSecondaryID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPeriod => "WM/Period"

    /**
     * @type {HSTRING}
     */
    static g_wszWMCategory => "WM/Category"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPicture => "WM/Picture"

    /**
     * @type {HSTRING}
     */
    static g_wszWMLyrics_Synchronised => "WM/Lyrics_Synchronised"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOriginalLyricist => "WM/OriginalLyricist"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOriginalArtist => "WM/OriginalArtist"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOriginalAlbumTitle => "WM/OriginalAlbumTitle"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOriginalReleaseYear => "WM/OriginalReleaseYear"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOriginalFilename => "WM/OriginalFilename"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPublisher => "WM/Publisher"

    /**
     * @type {HSTRING}
     */
    static g_wszWMEncodedBy => "WM/EncodedBy"

    /**
     * @type {HSTRING}
     */
    static g_wszWMEncodingSettings => "WM/EncodingSettings"

    /**
     * @type {HSTRING}
     */
    static g_wszWMEncodingTime => "WM/EncodingTime"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAuthorURL => "WM/AuthorURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMUserWebURL => "WM/UserWebURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAudioFileURL => "WM/AudioFileURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMAudioSourceURL => "WM/AudioSourceURL"

    /**
     * @type {HSTRING}
     */
    static g_wszWMLanguage => "WM/Language"

    /**
     * @type {HSTRING}
     */
    static g_wszWMParentalRating => "WM/ParentalRating"

    /**
     * @type {HSTRING}
     */
    static g_wszWMBeatsPerMinute => "WM/BeatsPerMinute"

    /**
     * @type {HSTRING}
     */
    static g_wszWMInitialKey => "WM/InitialKey"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMood => "WM/Mood"

    /**
     * @type {HSTRING}
     */
    static g_wszWMText => "WM/Text"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDVDID => "WM/DVDID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMContentID => "WM/WMContentID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMCollectionID => "WM/WMCollectionID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMCollectionGroupID => "WM/WMCollectionGroupID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMUniqueFileIdentifier => "WM/UniqueFileIdentifier"

    /**
     * @type {HSTRING}
     */
    static g_wszWMModifiedBy => "WM/ModifiedBy"

    /**
     * @type {HSTRING}
     */
    static g_wszWMRadioStationName => "WM/RadioStationName"

    /**
     * @type {HSTRING}
     */
    static g_wszWMRadioStationOwner => "WM/RadioStationOwner"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPlaylistDelay => "WM/PlaylistDelay"

    /**
     * @type {HSTRING}
     */
    static g_wszWMCodec => "WM/Codec"

    /**
     * @type {HSTRING}
     */
    static g_wszWMDRM => "WM/DRM"

    /**
     * @type {HSTRING}
     */
    static g_wszWMISRC => "WM/ISRC"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProvider => "WM/Provider"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProviderRating => "WM/ProviderRating"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProviderStyle => "WM/ProviderStyle"

    /**
     * @type {HSTRING}
     */
    static g_wszWMContentDistributor => "WM/ContentDistributor"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSubscriptionContentID => "WM/SubscriptionContentID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMADRCPeakReference => "WM/WMADRCPeakReference"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMADRCPeakTarget => "WM/WMADRCPeakTarget"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMADRCAverageReference => "WM/WMADRCAverageReference"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMADRCAverageTarget => "WM/WMADRCAverageTarget"

    /**
     * @type {HSTRING}
     */
    static g_wszWMStreamTypeInfo => "WM/StreamTypeInfo"

    /**
     * @type {HSTRING}
     */
    static g_wszWMPeakBitrate => "WM/PeakBitrate"

    /**
     * @type {HSTRING}
     */
    static g_wszWMASFPacketCount => "WM/ASFPacketCount"

    /**
     * @type {HSTRING}
     */
    static g_wszWMASFSecurityObjectsSize => "WM/ASFSecurityObjectsSize"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSharedUserRating => "WM/SharedUserRating"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSubTitleDescription => "WM/SubTitleDescription"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaCredits => "WM/MediaCredits"

    /**
     * @type {HSTRING}
     */
    static g_wszWMParentalRatingReason => "WM/ParentalRatingReason"

    /**
     * @type {HSTRING}
     */
    static g_wszWMOriginalReleaseTime => "WM/OriginalReleaseTime"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaStationCallSign => "WM/MediaStationCallSign"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaStationName => "WM/MediaStationName"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaNetworkAffiliation => "WM/MediaNetworkAffiliation"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaOriginalChannel => "WM/MediaOriginalChannel"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaOriginalBroadcastDateTime => "WM/MediaOriginalBroadcastDateTime"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsStereo => "WM/MediaIsStereo"

    /**
     * @type {HSTRING}
     */
    static g_wszWMVideoClosedCaptioning => "WM/VideoClosedCaptioning"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsRepeat => "WM/MediaIsRepeat"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsLive => "WM/MediaIsLive"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsTape => "WM/MediaIsTape"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsDelay => "WM/MediaIsDelay"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsSubtitled => "WM/MediaIsSubtitled"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsPremiere => "WM/MediaIsPremiere"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsFinale => "WM/MediaIsFinale"

    /**
     * @type {HSTRING}
     */
    static g_wszWMMediaIsSAP => "WM/MediaIsSAP"

    /**
     * @type {HSTRING}
     */
    static g_wszWMProviderCopyright => "WM/ProviderCopyright"

    /**
     * @type {HSTRING}
     */
    static g_wszWMISAN => "WM/ISAN"

    /**
     * @type {HSTRING}
     */
    static g_wszWMADID => "WM/ADID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMShadowFileSourceFileType => "WM/WMShadowFileSourceFileType"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMShadowFileSourceDRMType => "WM/WMShadowFileSourceDRMType"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMCPDistributor => "WM/WMCPDistributor"

    /**
     * @type {HSTRING}
     */
    static g_wszWMWMCPDistributorID => "WM/WMCPDistributorID"

    /**
     * @type {HSTRING}
     */
    static g_wszWMSeasonNumber => "WM/SeasonNumber"

    /**
     * @type {HSTRING}
     */
    static g_wszWMEpisodeNumber => "WM/EpisodeNumber"

    /**
     * @type {HSTRING}
     */
    static g_wszEarlyDataDelivery => "EarlyDataDelivery"

    /**
     * @type {HSTRING}
     */
    static g_wszJustInTimeDecode => "JustInTimeDecode"

    /**
     * @type {HSTRING}
     */
    static g_wszSingleOutputBuffer => "SingleOutputBuffer"

    /**
     * @type {HSTRING}
     */
    static g_wszSoftwareScaling => "SoftwareScaling"

    /**
     * @type {HSTRING}
     */
    static g_wszDeliverOnReceive => "DeliverOnReceive"

    /**
     * @type {HSTRING}
     */
    static g_wszScrambledAudio => "ScrambledAudio"

    /**
     * @type {HSTRING}
     */
    static g_wszDedicatedDeliveryThread => "DedicatedDeliveryThread"

    /**
     * @type {HSTRING}
     */
    static g_wszEnableDiscreteOutput => "EnableDiscreteOutput"

    /**
     * @type {HSTRING}
     */
    static g_wszSpeakerConfig => "SpeakerConfig"

    /**
     * @type {HSTRING}
     */
    static g_wszDynamicRangeControl => "DynamicRangeControl"

    /**
     * @type {HSTRING}
     */
    static g_wszAllowInterlacedOutput => "AllowInterlacedOutput"

    /**
     * @type {HSTRING}
     */
    static g_wszVideoSampleDurations => "VideoSampleDurations"

    /**
     * @type {HSTRING}
     */
    static g_wszStreamLanguage => "StreamLanguage"

    /**
     * @type {HSTRING}
     */
    static g_wszEnableWMAProSPDIFOutput => "EnableWMAProSPDIFOutput"

    /**
     * @type {HSTRING}
     */
    static g_wszDeinterlaceMode => "DeinterlaceMode"

    /**
     * @type {HSTRING}
     */
    static g_wszInitialPatternForInverseTelecine => "InitialPatternForInverseTelecine"

    /**
     * @type {HSTRING}
     */
    static g_wszJPEGCompressionQuality => "JPEGCompressionQuality"

    /**
     * @type {HSTRING}
     */
    static g_wszWatermarkCLSID => "WatermarkCLSID"

    /**
     * @type {HSTRING}
     */
    static g_wszWatermarkConfig => "WatermarkConfig"

    /**
     * @type {HSTRING}
     */
    static g_wszInterlacedCoding => "InterlacedCoding"

    /**
     * @type {HSTRING}
     */
    static g_wszFixedFrameRate => "FixedFrameRate"

    /**
     * @type {HSTRING}
     */
    static g_wszOriginalSourceFormatTag => "_SOURCEFORMATTAG"

    /**
     * @type {HSTRING}
     */
    static g_wszOriginalWaveFormat => "_ORIGINALWAVEFORMAT"

    /**
     * @type {HSTRING}
     */
    static g_wszEDL => "_EDL"

    /**
     * @type {HSTRING}
     */
    static g_wszComplexity => "_COMPLEXITYEX"

    /**
     * @type {HSTRING}
     */
    static g_wszDecoderComplexityRequested => "_DECODERCOMPLEXITYPROFILE"

    /**
     * @type {HSTRING}
     */
    static g_wszReloadIndexOnSeek => "ReloadIndexOnSeek"

    /**
     * @type {HSTRING}
     */
    static g_wszStreamNumIndexObjects => "StreamNumIndexObjects"

    /**
     * @type {HSTRING}
     */
    static g_wszFailSeekOnError => "FailSeekOnError"

    /**
     * @type {HSTRING}
     */
    static g_wszPermitSeeksBeyondEndOfStream => "PermitSeeksBeyondEndOfStream"

    /**
     * @type {HSTRING}
     */
    static g_wszUsePacketAtSeekPoint => "UsePacketAtSeekPoint"

    /**
     * @type {HSTRING}
     */
    static g_wszSourceBufferTime => "SourceBufferTime"

    /**
     * @type {HSTRING}
     */
    static g_wszSourceMaxBytesAtOnce => "SourceMaxBytesAtOnce"

    /**
     * @type {HSTRING}
     */
    static g_wszVBREnabled => "_VBRENABLED"

    /**
     * @type {HSTRING}
     */
    static g_wszVBRQuality => "_VBRQUALITY"

    /**
     * @type {HSTRING}
     */
    static g_wszVBRBitrateMax => "_RMAX"

    /**
     * @type {HSTRING}
     */
    static g_wszVBRBufferWindowMax => "_BMAX"

    /**
     * @type {HSTRING}
     */
    static g_wszVBRPeak => "VBR Peak"

    /**
     * @type {HSTRING}
     */
    static g_wszBufferAverage => "Buffer Average"

    /**
     * @type {HSTRING}
     */
    static g_wszComplexityMax => "_COMPLEXITYEXMAX"

    /**
     * @type {HSTRING}
     */
    static g_wszComplexityOffline => "_COMPLEXITYEXOFFLINE"

    /**
     * @type {HSTRING}
     */
    static g_wszComplexityLive => "_COMPLEXITYEXLIVE"

    /**
     * @type {HSTRING}
     */
    static g_wszIsVBRSupported => "_ISVBRSUPPORTED"

    /**
     * @type {HSTRING}
     */
    static g_wszNumPasses => "_PASSESUSED"

    /**
     * @type {HSTRING}
     */
    static g_wszMusicSpeechClassMode => "MusicSpeechClassMode"

    /**
     * @type {HSTRING}
     */
    static g_wszMusicClassMode => "MusicClassMode"

    /**
     * @type {HSTRING}
     */
    static g_wszSpeechClassMode => "SpeechClassMode"

    /**
     * @type {HSTRING}
     */
    static g_wszMixedClassMode => "MixedClassMode"

    /**
     * @type {HSTRING}
     */
    static g_wszSpeechCaps => "SpeechFormatCap"

    /**
     * @type {HSTRING}
     */
    static g_wszPeakValue => "PeakValue"

    /**
     * @type {HSTRING}
     */
    static g_wszAverageLevel => "AverageLevel"

    /**
     * @type {HSTRING}
     */
    static g_wszFold6To2Channels3 => "Fold6To2Channels3"

    /**
     * @type {HSTRING}
     */
    static g_wszFoldToChannelsTemplate => "Fold%luTo%luChannels%lu"

    /**
     * @type {HSTRING}
     */
    static g_wszDeviceConformanceTemplate => "DeviceConformanceTemplate"

    /**
     * @type {HSTRING}
     */
    static g_wszEnableFrameInterpolation => "EnableFrameInterpolation"

    /**
     * @type {HSTRING}
     */
    static g_wszNeedsPreviousSample => "NeedsPreviousSample"

    /**
     * @type {HSTRING}
     */
    static g_wszWMIsCompilation => "WM/IsCompilation"

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_Base => Guid("{00000000-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIATYPE_Video => Guid("{73646976-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB1 => Guid("{e436eb78-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB4 => Guid("{e436eb79-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB8 => Guid("{e436eb7a-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB565 => Guid("{e436eb7b-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB555 => Guid("{e436eb7c-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB24 => Guid("{e436eb7d-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_RGB32 => Guid("{e436eb7e-524f-11ce-9f53-0020af0ba770}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_I420 => Guid("{30323449-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_IYUV => Guid("{56555949-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_YV12 => Guid("{32315659-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_YUY2 => Guid("{32595559-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_P422 => Guid("{32323450-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_UYVY => Guid("{59565955-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_YVYU => Guid("{55595659-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_YVU9 => Guid("{39555659-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_VIDEOIMAGE => Guid("{1d4a45f2-e5f6-4b44-8388-f0ae5c0e0c37}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_MP43 => Guid("{3334504d-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_MP4S => Guid("{5334504d-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_M4S2 => Guid("{3253344d-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMV1 => Guid("{31564d57-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMV2 => Guid("{32564d57-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_MSS1 => Guid("{3153534d-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_MPEG2_VIDEO => Guid("{e06d8026-db46-11cf-b4d1-00805f6cbbea}")

    /**
     * @type {Guid}
     */
    static WMMEDIATYPE_Audio => Guid("{73647561-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_PCM => Guid("{00000001-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_DRM => Guid("{00000009-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMAudioV9 => Guid("{00000162-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMAudio_Lossless => Guid("{00000163-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_MSS2 => Guid("{3253534d-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMSP1 => Guid("{0000000a-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMSP2 => Guid("{0000000b-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMV3 => Guid("{33564d57-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMVP => Guid("{50564d57-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WVP2 => Guid("{32505657-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMVA => Guid("{41564d57-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WVC1 => Guid("{31435657-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMAudioV8 => Guid("{00000161-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMAudioV7 => Guid("{00000161-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WMAudioV2 => Guid("{00000161-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_ACELPnet => Guid("{00000130-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_MP3 => Guid("{00000055-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIASUBTYPE_WebStream => Guid("{776257d4-c627-41cb-8f81-7ac7ff1c40cc}")

    /**
     * @type {Guid}
     */
    static WMMEDIATYPE_Script => Guid("{73636d64-0000-0010-8000-00aa00389b71}")

    /**
     * @type {Guid}
     */
    static WMMEDIATYPE_Image => Guid("{34a50fd8-8aa5-4386-81fe-a0efe0488e31}")

    /**
     * @type {Guid}
     */
    static WMMEDIATYPE_FileTransfer => Guid("{d9e47579-930e-4427-adfc-ad80f290e470}")

    /**
     * @type {Guid}
     */
    static WMMEDIATYPE_Text => Guid("{9bba1ea7-5ab2-4829-ba57-0940209bcf3e}")

    /**
     * @type {Guid}
     */
    static WMFORMAT_VideoInfo => Guid("{05589f80-c356-11ce-bf01-00aa0055595a}")

    /**
     * @type {Guid}
     */
    static WMFORMAT_MPEG2Video => Guid("{e06d80e3-db46-11cf-b4d1-00805f6cbbea}")

    /**
     * @type {Guid}
     */
    static WMFORMAT_WaveFormatEx => Guid("{05589f81-c356-11ce-bf01-00aa0055595a}")

    /**
     * @type {Guid}
     */
    static WMFORMAT_Script => Guid("{5c8510f2-debe-4ca7-bba5-f07a104f8dff}")

    /**
     * @type {Guid}
     */
    static WMFORMAT_WebStream => Guid("{da1e6b13-8359-4050-b398-388e965bf00c}")

    /**
     * @type {Guid}
     */
    static WMSCRIPTTYPE_TwoStrings => Guid("{82f38a70-c29f-11d1-97ad-00a0c95ea850}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_OutputCleanPoint => Guid("{f72a3c6f-6eb4-4ebc-b192-09ad9759e828}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_Timecode => Guid("{399595ec-8667-4e2d-8fdb-98814ce76c1e}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_ChromaLocation => Guid("{4c5acca0-9276-4b2c-9e4c-a0edefdd217e}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_ColorSpaceInfo => Guid("{f79ada56-30eb-4f2b-9f7a-f24b139a1157}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_UserDataInfo => Guid("{732bb4fa-78be-4549-99bd-02db1a55b7a8}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_FileName => Guid("{e165ec0e-19ed-45d7-b4a7-25cbd1e28e9b}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_ContentType => Guid("{d590dc20-07bc-436c-9cf7-f3bbfbf1a4dc}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_PixelAspectRatio => Guid("{1b1ee554-f9ea-4bc8-821a-376b74e4c4b8}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_SampleDuration => Guid("{c6bd9450-867f-4907-83a3-c77921b733ad}")

    /**
     * @type {Guid}
     */
    static WM_SampleExtensionGUID_SampleProtectionSalt => Guid("{5403deee-b9ee-438f-aa83-3804997e569d}")

    /**
     * @type {Guid}
     */
    static CLSID_WMMUTEX_Language => Guid("{d6e22a00-35da-11d1-9034-00a0c90349be}")

    /**
     * @type {Guid}
     */
    static CLSID_WMMUTEX_Bitrate => Guid("{d6e22a01-35da-11d1-9034-00a0c90349be}")

    /**
     * @type {Guid}
     */
    static CLSID_WMMUTEX_Presentation => Guid("{d6e22a02-35da-11d1-9034-00a0c90349be}")

    /**
     * @type {Guid}
     */
    static CLSID_WMMUTEX_Unknown => Guid("{d6e22a03-35da-11d1-9034-00a0c90349be}")

    /**
     * @type {Guid}
     */
    static CLSID_WMBandwidthSharing_Exclusive => Guid("{af6060aa-5197-11d2-b6af-00c04fd908e9}")

    /**
     * @type {Guid}
     */
    static CLSID_WMBandwidthSharing_Partial => Guid("{af6060ab-5197-11d2-b6af-00c04fd908e9}")

    /**
     * @type {Guid}
     */
    static WMT_DMOCATEGORY_AUDIO_WATERMARK => Guid("{65221c5a-fa75-4b39-b50c-06c336b6a3ef}")

    /**
     * @type {Guid}
     */
    static WMT_DMOCATEGORY_VIDEO_WATERMARK => Guid("{187cc922-8efc-4404-9daf-63f4830df1bc}")

    /**
     * @type {Guid}
     */
    static CLSID_ClientNetManager => Guid("{cd12a3ce-9c42-11d2-beed-0060082f2054}")
;@endregion Constants

;@region Methods
    /**
     * The WMIsContentProtected function checks a file for DRM-protected content. This function is a shortcut so that your application can quickly identify protected files.
     * @param {PWSTR} pwszFileName Pointer to a wide-character <b>null</b>-terminated string containing the name of the file to check for DRM-protected content.
     * @param {Pointer<BOOL>} pfIsProtected Pointer to a Boolean value that is set to True on function return if the file contains DRM-protected content.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The content is unprotected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmiscontentprotected
     * @since windows5.0
     */
    static WMIsContentProtected(pwszFileName, pfIsProtected) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        pfIsProtectedMarshal := pfIsProtected is VarRef ? "int*" : "ptr"

        result := DllCall("WMVCore.dll\WMIsContentProtected", "ptr", pwszFileName, pfIsProtectedMarshal, pfIsProtected, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The WMCreateWriter function creates a writer object.
     * @param {IUnknown} pUnkCert Pointer to an <b>IUnknown</b> interface. This value is not used and should be set to <b>NULL</b>.
     * @returns {IWMWriter} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriter">IWMWriter</a> interface of the newly created writer object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatewriter
     * @since windows5.0
     */
    static WMCreateWriter(pUnkCert) {
        result := DllCall("WMVCore.dll\WMCreateWriter", "ptr", pUnkCert, "ptr*", &ppWriter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMWriter(ppWriter)
    }

    /**
     * The WMCreateReader function creates a reader object.
     * @remarks
     * After this object has been created, you can modify the rights that will be requested for the next file opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-setdrmproperty">IWMDRMReader::SetDRMProperty</a> with the <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-rights">DRM_Rights</a> property. Note that when using this property, the rights are specified as strings, not as <b>DWORD</b> values.
     * 
     * The <i>dwRights</i> parameter may be set to 0 when reading non-DRM content. If <i>dwRights</i> is set to 0 and you open a protected file, you can access license related metadata, but you cannot read data from any streams in the file.
     * @param {IUnknown} pUnkCert This value must be set to <b>NULL</b>.
     * @param {Integer} dwRights <b>DWORD</b> indicating the desired operation. Set to one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_rights">WMT_RIGHTS</a> enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, <i>dwRights</i> must consist of multiple values from <b>WMT_RIGHTS</b> combined by using the bitwise <b>OR</b> operator.
     * @returns {IWMReader} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreader">IWMReader</a> interface of the newly created reader object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatereader
     * @since windows5.0
     */
    static WMCreateReader(pUnkCert, dwRights) {
        result := DllCall("WMVCore.dll\WMCreateReader", "ptr", pUnkCert, "uint", dwRights, "ptr*", &ppReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMReader(ppReader)
    }

    /**
     * The WMCreateSyncReader function creates a synchronous reader object.
     * @param {IUnknown} pUnkCert Pointer to an <b>IUnknown</b> interface. This value must be set to <b>NULL</b>.
     * @param {Integer} dwRights <b>DWORD</b> specifying the desired operation. When playing back non-DRM content, or for an application that does not have DRM rights, this value can be set to zero. Otherwise, this value must be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_rights">WMT_RIGHTS</a> enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, <b>dwRights</b> must consist of multiple values from <b>WMT_RIGHTS</b> combined by using the bitwise <b>OR</b> operator.
     * @returns {IWMSyncReader} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmsyncreader">IWMSyncReader</a> interface of the newly created synchronous reader object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatesyncreader
     * @since windows5.0
     */
    static WMCreateSyncReader(pUnkCert, dwRights) {
        result := DllCall("WMVCore.dll\WMCreateSyncReader", "ptr", pUnkCert, "uint", dwRights, "ptr*", &ppSyncReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMSyncReader(ppSyncReader)
    }

    /**
     * The WMCreateEditor function creates a metadata editor object.
     * @returns {IWMMetadataEditor} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmetadataeditor">IWMMetadataEditor</a> interface of the newly created metadata editor object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreateeditor
     * @since windows5.0
     */
    static WMCreateEditor() {
        result := DllCall("WMVCore.dll\WMCreateEditor", "ptr*", &ppEditor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMMetadataEditor(ppEditor)
    }

    /**
     * The WMCreateIndexer function creates an indexer object.
     * @returns {IWMIndexer} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmindexer">IWMIndexer</a> interface of the newly created indexer object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreateindexer
     * @since windows5.0
     */
    static WMCreateIndexer() {
        result := DllCall("WMVCore.dll\WMCreateIndexer", "ptr*", &ppIndexer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMIndexer(ppIndexer)
    }

    /**
     * The WMCreateBackupRestorer function creates a backup restorer object.
     * @remarks
     * Use <b>IWMLicenseBackup::QueryInterface</b> to obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops">IWMBackupRestoreProps</a> interface.
     * @param {IUnknown} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface containing the <b>OnStatus</b> callback method to be used by the new backup restorer object.
     * @returns {IWMLicenseBackup} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmlicensebackup">IWMLicenseBackup</a> interface of the newly created backup restorer object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatebackuprestorer
     * @since windows5.0
     */
    static WMCreateBackupRestorer(pCallback) {
        result := DllCall("WMVCore.dll\WMCreateBackupRestorer", "ptr", pCallback, "ptr*", &ppBackup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMLicenseBackup(ppBackup)
    }

    /**
     * The WMCreateProfileManager function creates a profile manager object.
     * @remarks
     * When a profile manager object is created, it parses all of the system profiles. Creating and releasing a profile manager every time you need to use it will adversely affect performance. You should create a profile manager once in your application and release it only when you no longer need to use it.
     * @returns {IWMProfileManager} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanager">IWMProfileManager</a> interface of the newly created profile manager object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreateprofilemanager
     * @since windows5.0
     */
    static WMCreateProfileManager() {
        result := DllCall("WMVCore.dll\WMCreateProfileManager", "ptr*", &ppProfileManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMProfileManager(ppProfileManager)
    }

    /**
     * The WMCreateWriterFileSink function creates a writer file sink object.
     * @returns {IWMWriterFileSink} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterfilesink">IWMWriterFileSink</a> interface of the newly created writer file sink object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatewriterfilesink
     * @since windows5.0
     */
    static WMCreateWriterFileSink() {
        result := DllCall("WMVCore.dll\WMCreateWriterFileSink", "ptr*", &ppSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMWriterFileSink(ppSink)
    }

    /**
     * The WMCreateWriterNetworkSink function creates a writer network sink object.
     * @returns {IWMWriterNetworkSink} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriternetworksink">IWMWriterNetworkSink</a> interface of the newly created writer network sink object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatewriternetworksink
     * @since windows5.0
     */
    static WMCreateWriterNetworkSink() {
        result := DllCall("WMVCore.dll\WMCreateWriterNetworkSink", "ptr*", &ppSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMWriterNetworkSink(ppSink)
    }

    /**
     * The WMCreateWriterPushSink function creates a writer push sink object. Push sinks are used to deliver streaming content to other media servers for distribution.
     * @returns {IWMWriterPushSink} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterpushsink">IWMWriterPushSink</a> interface of the newly created writer push sink object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-wmcreatewriterpushsink
     * @since windows5.0
     */
    static WMCreateWriterPushSink() {
        result := DllCall("WMVCore.dll\WMCreateWriterPushSink", "ptr*", &ppSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMWriterPushSink(ppSink)
    }

;@endregion Methods
}
