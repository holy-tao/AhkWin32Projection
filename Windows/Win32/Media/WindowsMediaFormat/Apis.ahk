#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {String}
     */
    static g_wszWMDuration => "Duration"

    /**
     * @type {String}
     */
    static g_wszWMBitrate => "Bitrate"

    /**
     * @type {String}
     */
    static g_wszWMSeekable => "Seekable"

    /**
     * @type {String}
     */
    static g_wszWMStridable => "Stridable"

    /**
     * @type {String}
     */
    static g_wszWMBroadcast => "Broadcast"

    /**
     * @type {String}
     */
    static g_wszWMProtected => "Is_Protected"

    /**
     * @type {String}
     */
    static g_wszWMTrusted => "Is_Trusted"

    /**
     * @type {String}
     */
    static g_wszWMSignature_Name => "Signature_Name"

    /**
     * @type {String}
     */
    static g_wszWMHasAudio => "HasAudio"

    /**
     * @type {String}
     */
    static g_wszWMHasImage => "HasImage"

    /**
     * @type {String}
     */
    static g_wszWMHasScript => "HasScript"

    /**
     * @type {String}
     */
    static g_wszWMHasVideo => "HasVideo"

    /**
     * @type {String}
     */
    static g_wszWMCurrentBitrate => "CurrentBitrate"

    /**
     * @type {String}
     */
    static g_wszWMOptimalBitrate => "OptimalBitrate"

    /**
     * @type {String}
     */
    static g_wszWMHasAttachedImages => "HasAttachedImages"

    /**
     * @type {String}
     */
    static g_wszWMSkipBackward => "Can_Skip_Backward"

    /**
     * @type {String}
     */
    static g_wszWMSkipForward => "Can_Skip_Forward"

    /**
     * @type {String}
     */
    static g_wszWMNumberOfFrames => "NumberOfFrames"

    /**
     * @type {String}
     */
    static g_wszWMFileSize => "FileSize"

    /**
     * @type {String}
     */
    static g_wszWMHasArbitraryDataStream => "HasArbitraryDataStream"

    /**
     * @type {String}
     */
    static g_wszWMHasFileTransferStream => "HasFileTransferStream"

    /**
     * @type {String}
     */
    static g_wszWMContainerFormat => "WM/ContainerFormat"

    /**
     * @type {Integer (UInt32)}
     */
    static g_dwWMContentAttributes => 5

    /**
     * @type {String}
     */
    static g_wszWMTitle => "Title"

    /**
     * @type {String}
     */
    static g_wszWMTitleSort => "TitleSort"

    /**
     * @type {String}
     */
    static g_wszWMAuthor => "Author"

    /**
     * @type {String}
     */
    static g_wszWMAuthorSort => "AuthorSort"

    /**
     * @type {String}
     */
    static g_wszWMDescription => "Description"

    /**
     * @type {String}
     */
    static g_wszWMRating => "Rating"

    /**
     * @type {String}
     */
    static g_wszWMCopyright => "Copyright"

    /**
     * @type {String}
     */
    static g_wszWMUse_DRM => "Use_DRM"

    /**
     * @type {String}
     */
    static g_wszWMDRM_Flags => "DRM_Flags"

    /**
     * @type {String}
     */
    static g_wszWMDRM_Level => "DRM_Level"

    /**
     * @type {String}
     */
    static g_wszWMUse_Advanced_DRM => "Use_Advanced_DRM"

    /**
     * @type {String}
     */
    static g_wszWMDRM_KeySeed => "DRM_KeySeed"

    /**
     * @type {String}
     */
    static g_wszWMDRM_KeyID => "DRM_KeyID"

    /**
     * @type {String}
     */
    static g_wszWMDRM_ContentID => "DRM_ContentID"

    /**
     * @type {String}
     */
    static g_wszWMDRM_SourceID => "DRM_SourceID"

    /**
     * @type {String}
     */
    static g_wszWMDRM_IndividualizedVersion => "DRM_IndividualizedVersion"

    /**
     * @type {String}
     */
    static g_wszWMDRM_LicenseAcqURL => "DRM_LicenseAcqURL"

    /**
     * @type {String}
     */
    static g_wszWMDRM_V1LicenseAcqURL => "DRM_V1LicenseAcqURL"

    /**
     * @type {String}
     */
    static g_wszWMDRM_HeaderSignPrivKey => "DRM_HeaderSignPrivKey"

    /**
     * @type {String}
     */
    static g_wszWMDRM_LASignaturePrivKey => "DRM_LASignaturePrivKey"

    /**
     * @type {String}
     */
    static g_wszWMDRM_LASignatureCert => "DRM_LASignatureCert"

    /**
     * @type {String}
     */
    static g_wszWMDRM_LASignatureLicSrvCert => "DRM_LASignatureLicSrvCert"

    /**
     * @type {String}
     */
    static g_wszWMDRM_LASignatureRootCert => "DRM_LASignatureRootCert"

    /**
     * @type {String}
     */
    static g_wszWMAlbumTitle => "WM/AlbumTitle"

    /**
     * @type {String}
     */
    static g_wszWMAlbumTitleSort => "WM/AlbumTitleSort"

    /**
     * @type {String}
     */
    static g_wszWMTrack => "WM/Track"

    /**
     * @type {String}
     */
    static g_wszWMPromotionURL => "WM/PromotionURL"

    /**
     * @type {String}
     */
    static g_wszWMAlbumCoverURL => "WM/AlbumCoverURL"

    /**
     * @type {String}
     */
    static g_wszWMGenre => "WM/Genre"

    /**
     * @type {String}
     */
    static g_wszWMYear => "WM/Year"

    /**
     * @type {String}
     */
    static g_wszWMGenreID => "WM/GenreID"

    /**
     * @type {String}
     */
    static g_wszWMMCDI => "WM/MCDI"

    /**
     * @type {String}
     */
    static g_wszWMComposer => "WM/Composer"

    /**
     * @type {String}
     */
    static g_wszWMComposerSort => "WM/ComposerSort"

    /**
     * @type {String}
     */
    static g_wszWMLyrics => "WM/Lyrics"

    /**
     * @type {String}
     */
    static g_wszWMTrackNumber => "WM/TrackNumber"

    /**
     * @type {String}
     */
    static g_wszWMToolName => "WM/ToolName"

    /**
     * @type {String}
     */
    static g_wszWMToolVersion => "WM/ToolVersion"

    /**
     * @type {String}
     */
    static g_wszWMIsVBR => "IsVBR"

    /**
     * @type {String}
     */
    static g_wszWMAlbumArtist => "WM/AlbumArtist"

    /**
     * @type {String}
     */
    static g_wszWMAlbumArtistSort => "WM/AlbumArtistSort"

    /**
     * @type {String}
     */
    static g_wszWMBannerImageType => "BannerImageType"

    /**
     * @type {String}
     */
    static g_wszWMBannerImageData => "BannerImageData"

    /**
     * @type {String}
     */
    static g_wszWMBannerImageURL => "BannerImageURL"

    /**
     * @type {String}
     */
    static g_wszWMCopyrightURL => "CopyrightURL"

    /**
     * @type {String}
     */
    static g_wszWMAspectRatioX => "AspectRatioX"

    /**
     * @type {String}
     */
    static g_wszWMAspectRatioY => "AspectRatioY"

    /**
     * @type {String}
     */
    static g_wszASFLeakyBucketPairs => "ASFLeakyBucketPairs"

    /**
     * @type {Integer (UInt32)}
     */
    static g_dwWMNSCAttributes => 5

    /**
     * @type {String}
     */
    static g_wszWMNSCName => "NSC_Name"

    /**
     * @type {String}
     */
    static g_wszWMNSCAddress => "NSC_Address"

    /**
     * @type {String}
     */
    static g_wszWMNSCPhone => "NSC_Phone"

    /**
     * @type {String}
     */
    static g_wszWMNSCEmail => "NSC_Email"

    /**
     * @type {String}
     */
    static g_wszWMNSCDescription => "NSC_Description"

    /**
     * @type {String}
     */
    static g_wszWMWriter => "WM/Writer"

    /**
     * @type {String}
     */
    static g_wszWMConductor => "WM/Conductor"

    /**
     * @type {String}
     */
    static g_wszWMProducer => "WM/Producer"

    /**
     * @type {String}
     */
    static g_wszWMDirector => "WM/Director"

    /**
     * @type {String}
     */
    static g_wszWMContentGroupDescription => "WM/ContentGroupDescription"

    /**
     * @type {String}
     */
    static g_wszWMSubTitle => "WM/SubTitle"

    /**
     * @type {String}
     */
    static g_wszWMPartOfSet => "WM/PartOfSet"

    /**
     * @type {String}
     */
    static g_wszWMProtectionType => "WM/ProtectionType"

    /**
     * @type {String}
     */
    static g_wszWMVideoHeight => "WM/VideoHeight"

    /**
     * @type {String}
     */
    static g_wszWMVideoWidth => "WM/VideoWidth"

    /**
     * @type {String}
     */
    static g_wszWMVideoFrameRate => "WM/VideoFrameRate"

    /**
     * @type {String}
     */
    static g_wszWMMediaClassPrimaryID => "WM/MediaClassPrimaryID"

    /**
     * @type {String}
     */
    static g_wszWMMediaClassSecondaryID => "WM/MediaClassSecondaryID"

    /**
     * @type {String}
     */
    static g_wszWMPeriod => "WM/Period"

    /**
     * @type {String}
     */
    static g_wszWMCategory => "WM/Category"

    /**
     * @type {String}
     */
    static g_wszWMPicture => "WM/Picture"

    /**
     * @type {String}
     */
    static g_wszWMLyrics_Synchronised => "WM/Lyrics_Synchronised"

    /**
     * @type {String}
     */
    static g_wszWMOriginalLyricist => "WM/OriginalLyricist"

    /**
     * @type {String}
     */
    static g_wszWMOriginalArtist => "WM/OriginalArtist"

    /**
     * @type {String}
     */
    static g_wszWMOriginalAlbumTitle => "WM/OriginalAlbumTitle"

    /**
     * @type {String}
     */
    static g_wszWMOriginalReleaseYear => "WM/OriginalReleaseYear"

    /**
     * @type {String}
     */
    static g_wszWMOriginalFilename => "WM/OriginalFilename"

    /**
     * @type {String}
     */
    static g_wszWMPublisher => "WM/Publisher"

    /**
     * @type {String}
     */
    static g_wszWMEncodedBy => "WM/EncodedBy"

    /**
     * @type {String}
     */
    static g_wszWMEncodingSettings => "WM/EncodingSettings"

    /**
     * @type {String}
     */
    static g_wszWMEncodingTime => "WM/EncodingTime"

    /**
     * @type {String}
     */
    static g_wszWMAuthorURL => "WM/AuthorURL"

    /**
     * @type {String}
     */
    static g_wszWMUserWebURL => "WM/UserWebURL"

    /**
     * @type {String}
     */
    static g_wszWMAudioFileURL => "WM/AudioFileURL"

    /**
     * @type {String}
     */
    static g_wszWMAudioSourceURL => "WM/AudioSourceURL"

    /**
     * @type {String}
     */
    static g_wszWMLanguage => "WM/Language"

    /**
     * @type {String}
     */
    static g_wszWMParentalRating => "WM/ParentalRating"

    /**
     * @type {String}
     */
    static g_wszWMBeatsPerMinute => "WM/BeatsPerMinute"

    /**
     * @type {String}
     */
    static g_wszWMInitialKey => "WM/InitialKey"

    /**
     * @type {String}
     */
    static g_wszWMMood => "WM/Mood"

    /**
     * @type {String}
     */
    static g_wszWMText => "WM/Text"

    /**
     * @type {String}
     */
    static g_wszWMDVDID => "WM/DVDID"

    /**
     * @type {String}
     */
    static g_wszWMWMContentID => "WM/WMContentID"

    /**
     * @type {String}
     */
    static g_wszWMWMCollectionID => "WM/WMCollectionID"

    /**
     * @type {String}
     */
    static g_wszWMWMCollectionGroupID => "WM/WMCollectionGroupID"

    /**
     * @type {String}
     */
    static g_wszWMUniqueFileIdentifier => "WM/UniqueFileIdentifier"

    /**
     * @type {String}
     */
    static g_wszWMModifiedBy => "WM/ModifiedBy"

    /**
     * @type {String}
     */
    static g_wszWMRadioStationName => "WM/RadioStationName"

    /**
     * @type {String}
     */
    static g_wszWMRadioStationOwner => "WM/RadioStationOwner"

    /**
     * @type {String}
     */
    static g_wszWMPlaylistDelay => "WM/PlaylistDelay"

    /**
     * @type {String}
     */
    static g_wszWMCodec => "WM/Codec"

    /**
     * @type {String}
     */
    static g_wszWMDRM => "WM/DRM"

    /**
     * @type {String}
     */
    static g_wszWMISRC => "WM/ISRC"

    /**
     * @type {String}
     */
    static g_wszWMProvider => "WM/Provider"

    /**
     * @type {String}
     */
    static g_wszWMProviderRating => "WM/ProviderRating"

    /**
     * @type {String}
     */
    static g_wszWMProviderStyle => "WM/ProviderStyle"

    /**
     * @type {String}
     */
    static g_wszWMContentDistributor => "WM/ContentDistributor"

    /**
     * @type {String}
     */
    static g_wszWMSubscriptionContentID => "WM/SubscriptionContentID"

    /**
     * @type {String}
     */
    static g_wszWMWMADRCPeakReference => "WM/WMADRCPeakReference"

    /**
     * @type {String}
     */
    static g_wszWMWMADRCPeakTarget => "WM/WMADRCPeakTarget"

    /**
     * @type {String}
     */
    static g_wszWMWMADRCAverageReference => "WM/WMADRCAverageReference"

    /**
     * @type {String}
     */
    static g_wszWMWMADRCAverageTarget => "WM/WMADRCAverageTarget"

    /**
     * @type {String}
     */
    static g_wszWMStreamTypeInfo => "WM/StreamTypeInfo"

    /**
     * @type {String}
     */
    static g_wszWMPeakBitrate => "WM/PeakBitrate"

    /**
     * @type {String}
     */
    static g_wszWMASFPacketCount => "WM/ASFPacketCount"

    /**
     * @type {String}
     */
    static g_wszWMASFSecurityObjectsSize => "WM/ASFSecurityObjectsSize"

    /**
     * @type {String}
     */
    static g_wszWMSharedUserRating => "WM/SharedUserRating"

    /**
     * @type {String}
     */
    static g_wszWMSubTitleDescription => "WM/SubTitleDescription"

    /**
     * @type {String}
     */
    static g_wszWMMediaCredits => "WM/MediaCredits"

    /**
     * @type {String}
     */
    static g_wszWMParentalRatingReason => "WM/ParentalRatingReason"

    /**
     * @type {String}
     */
    static g_wszWMOriginalReleaseTime => "WM/OriginalReleaseTime"

    /**
     * @type {String}
     */
    static g_wszWMMediaStationCallSign => "WM/MediaStationCallSign"

    /**
     * @type {String}
     */
    static g_wszWMMediaStationName => "WM/MediaStationName"

    /**
     * @type {String}
     */
    static g_wszWMMediaNetworkAffiliation => "WM/MediaNetworkAffiliation"

    /**
     * @type {String}
     */
    static g_wszWMMediaOriginalChannel => "WM/MediaOriginalChannel"

    /**
     * @type {String}
     */
    static g_wszWMMediaOriginalBroadcastDateTime => "WM/MediaOriginalBroadcastDateTime"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsStereo => "WM/MediaIsStereo"

    /**
     * @type {String}
     */
    static g_wszWMVideoClosedCaptioning => "WM/VideoClosedCaptioning"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsRepeat => "WM/MediaIsRepeat"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsLive => "WM/MediaIsLive"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsTape => "WM/MediaIsTape"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsDelay => "WM/MediaIsDelay"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsSubtitled => "WM/MediaIsSubtitled"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsPremiere => "WM/MediaIsPremiere"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsFinale => "WM/MediaIsFinale"

    /**
     * @type {String}
     */
    static g_wszWMMediaIsSAP => "WM/MediaIsSAP"

    /**
     * @type {String}
     */
    static g_wszWMProviderCopyright => "WM/ProviderCopyright"

    /**
     * @type {String}
     */
    static g_wszWMISAN => "WM/ISAN"

    /**
     * @type {String}
     */
    static g_wszWMADID => "WM/ADID"

    /**
     * @type {String}
     */
    static g_wszWMWMShadowFileSourceFileType => "WM/WMShadowFileSourceFileType"

    /**
     * @type {String}
     */
    static g_wszWMWMShadowFileSourceDRMType => "WM/WMShadowFileSourceDRMType"

    /**
     * @type {String}
     */
    static g_wszWMWMCPDistributor => "WM/WMCPDistributor"

    /**
     * @type {String}
     */
    static g_wszWMWMCPDistributorID => "WM/WMCPDistributorID"

    /**
     * @type {String}
     */
    static g_wszWMSeasonNumber => "WM/SeasonNumber"

    /**
     * @type {String}
     */
    static g_wszWMEpisodeNumber => "WM/EpisodeNumber"

    /**
     * @type {String}
     */
    static g_wszEarlyDataDelivery => "EarlyDataDelivery"

    /**
     * @type {String}
     */
    static g_wszJustInTimeDecode => "JustInTimeDecode"

    /**
     * @type {String}
     */
    static g_wszSingleOutputBuffer => "SingleOutputBuffer"

    /**
     * @type {String}
     */
    static g_wszSoftwareScaling => "SoftwareScaling"

    /**
     * @type {String}
     */
    static g_wszDeliverOnReceive => "DeliverOnReceive"

    /**
     * @type {String}
     */
    static g_wszScrambledAudio => "ScrambledAudio"

    /**
     * @type {String}
     */
    static g_wszDedicatedDeliveryThread => "DedicatedDeliveryThread"

    /**
     * @type {String}
     */
    static g_wszEnableDiscreteOutput => "EnableDiscreteOutput"

    /**
     * @type {String}
     */
    static g_wszSpeakerConfig => "SpeakerConfig"

    /**
     * @type {String}
     */
    static g_wszDynamicRangeControl => "DynamicRangeControl"

    /**
     * @type {String}
     */
    static g_wszAllowInterlacedOutput => "AllowInterlacedOutput"

    /**
     * @type {String}
     */
    static g_wszVideoSampleDurations => "VideoSampleDurations"

    /**
     * @type {String}
     */
    static g_wszStreamLanguage => "StreamLanguage"

    /**
     * @type {String}
     */
    static g_wszEnableWMAProSPDIFOutput => "EnableWMAProSPDIFOutput"

    /**
     * @type {String}
     */
    static g_wszDeinterlaceMode => "DeinterlaceMode"

    /**
     * @type {String}
     */
    static g_wszInitialPatternForInverseTelecine => "InitialPatternForInverseTelecine"

    /**
     * @type {String}
     */
    static g_wszJPEGCompressionQuality => "JPEGCompressionQuality"

    /**
     * @type {String}
     */
    static g_wszWatermarkCLSID => "WatermarkCLSID"

    /**
     * @type {String}
     */
    static g_wszWatermarkConfig => "WatermarkConfig"

    /**
     * @type {String}
     */
    static g_wszInterlacedCoding => "InterlacedCoding"

    /**
     * @type {String}
     */
    static g_wszFixedFrameRate => "FixedFrameRate"

    /**
     * @type {String}
     */
    static g_wszOriginalSourceFormatTag => "_SOURCEFORMATTAG"

    /**
     * @type {String}
     */
    static g_wszOriginalWaveFormat => "_ORIGINALWAVEFORMAT"

    /**
     * @type {String}
     */
    static g_wszEDL => "_EDL"

    /**
     * @type {String}
     */
    static g_wszComplexity => "_COMPLEXITYEX"

    /**
     * @type {String}
     */
    static g_wszDecoderComplexityRequested => "_DECODERCOMPLEXITYPROFILE"

    /**
     * @type {String}
     */
    static g_wszReloadIndexOnSeek => "ReloadIndexOnSeek"

    /**
     * @type {String}
     */
    static g_wszStreamNumIndexObjects => "StreamNumIndexObjects"

    /**
     * @type {String}
     */
    static g_wszFailSeekOnError => "FailSeekOnError"

    /**
     * @type {String}
     */
    static g_wszPermitSeeksBeyondEndOfStream => "PermitSeeksBeyondEndOfStream"

    /**
     * @type {String}
     */
    static g_wszUsePacketAtSeekPoint => "UsePacketAtSeekPoint"

    /**
     * @type {String}
     */
    static g_wszSourceBufferTime => "SourceBufferTime"

    /**
     * @type {String}
     */
    static g_wszSourceMaxBytesAtOnce => "SourceMaxBytesAtOnce"

    /**
     * @type {String}
     */
    static g_wszVBREnabled => "_VBRENABLED"

    /**
     * @type {String}
     */
    static g_wszVBRQuality => "_VBRQUALITY"

    /**
     * @type {String}
     */
    static g_wszVBRBitrateMax => "_RMAX"

    /**
     * @type {String}
     */
    static g_wszVBRBufferWindowMax => "_BMAX"

    /**
     * @type {String}
     */
    static g_wszVBRPeak => "VBR Peak"

    /**
     * @type {String}
     */
    static g_wszBufferAverage => "Buffer Average"

    /**
     * @type {String}
     */
    static g_wszComplexityMax => "_COMPLEXITYEXMAX"

    /**
     * @type {String}
     */
    static g_wszComplexityOffline => "_COMPLEXITYEXOFFLINE"

    /**
     * @type {String}
     */
    static g_wszComplexityLive => "_COMPLEXITYEXLIVE"

    /**
     * @type {String}
     */
    static g_wszIsVBRSupported => "_ISVBRSUPPORTED"

    /**
     * @type {String}
     */
    static g_wszNumPasses => "_PASSESUSED"

    /**
     * @type {String}
     */
    static g_wszMusicSpeechClassMode => "MusicSpeechClassMode"

    /**
     * @type {String}
     */
    static g_wszMusicClassMode => "MusicClassMode"

    /**
     * @type {String}
     */
    static g_wszSpeechClassMode => "SpeechClassMode"

    /**
     * @type {String}
     */
    static g_wszMixedClassMode => "MixedClassMode"

    /**
     * @type {String}
     */
    static g_wszSpeechCaps => "SpeechFormatCap"

    /**
     * @type {String}
     */
    static g_wszPeakValue => "PeakValue"

    /**
     * @type {String}
     */
    static g_wszAverageLevel => "AverageLevel"

    /**
     * @type {String}
     */
    static g_wszFold6To2Channels3 => "Fold6To2Channels3"

    /**
     * @type {String}
     */
    static g_wszFoldToChannelsTemplate => "Fold%luTo%luChannels%lu"

    /**
     * @type {String}
     */
    static g_wszDeviceConformanceTemplate => "DeviceConformanceTemplate"

    /**
     * @type {String}
     */
    static g_wszEnableFrameInterpolation => "EnableFrameInterpolation"

    /**
     * @type {String}
     */
    static g_wszNeedsPreviousSample => "NeedsPreviousSample"

    /**
     * @type {String}
     */
    static g_wszWMIsCompilation => "WM/IsCompilation"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_Base => "{00000000-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIATYPE_Video => "{73646976-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB1 => "{e436eb78-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB4 => "{e436eb79-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB8 => "{e436eb7a-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB565 => "{e436eb7b-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB555 => "{e436eb7c-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB24 => "{e436eb7d-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_RGB32 => "{e436eb7e-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_I420 => "{30323449-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_IYUV => "{56555949-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_YV12 => "{32315659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_YUY2 => "{32595559-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_P422 => "{32323450-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_UYVY => "{59565955-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_YVYU => "{55595659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_YVU9 => "{39555659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_VIDEOIMAGE => "{1d4a45f2-e5f6-4b44-8388-f0ae5c0e0c37}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_MP43 => "{3334504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_MP4S => "{5334504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_M4S2 => "{3253344d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMV1 => "{31564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMV2 => "{32564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_MSS1 => "{3153534d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_MPEG2_VIDEO => "{e06d8026-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static WMMEDIATYPE_Audio => "{73647561-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_PCM => "{00000001-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_DRM => "{00000009-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMAudioV9 => "{00000162-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMAudio_Lossless => "{00000163-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_MSS2 => "{3253534d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMSP1 => "{0000000a-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMSP2 => "{0000000b-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMV3 => "{33564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMVP => "{50564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WVP2 => "{32505657-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMVA => "{41564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WVC1 => "{31435657-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMAudioV8 => "{00000161-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMAudioV7 => "{00000161-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WMAudioV2 => "{00000161-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_ACELPnet => "{00000130-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_MP3 => "{00000055-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIASUBTYPE_WebStream => "{776257d4-c627-41cb-8f81-7ac7ff1c40cc}"

    /**
     * @type {String}
     */
    static WMMEDIATYPE_Script => "{73636d64-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static WMMEDIATYPE_Image => "{34a50fd8-8aa5-4386-81fe-a0efe0488e31}"

    /**
     * @type {String}
     */
    static WMMEDIATYPE_FileTransfer => "{d9e47579-930e-4427-adfc-ad80f290e470}"

    /**
     * @type {String}
     */
    static WMMEDIATYPE_Text => "{9bba1ea7-5ab2-4829-ba57-0940209bcf3e}"

    /**
     * @type {String}
     */
    static WMFORMAT_VideoInfo => "{05589f80-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static WMFORMAT_MPEG2Video => "{e06d80e3-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static WMFORMAT_WaveFormatEx => "{05589f81-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static WMFORMAT_Script => "{5c8510f2-debe-4ca7-bba5-f07a104f8dff}"

    /**
     * @type {String}
     */
    static WMFORMAT_WebStream => "{da1e6b13-8359-4050-b398-388e965bf00c}"

    /**
     * @type {String}
     */
    static WMSCRIPTTYPE_TwoStrings => "{82f38a70-c29f-11d1-97ad-00a0c95ea850}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_OutputCleanPoint => "{f72a3c6f-6eb4-4ebc-b192-09ad9759e828}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_Timecode => "{399595ec-8667-4e2d-8fdb-98814ce76c1e}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_ChromaLocation => "{4c5acca0-9276-4b2c-9e4c-a0edefdd217e}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_ColorSpaceInfo => "{f79ada56-30eb-4f2b-9f7a-f24b139a1157}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_UserDataInfo => "{732bb4fa-78be-4549-99bd-02db1a55b7a8}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_FileName => "{e165ec0e-19ed-45d7-b4a7-25cbd1e28e9b}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_ContentType => "{d590dc20-07bc-436c-9cf7-f3bbfbf1a4dc}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_PixelAspectRatio => "{1b1ee554-f9ea-4bc8-821a-376b74e4c4b8}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_SampleDuration => "{c6bd9450-867f-4907-83a3-c77921b733ad}"

    /**
     * @type {String}
     */
    static WM_SampleExtensionGUID_SampleProtectionSalt => "{5403deee-b9ee-438f-aa83-3804997e569d}"

    /**
     * @type {String}
     */
    static CLSID_WMMUTEX_Language => "{d6e22a00-35da-11d1-9034-00a0c90349be}"

    /**
     * @type {String}
     */
    static CLSID_WMMUTEX_Bitrate => "{d6e22a01-35da-11d1-9034-00a0c90349be}"

    /**
     * @type {String}
     */
    static CLSID_WMMUTEX_Presentation => "{d6e22a02-35da-11d1-9034-00a0c90349be}"

    /**
     * @type {String}
     */
    static CLSID_WMMUTEX_Unknown => "{d6e22a03-35da-11d1-9034-00a0c90349be}"

    /**
     * @type {String}
     */
    static CLSID_WMBandwidthSharing_Exclusive => "{af6060aa-5197-11d2-b6af-00c04fd908e9}"

    /**
     * @type {String}
     */
    static CLSID_WMBandwidthSharing_Partial => "{af6060ab-5197-11d2-b6af-00c04fd908e9}"

    /**
     * @type {String}
     */
    static WMT_DMOCATEGORY_AUDIO_WATERMARK => "{65221c5a-fa75-4b39-b50c-06c336b6a3ef}"

    /**
     * @type {String}
     */
    static WMT_DMOCATEGORY_VIDEO_WATERMARK => "{187cc922-8efc-4404-9daf-63f4830df1bc}"

    /**
     * @type {String}
     */
    static CLSID_ClientNetManager => "{cd12a3ce-9c42-11d2-beed-0060082f2054}"
;@endregion Constants

;@region Methods
    /**
     * The WMIsContentProtected function checks a file for DRM-protected content. This function is a shortcut so that your application can quickly identify protected files.
     * @param {Pointer<Char>} pwszFileName Pointer to a wide-character <b>null</b>-terminated string containing the name of the file to check for DRM-protected content.
     * @param {Pointer<Int32>} pfIsProtected Pointer to a Boolean value that is set to True on function return if the file contains DRM-protected content.
     * @returns {Integer} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmiscontentprotected
     * @since windows5.0
     */
    static WMIsContentProtected(pwszFileName, pfIsProtected) {
        pwszFileName := pwszFileName is String? StrPtr(pwszFileName) : pwszFileName

        result := DllCall("WMVCore.dll\WMIsContentProtected", "ptr", pwszFileName, "int*", pfIsProtected, "int")
        return result
    }

    /**
     * The WMCreateWriter function creates a writer object.
     * @param {Pointer<IUnknown>} pUnkCert Pointer to an <b>IUnknown</b> interface. This value is not used and should be set to <b>NULL</b>.
     * @param {Pointer<IWMWriter>} ppWriter Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriter">IWMWriter</a> interface of the newly created writer object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriter
     * @since windows5.0
     */
    static WMCreateWriter(pUnkCert, ppWriter) {
        result := DllCall("WMVCore.dll\WMCreateWriter", "ptr", pUnkCert, "ptr", ppWriter, "int")
        return result
    }

    /**
     * The WMCreateReader function creates a reader object.
     * @remarks
     * After this object has been created, you can modify the rights that will be requested for the next file opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-setdrmproperty">IWMDRMReader::SetDRMProperty</a> with the <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-rights">DRM_Rights</a> property. Note that when using this property, the rights are specified as strings, not as <b>DWORD</b> values.
     * 
     * The <i>dwRights</i> parameter may be set to 0 when reading non-DRM content. If <i>dwRights</i> is set to 0 and you open a protected file, you can access license related metadata, but you cannot read data from any streams in the file.
     * @param {Pointer<IUnknown>} pUnkCert This value must be set to <b>NULL</b>.
     * @param {Integer} dwRights <b>DWORD</b> indicating the desired operation. Set to one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_rights">WMT_RIGHTS</a> enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, <i>dwRights</i> must consist of multiple values from <b>WMT_RIGHTS</b> combined by using the bitwise <b>OR</b> operator.
     * @param {Pointer<IWMReader>} ppReader Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreader">IWMReader</a> interface of the newly created reader object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatereader
     * @since windows5.0
     */
    static WMCreateReader(pUnkCert, dwRights, ppReader) {
        result := DllCall("WMVCore.dll\WMCreateReader", "ptr", pUnkCert, "uint", dwRights, "ptr", ppReader, "int")
        return result
    }

    /**
     * The WMCreateSyncReader function creates a synchronous reader object.
     * @param {Pointer<IUnknown>} pUnkCert Pointer to an <b>IUnknown</b> interface. This value must be set to <b>NULL</b>.
     * @param {Integer} dwRights <b>DWORD</b> specifying the desired operation. When playing back non-DRM content, or for an application that does not have DRM rights, this value can be set to zero. Otherwise, this value must be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_rights">WMT_RIGHTS</a> enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, <b>dwRights</b> must consist of multiple values from <b>WMT_RIGHTS</b> combined by using the bitwise <b>OR</b> operator.
     * @param {Pointer<IWMSyncReader>} ppSyncReader Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmsyncreader">IWMSyncReader</a> interface of the newly created synchronous reader object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatesyncreader
     * @since windows5.0
     */
    static WMCreateSyncReader(pUnkCert, dwRights, ppSyncReader) {
        result := DllCall("WMVCore.dll\WMCreateSyncReader", "ptr", pUnkCert, "uint", dwRights, "ptr", ppSyncReader, "int")
        return result
    }

    /**
     * The WMCreateEditor function creates a metadata editor object.
     * @param {Pointer<IWMMetadataEditor>} ppEditor Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmetadataeditor">IWMMetadataEditor</a> interface of the newly created metadata editor object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreateeditor
     * @since windows5.0
     */
    static WMCreateEditor(ppEditor) {
        result := DllCall("WMVCore.dll\WMCreateEditor", "ptr", ppEditor, "int")
        return result
    }

    /**
     * The WMCreateIndexer function creates an indexer object.
     * @param {Pointer<IWMIndexer>} ppIndexer Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmindexer">IWMIndexer</a> interface of the newly created indexer object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreateindexer
     * @since windows5.0
     */
    static WMCreateIndexer(ppIndexer) {
        result := DllCall("WMVCore.dll\WMCreateIndexer", "ptr", ppIndexer, "int")
        return result
    }

    /**
     * The WMCreateBackupRestorer function creates a backup restorer object.
     * @remarks
     * Use <b>IWMLicenseBackup::QueryInterface</b> to obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops">IWMBackupRestoreProps</a> interface.
     * @param {Pointer<IUnknown>} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface containing the <b>OnStatus</b> callback method to be used by the new backup restorer object.
     * @param {Pointer<IWMLicenseBackup>} ppBackup Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmlicensebackup">IWMLicenseBackup</a> interface of the newly created backup restorer object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatebackuprestorer
     * @since windows5.0
     */
    static WMCreateBackupRestorer(pCallback, ppBackup) {
        result := DllCall("WMVCore.dll\WMCreateBackupRestorer", "ptr", pCallback, "ptr", ppBackup, "int")
        return result
    }

    /**
     * The WMCreateProfileManager function creates a profile manager object.
     * @remarks
     * When a profile manager object is created, it parses all of the system profiles. Creating and releasing a profile manager every time you need to use it will adversely affect performance. You should create a profile manager once in your application and release it only when you no longer need to use it.
     * @param {Pointer<IWMProfileManager>} ppProfileManager Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanager">IWMProfileManager</a> interface of the newly created profile manager object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreateprofilemanager
     * @since windows5.0
     */
    static WMCreateProfileManager(ppProfileManager) {
        result := DllCall("WMVCore.dll\WMCreateProfileManager", "ptr", ppProfileManager, "int")
        return result
    }

    /**
     * The WMCreateWriterFileSink function creates a writer file sink object.
     * @param {Pointer<IWMWriterFileSink>} ppSink Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterfilesink">IWMWriterFileSink</a> interface of the newly created writer file sink object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriterfilesink
     * @since windows5.0
     */
    static WMCreateWriterFileSink(ppSink) {
        result := DllCall("WMVCore.dll\WMCreateWriterFileSink", "ptr", ppSink, "int")
        return result
    }

    /**
     * The WMCreateWriterNetworkSink function creates a writer network sink object.
     * @param {Pointer<IWMWriterNetworkSink>} ppSink Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriternetworksink">IWMWriterNetworkSink</a> interface of the newly created writer network sink object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriternetworksink
     * @since windows5.0
     */
    static WMCreateWriterNetworkSink(ppSink) {
        result := DllCall("WMVCore.dll\WMCreateWriterNetworkSink", "ptr", ppSink, "int")
        return result
    }

    /**
     * The WMCreateWriterPushSink function creates a writer push sink object. Push sinks are used to deliver streaming content to other media servers for distribution.
     * @param {Pointer<IWMWriterPushSink>} ppSink Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterpushsink">IWMWriterPushSink</a> interface of the newly created writer push sink object.
     * @returns {Integer} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate memory for the new object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriterpushsink
     * @since windows5.0
     */
    static WMCreateWriterPushSink(ppSink) {
        result := DllCall("WMVCore.dll\WMCreateWriterPushSink", "ptr", ppSink, "int")
        return result
    }

;@endregion Methods
}
