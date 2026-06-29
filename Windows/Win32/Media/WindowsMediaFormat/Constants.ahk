#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_INPUT_FRAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_USES_CURRENT_INPUT_FRAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_USES_PREVIOUS_INPUT_FRAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_MOTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_ROTATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_BLENDING := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING := 8

/**
 * @type {Integer (Int32)}
 */
export global WMT_VIDEOIMAGE_INTEGER_DENOMINATOR := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_MAGIC_NUMBER := 491406834

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_MAGIC_NUMBER_2 := 491406835

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_BOW_TIE := 11

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_CIRCLE := 12

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_CROSS_FADE := 13

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_DIAGONAL := 14

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_DIAMOND := 15

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_FADE_TO_COLOR := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_FILLED_V := 17

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_FLIP := 18

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_INSET := 19

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_IRIS := 20

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_PAGE_ROLL := 21

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_RECTANGLE := 23

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_REVEAL := 24

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_SLIDE := 27

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_SPLIT := 29

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_STAR := 30

/**
 * @type {Integer (UInt32)}
 */
export global WMT_VIDEOIMAGE_TRANSITION_WHEEL := 31

/**
 * @type {Integer (UInt32)}
 */
export global WM_SampleExtension_ContentType_Size := 1

/**
 * @type {Integer (UInt32)}
 */
export global WM_SampleExtension_PixelAspectRatio_Size := 2

/**
 * @type {Integer (UInt32)}
 */
export global WM_SampleExtension_Timecode_Size := 14

/**
 * @type {Integer (UInt32)}
 */
export global WM_SampleExtension_SampleDuration_Size := 2

/**
 * @type {Integer (UInt32)}
 */
export global WM_SampleExtension_ChromaLocation_Size := 1

/**
 * @type {Integer (UInt32)}
 */
export global WM_SampleExtension_ColorSpaceInfo_Size := 3

/**
 * @type {Integer (UInt32)}
 */
export global WM_CT_REPEAT_FIRST_FIELD := 16

/**
 * @type {Integer (UInt32)}
 */
export global WM_CT_BOTTOM_FIELD_FIRST := 32

/**
 * @type {Integer (UInt32)}
 */
export global WM_CT_TOP_FIELD_FIRST := 64

/**
 * @type {Integer (UInt32)}
 */
export global WM_CT_INTERLACED := 128

/**
 * @type {Integer (UInt32)}
 */
export global WM_CL_INTERLACED420 := 0

/**
 * @type {Integer (UInt32)}
 */
export global WM_CL_PROGRESSIVE420 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WM_MAX_VIDEO_STREAMS := 63

/**
 * @type {Integer (UInt32)}
 */
export global WM_MAX_STREAMS := 63

/**
 * @type {Integer (UInt32)}
 */
export global WMDRM_IMPORT_INIT_STRUCT_DEFINED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRM_OPL_TYPES := 1

/**
 * @type {Integer (UInt32)}
 */
export global g_dwWMSpecialAttributes := 20

/**
 * @type {String}
 */
export global g_wszWMDuration := "Duration"

/**
 * @type {String}
 */
export global g_wszWMBitrate := "Bitrate"

/**
 * @type {String}
 */
export global g_wszWMSeekable := "Seekable"

/**
 * @type {String}
 */
export global g_wszWMStridable := "Stridable"

/**
 * @type {String}
 */
export global g_wszWMBroadcast := "Broadcast"

/**
 * @type {String}
 */
export global g_wszWMProtected := "Is_Protected"

/**
 * @type {String}
 */
export global g_wszWMTrusted := "Is_Trusted"

/**
 * @type {String}
 */
export global g_wszWMSignature_Name := "Signature_Name"

/**
 * @type {String}
 */
export global g_wszWMHasAudio := "HasAudio"

/**
 * @type {String}
 */
export global g_wszWMHasImage := "HasImage"

/**
 * @type {String}
 */
export global g_wszWMHasScript := "HasScript"

/**
 * @type {String}
 */
export global g_wszWMHasVideo := "HasVideo"

/**
 * @type {String}
 */
export global g_wszWMCurrentBitrate := "CurrentBitrate"

/**
 * @type {String}
 */
export global g_wszWMOptimalBitrate := "OptimalBitrate"

/**
 * @type {String}
 */
export global g_wszWMHasAttachedImages := "HasAttachedImages"

/**
 * @type {String}
 */
export global g_wszWMSkipBackward := "Can_Skip_Backward"

/**
 * @type {String}
 */
export global g_wszWMSkipForward := "Can_Skip_Forward"

/**
 * @type {String}
 */
export global g_wszWMNumberOfFrames := "NumberOfFrames"

/**
 * @type {String}
 */
export global g_wszWMFileSize := "FileSize"

/**
 * @type {String}
 */
export global g_wszWMHasArbitraryDataStream := "HasArbitraryDataStream"

/**
 * @type {String}
 */
export global g_wszWMHasFileTransferStream := "HasFileTransferStream"

/**
 * @type {String}
 */
export global g_wszWMContainerFormat := "WM/ContainerFormat"

/**
 * @type {Integer (UInt32)}
 */
export global g_dwWMContentAttributes := 5

/**
 * @type {String}
 */
export global g_wszWMTitle := "Title"

/**
 * @type {String}
 */
export global g_wszWMTitleSort := "TitleSort"

/**
 * @type {String}
 */
export global g_wszWMAuthor := "Author"

/**
 * @type {String}
 */
export global g_wszWMAuthorSort := "AuthorSort"

/**
 * @type {String}
 */
export global g_wszWMDescription := "Description"

/**
 * @type {String}
 */
export global g_wszWMRating := "Rating"

/**
 * @type {String}
 */
export global g_wszWMCopyright := "Copyright"

/**
 * @type {String}
 */
export global g_wszWMUse_DRM := "Use_DRM"

/**
 * @type {String}
 */
export global g_wszWMDRM_Flags := "DRM_Flags"

/**
 * @type {String}
 */
export global g_wszWMDRM_Level := "DRM_Level"

/**
 * @type {String}
 */
export global g_wszWMUse_Advanced_DRM := "Use_Advanced_DRM"

/**
 * @type {String}
 */
export global g_wszWMDRM_KeySeed := "DRM_KeySeed"

/**
 * @type {String}
 */
export global g_wszWMDRM_KeyID := "DRM_KeyID"

/**
 * @type {String}
 */
export global g_wszWMDRM_ContentID := "DRM_ContentID"

/**
 * @type {String}
 */
export global g_wszWMDRM_SourceID := "DRM_SourceID"

/**
 * @type {String}
 */
export global g_wszWMDRM_IndividualizedVersion := "DRM_IndividualizedVersion"

/**
 * @type {String}
 */
export global g_wszWMDRM_LicenseAcqURL := "DRM_LicenseAcqURL"

/**
 * @type {String}
 */
export global g_wszWMDRM_V1LicenseAcqURL := "DRM_V1LicenseAcqURL"

/**
 * @type {String}
 */
export global g_wszWMDRM_HeaderSignPrivKey := "DRM_HeaderSignPrivKey"

/**
 * @type {String}
 */
export global g_wszWMDRM_LASignaturePrivKey := "DRM_LASignaturePrivKey"

/**
 * @type {String}
 */
export global g_wszWMDRM_LASignatureCert := "DRM_LASignatureCert"

/**
 * @type {String}
 */
export global g_wszWMDRM_LASignatureLicSrvCert := "DRM_LASignatureLicSrvCert"

/**
 * @type {String}
 */
export global g_wszWMDRM_LASignatureRootCert := "DRM_LASignatureRootCert"

/**
 * @type {String}
 */
export global g_wszWMAlbumTitle := "WM/AlbumTitle"

/**
 * @type {String}
 */
export global g_wszWMAlbumTitleSort := "WM/AlbumTitleSort"

/**
 * @type {String}
 */
export global g_wszWMTrack := "WM/Track"

/**
 * @type {String}
 */
export global g_wszWMPromotionURL := "WM/PromotionURL"

/**
 * @type {String}
 */
export global g_wszWMAlbumCoverURL := "WM/AlbumCoverURL"

/**
 * @type {String}
 */
export global g_wszWMGenre := "WM/Genre"

/**
 * @type {String}
 */
export global g_wszWMYear := "WM/Year"

/**
 * @type {String}
 */
export global g_wszWMGenreID := "WM/GenreID"

/**
 * @type {String}
 */
export global g_wszWMMCDI := "WM/MCDI"

/**
 * @type {String}
 */
export global g_wszWMComposer := "WM/Composer"

/**
 * @type {String}
 */
export global g_wszWMComposerSort := "WM/ComposerSort"

/**
 * @type {String}
 */
export global g_wszWMLyrics := "WM/Lyrics"

/**
 * @type {String}
 */
export global g_wszWMTrackNumber := "WM/TrackNumber"

/**
 * @type {String}
 */
export global g_wszWMToolName := "WM/ToolName"

/**
 * @type {String}
 */
export global g_wszWMToolVersion := "WM/ToolVersion"

/**
 * @type {String}
 */
export global g_wszWMIsVBR := "IsVBR"

/**
 * @type {String}
 */
export global g_wszWMAlbumArtist := "WM/AlbumArtist"

/**
 * @type {String}
 */
export global g_wszWMAlbumArtistSort := "WM/AlbumArtistSort"

/**
 * @type {String}
 */
export global g_wszWMBannerImageType := "BannerImageType"

/**
 * @type {String}
 */
export global g_wszWMBannerImageData := "BannerImageData"

/**
 * @type {String}
 */
export global g_wszWMBannerImageURL := "BannerImageURL"

/**
 * @type {String}
 */
export global g_wszWMCopyrightURL := "CopyrightURL"

/**
 * @type {String}
 */
export global g_wszWMAspectRatioX := "AspectRatioX"

/**
 * @type {String}
 */
export global g_wszWMAspectRatioY := "AspectRatioY"

/**
 * @type {String}
 */
export global g_wszASFLeakyBucketPairs := "ASFLeakyBucketPairs"

/**
 * @type {Integer (UInt32)}
 */
export global g_dwWMNSCAttributes := 5

/**
 * @type {String}
 */
export global g_wszWMNSCName := "NSC_Name"

/**
 * @type {String}
 */
export global g_wszWMNSCAddress := "NSC_Address"

/**
 * @type {String}
 */
export global g_wszWMNSCPhone := "NSC_Phone"

/**
 * @type {String}
 */
export global g_wszWMNSCEmail := "NSC_Email"

/**
 * @type {String}
 */
export global g_wszWMNSCDescription := "NSC_Description"

/**
 * @type {String}
 */
export global g_wszWMWriter := "WM/Writer"

/**
 * @type {String}
 */
export global g_wszWMConductor := "WM/Conductor"

/**
 * @type {String}
 */
export global g_wszWMProducer := "WM/Producer"

/**
 * @type {String}
 */
export global g_wszWMDirector := "WM/Director"

/**
 * @type {String}
 */
export global g_wszWMContentGroupDescription := "WM/ContentGroupDescription"

/**
 * @type {String}
 */
export global g_wszWMSubTitle := "WM/SubTitle"

/**
 * @type {String}
 */
export global g_wszWMPartOfSet := "WM/PartOfSet"

/**
 * @type {String}
 */
export global g_wszWMProtectionType := "WM/ProtectionType"

/**
 * @type {String}
 */
export global g_wszWMVideoHeight := "WM/VideoHeight"

/**
 * @type {String}
 */
export global g_wszWMVideoWidth := "WM/VideoWidth"

/**
 * @type {String}
 */
export global g_wszWMVideoFrameRate := "WM/VideoFrameRate"

/**
 * @type {String}
 */
export global g_wszWMMediaClassPrimaryID := "WM/MediaClassPrimaryID"

/**
 * @type {String}
 */
export global g_wszWMMediaClassSecondaryID := "WM/MediaClassSecondaryID"

/**
 * @type {String}
 */
export global g_wszWMPeriod := "WM/Period"

/**
 * @type {String}
 */
export global g_wszWMCategory := "WM/Category"

/**
 * @type {String}
 */
export global g_wszWMPicture := "WM/Picture"

/**
 * @type {String}
 */
export global g_wszWMLyrics_Synchronised := "WM/Lyrics_Synchronised"

/**
 * @type {String}
 */
export global g_wszWMOriginalLyricist := "WM/OriginalLyricist"

/**
 * @type {String}
 */
export global g_wszWMOriginalArtist := "WM/OriginalArtist"

/**
 * @type {String}
 */
export global g_wszWMOriginalAlbumTitle := "WM/OriginalAlbumTitle"

/**
 * @type {String}
 */
export global g_wszWMOriginalReleaseYear := "WM/OriginalReleaseYear"

/**
 * @type {String}
 */
export global g_wszWMOriginalFilename := "WM/OriginalFilename"

/**
 * @type {String}
 */
export global g_wszWMPublisher := "WM/Publisher"

/**
 * @type {String}
 */
export global g_wszWMEncodedBy := "WM/EncodedBy"

/**
 * @type {String}
 */
export global g_wszWMEncodingSettings := "WM/EncodingSettings"

/**
 * @type {String}
 */
export global g_wszWMEncodingTime := "WM/EncodingTime"

/**
 * @type {String}
 */
export global g_wszWMAuthorURL := "WM/AuthorURL"

/**
 * @type {String}
 */
export global g_wszWMUserWebURL := "WM/UserWebURL"

/**
 * @type {String}
 */
export global g_wszWMAudioFileURL := "WM/AudioFileURL"

/**
 * @type {String}
 */
export global g_wszWMAudioSourceURL := "WM/AudioSourceURL"

/**
 * @type {String}
 */
export global g_wszWMLanguage := "WM/Language"

/**
 * @type {String}
 */
export global g_wszWMParentalRating := "WM/ParentalRating"

/**
 * @type {String}
 */
export global g_wszWMBeatsPerMinute := "WM/BeatsPerMinute"

/**
 * @type {String}
 */
export global g_wszWMInitialKey := "WM/InitialKey"

/**
 * @type {String}
 */
export global g_wszWMMood := "WM/Mood"

/**
 * @type {String}
 */
export global g_wszWMText := "WM/Text"

/**
 * @type {String}
 */
export global g_wszWMDVDID := "WM/DVDID"

/**
 * @type {String}
 */
export global g_wszWMWMContentID := "WM/WMContentID"

/**
 * @type {String}
 */
export global g_wszWMWMCollectionID := "WM/WMCollectionID"

/**
 * @type {String}
 */
export global g_wszWMWMCollectionGroupID := "WM/WMCollectionGroupID"

/**
 * @type {String}
 */
export global g_wszWMUniqueFileIdentifier := "WM/UniqueFileIdentifier"

/**
 * @type {String}
 */
export global g_wszWMModifiedBy := "WM/ModifiedBy"

/**
 * @type {String}
 */
export global g_wszWMRadioStationName := "WM/RadioStationName"

/**
 * @type {String}
 */
export global g_wszWMRadioStationOwner := "WM/RadioStationOwner"

/**
 * @type {String}
 */
export global g_wszWMPlaylistDelay := "WM/PlaylistDelay"

/**
 * @type {String}
 */
export global g_wszWMCodec := "WM/Codec"

/**
 * @type {String}
 */
export global g_wszWMDRM := "WM/DRM"

/**
 * @type {String}
 */
export global g_wszWMISRC := "WM/ISRC"

/**
 * @type {String}
 */
export global g_wszWMProvider := "WM/Provider"

/**
 * @type {String}
 */
export global g_wszWMProviderRating := "WM/ProviderRating"

/**
 * @type {String}
 */
export global g_wszWMProviderStyle := "WM/ProviderStyle"

/**
 * @type {String}
 */
export global g_wszWMContentDistributor := "WM/ContentDistributor"

/**
 * @type {String}
 */
export global g_wszWMSubscriptionContentID := "WM/SubscriptionContentID"

/**
 * @type {String}
 */
export global g_wszWMWMADRCPeakReference := "WM/WMADRCPeakReference"

/**
 * @type {String}
 */
export global g_wszWMWMADRCPeakTarget := "WM/WMADRCPeakTarget"

/**
 * @type {String}
 */
export global g_wszWMWMADRCAverageReference := "WM/WMADRCAverageReference"

/**
 * @type {String}
 */
export global g_wszWMWMADRCAverageTarget := "WM/WMADRCAverageTarget"

/**
 * @type {String}
 */
export global g_wszWMStreamTypeInfo := "WM/StreamTypeInfo"

/**
 * @type {String}
 */
export global g_wszWMPeakBitrate := "WM/PeakBitrate"

/**
 * @type {String}
 */
export global g_wszWMASFPacketCount := "WM/ASFPacketCount"

/**
 * @type {String}
 */
export global g_wszWMASFSecurityObjectsSize := "WM/ASFSecurityObjectsSize"

/**
 * @type {String}
 */
export global g_wszWMSharedUserRating := "WM/SharedUserRating"

/**
 * @type {String}
 */
export global g_wszWMSubTitleDescription := "WM/SubTitleDescription"

/**
 * @type {String}
 */
export global g_wszWMMediaCredits := "WM/MediaCredits"

/**
 * @type {String}
 */
export global g_wszWMParentalRatingReason := "WM/ParentalRatingReason"

/**
 * @type {String}
 */
export global g_wszWMOriginalReleaseTime := "WM/OriginalReleaseTime"

/**
 * @type {String}
 */
export global g_wszWMMediaStationCallSign := "WM/MediaStationCallSign"

/**
 * @type {String}
 */
export global g_wszWMMediaStationName := "WM/MediaStationName"

/**
 * @type {String}
 */
export global g_wszWMMediaNetworkAffiliation := "WM/MediaNetworkAffiliation"

/**
 * @type {String}
 */
export global g_wszWMMediaOriginalChannel := "WM/MediaOriginalChannel"

/**
 * @type {String}
 */
export global g_wszWMMediaOriginalBroadcastDateTime := "WM/MediaOriginalBroadcastDateTime"

/**
 * @type {String}
 */
export global g_wszWMMediaIsStereo := "WM/MediaIsStereo"

/**
 * @type {String}
 */
export global g_wszWMVideoClosedCaptioning := "WM/VideoClosedCaptioning"

/**
 * @type {String}
 */
export global g_wszWMMediaIsRepeat := "WM/MediaIsRepeat"

/**
 * @type {String}
 */
export global g_wszWMMediaIsLive := "WM/MediaIsLive"

/**
 * @type {String}
 */
export global g_wszWMMediaIsTape := "WM/MediaIsTape"

/**
 * @type {String}
 */
export global g_wszWMMediaIsDelay := "WM/MediaIsDelay"

/**
 * @type {String}
 */
export global g_wszWMMediaIsSubtitled := "WM/MediaIsSubtitled"

/**
 * @type {String}
 */
export global g_wszWMMediaIsPremiere := "WM/MediaIsPremiere"

/**
 * @type {String}
 */
export global g_wszWMMediaIsFinale := "WM/MediaIsFinale"

/**
 * @type {String}
 */
export global g_wszWMMediaIsSAP := "WM/MediaIsSAP"

/**
 * @type {String}
 */
export global g_wszWMProviderCopyright := "WM/ProviderCopyright"

/**
 * @type {String}
 */
export global g_wszWMISAN := "WM/ISAN"

/**
 * @type {String}
 */
export global g_wszWMADID := "WM/ADID"

/**
 * @type {String}
 */
export global g_wszWMWMShadowFileSourceFileType := "WM/WMShadowFileSourceFileType"

/**
 * @type {String}
 */
export global g_wszWMWMShadowFileSourceDRMType := "WM/WMShadowFileSourceDRMType"

/**
 * @type {String}
 */
export global g_wszWMWMCPDistributor := "WM/WMCPDistributor"

/**
 * @type {String}
 */
export global g_wszWMWMCPDistributorID := "WM/WMCPDistributorID"

/**
 * @type {String}
 */
export global g_wszWMSeasonNumber := "WM/SeasonNumber"

/**
 * @type {String}
 */
export global g_wszWMEpisodeNumber := "WM/EpisodeNumber"

/**
 * @type {String}
 */
export global g_wszEarlyDataDelivery := "EarlyDataDelivery"

/**
 * @type {String}
 */
export global g_wszJustInTimeDecode := "JustInTimeDecode"

/**
 * @type {String}
 */
export global g_wszSingleOutputBuffer := "SingleOutputBuffer"

/**
 * @type {String}
 */
export global g_wszSoftwareScaling := "SoftwareScaling"

/**
 * @type {String}
 */
export global g_wszDeliverOnReceive := "DeliverOnReceive"

/**
 * @type {String}
 */
export global g_wszScrambledAudio := "ScrambledAudio"

/**
 * @type {String}
 */
export global g_wszDedicatedDeliveryThread := "DedicatedDeliveryThread"

/**
 * @type {String}
 */
export global g_wszEnableDiscreteOutput := "EnableDiscreteOutput"

/**
 * @type {String}
 */
export global g_wszSpeakerConfig := "SpeakerConfig"

/**
 * @type {String}
 */
export global g_wszDynamicRangeControl := "DynamicRangeControl"

/**
 * @type {String}
 */
export global g_wszAllowInterlacedOutput := "AllowInterlacedOutput"

/**
 * @type {String}
 */
export global g_wszVideoSampleDurations := "VideoSampleDurations"

/**
 * @type {String}
 */
export global g_wszStreamLanguage := "StreamLanguage"

/**
 * @type {String}
 */
export global g_wszEnableWMAProSPDIFOutput := "EnableWMAProSPDIFOutput"

/**
 * @type {String}
 */
export global g_wszDeinterlaceMode := "DeinterlaceMode"

/**
 * @type {String}
 */
export global g_wszInitialPatternForInverseTelecine := "InitialPatternForInverseTelecine"

/**
 * @type {String}
 */
export global g_wszJPEGCompressionQuality := "JPEGCompressionQuality"

/**
 * @type {String}
 */
export global g_wszWatermarkCLSID := "WatermarkCLSID"

/**
 * @type {String}
 */
export global g_wszWatermarkConfig := "WatermarkConfig"

/**
 * @type {String}
 */
export global g_wszInterlacedCoding := "InterlacedCoding"

/**
 * @type {String}
 */
export global g_wszFixedFrameRate := "FixedFrameRate"

/**
 * @type {String}
 */
export global g_wszOriginalSourceFormatTag := "_SOURCEFORMATTAG"

/**
 * @type {String}
 */
export global g_wszOriginalWaveFormat := "_ORIGINALWAVEFORMAT"

/**
 * @type {String}
 */
export global g_wszEDL := "_EDL"

/**
 * @type {String}
 */
export global g_wszComplexity := "_COMPLEXITYEX"

/**
 * @type {String}
 */
export global g_wszDecoderComplexityRequested := "_DECODERCOMPLEXITYPROFILE"

/**
 * @type {String}
 */
export global g_wszReloadIndexOnSeek := "ReloadIndexOnSeek"

/**
 * @type {String}
 */
export global g_wszStreamNumIndexObjects := "StreamNumIndexObjects"

/**
 * @type {String}
 */
export global g_wszFailSeekOnError := "FailSeekOnError"

/**
 * @type {String}
 */
export global g_wszPermitSeeksBeyondEndOfStream := "PermitSeeksBeyondEndOfStream"

/**
 * @type {String}
 */
export global g_wszUsePacketAtSeekPoint := "UsePacketAtSeekPoint"

/**
 * @type {String}
 */
export global g_wszSourceBufferTime := "SourceBufferTime"

/**
 * @type {String}
 */
export global g_wszSourceMaxBytesAtOnce := "SourceMaxBytesAtOnce"

/**
 * @type {String}
 */
export global g_wszVBREnabled := "_VBRENABLED"

/**
 * @type {String}
 */
export global g_wszVBRQuality := "_VBRQUALITY"

/**
 * @type {String}
 */
export global g_wszVBRBitrateMax := "_RMAX"

/**
 * @type {String}
 */
export global g_wszVBRBufferWindowMax := "_BMAX"

/**
 * @type {String}
 */
export global g_wszVBRPeak := "VBR Peak"

/**
 * @type {String}
 */
export global g_wszBufferAverage := "Buffer Average"

/**
 * @type {String}
 */
export global g_wszComplexityMax := "_COMPLEXITYEXMAX"

/**
 * @type {String}
 */
export global g_wszComplexityOffline := "_COMPLEXITYEXOFFLINE"

/**
 * @type {String}
 */
export global g_wszComplexityLive := "_COMPLEXITYEXLIVE"

/**
 * @type {String}
 */
export global g_wszIsVBRSupported := "_ISVBRSUPPORTED"

/**
 * @type {String}
 */
export global g_wszNumPasses := "_PASSESUSED"

/**
 * @type {String}
 */
export global g_wszMusicSpeechClassMode := "MusicSpeechClassMode"

/**
 * @type {String}
 */
export global g_wszMusicClassMode := "MusicClassMode"

/**
 * @type {String}
 */
export global g_wszSpeechClassMode := "SpeechClassMode"

/**
 * @type {String}
 */
export global g_wszMixedClassMode := "MixedClassMode"

/**
 * @type {String}
 */
export global g_wszSpeechCaps := "SpeechFormatCap"

/**
 * @type {String}
 */
export global g_wszPeakValue := "PeakValue"

/**
 * @type {String}
 */
export global g_wszAverageLevel := "AverageLevel"

/**
 * @type {String}
 */
export global g_wszFold6To2Channels3 := "Fold6To2Channels3"

/**
 * @type {String}
 */
export global g_wszFoldToChannelsTemplate := "Fold%luTo%luChannels%lu"

/**
 * @type {String}
 */
export global g_wszDeviceConformanceTemplate := "DeviceConformanceTemplate"

/**
 * @type {String}
 */
export global g_wszEnableFrameInterpolation := "EnableFrameInterpolation"

/**
 * @type {String}
 */
export global g_wszNeedsPreviousSample := "NeedsPreviousSample"

/**
 * @type {String}
 */
export global g_wszWMIsCompilation := "WM/IsCompilation"

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_Base := Guid("{00000000-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIATYPE_Video := Guid("{73646976-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB1 := Guid("{e436eb78-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB4 := Guid("{e436eb79-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB8 := Guid("{e436eb7a-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB565 := Guid("{e436eb7b-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB555 := Guid("{e436eb7c-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB24 := Guid("{e436eb7d-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_RGB32 := Guid("{e436eb7e-524f-11ce-9f53-0020af0ba770}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_I420 := Guid("{30323449-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_IYUV := Guid("{56555949-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_YV12 := Guid("{32315659-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_YUY2 := Guid("{32595559-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_P422 := Guid("{32323450-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_UYVY := Guid("{59565955-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_YVYU := Guid("{55595659-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_YVU9 := Guid("{39555659-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_VIDEOIMAGE := Guid("{1d4a45f2-e5f6-4b44-8388-f0ae5c0e0c37}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_MP43 := Guid("{3334504d-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_MP4S := Guid("{5334504d-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_M4S2 := Guid("{3253344d-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMV1 := Guid("{31564d57-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMV2 := Guid("{32564d57-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_MSS1 := Guid("{3153534d-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_MPEG2_VIDEO := Guid("{e06d8026-db46-11cf-b4d1-00805f6cbbea}")

/**
 * @type {Guid}
 */
export global WMMEDIATYPE_Audio := Guid("{73647561-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_PCM := Guid("{00000001-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_DRM := Guid("{00000009-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMAudioV9 := Guid("{00000162-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMAudio_Lossless := Guid("{00000163-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_MSS2 := Guid("{3253534d-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMSP1 := Guid("{0000000a-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMSP2 := Guid("{0000000b-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMV3 := Guid("{33564d57-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMVP := Guid("{50564d57-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WVP2 := Guid("{32505657-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMVA := Guid("{41564d57-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WVC1 := Guid("{31435657-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMAudioV8 := Guid("{00000161-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMAudioV7 := Guid("{00000161-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WMAudioV2 := Guid("{00000161-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_ACELPnet := Guid("{00000130-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_MP3 := Guid("{00000055-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIASUBTYPE_WebStream := Guid("{776257d4-c627-41cb-8f81-7ac7ff1c40cc}")

/**
 * @type {Guid}
 */
export global WMMEDIATYPE_Script := Guid("{73636d64-0000-0010-8000-00aa00389b71}")

/**
 * @type {Guid}
 */
export global WMMEDIATYPE_Image := Guid("{34a50fd8-8aa5-4386-81fe-a0efe0488e31}")

/**
 * @type {Guid}
 */
export global WMMEDIATYPE_FileTransfer := Guid("{d9e47579-930e-4427-adfc-ad80f290e470}")

/**
 * @type {Guid}
 */
export global WMMEDIATYPE_Text := Guid("{9bba1ea7-5ab2-4829-ba57-0940209bcf3e}")

/**
 * @type {Guid}
 */
export global WMFORMAT_VideoInfo := Guid("{05589f80-c356-11ce-bf01-00aa0055595a}")

/**
 * @type {Guid}
 */
export global WMFORMAT_MPEG2Video := Guid("{e06d80e3-db46-11cf-b4d1-00805f6cbbea}")

/**
 * @type {Guid}
 */
export global WMFORMAT_WaveFormatEx := Guid("{05589f81-c356-11ce-bf01-00aa0055595a}")

/**
 * @type {Guid}
 */
export global WMFORMAT_Script := Guid("{5c8510f2-debe-4ca7-bba5-f07a104f8dff}")

/**
 * @type {Guid}
 */
export global WMFORMAT_WebStream := Guid("{da1e6b13-8359-4050-b398-388e965bf00c}")

/**
 * @type {Guid}
 */
export global WMSCRIPTTYPE_TwoStrings := Guid("{82f38a70-c29f-11d1-97ad-00a0c95ea850}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_OutputCleanPoint := Guid("{f72a3c6f-6eb4-4ebc-b192-09ad9759e828}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_Timecode := Guid("{399595ec-8667-4e2d-8fdb-98814ce76c1e}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_ChromaLocation := Guid("{4c5acca0-9276-4b2c-9e4c-a0edefdd217e}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_ColorSpaceInfo := Guid("{f79ada56-30eb-4f2b-9f7a-f24b139a1157}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_UserDataInfo := Guid("{732bb4fa-78be-4549-99bd-02db1a55b7a8}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_FileName := Guid("{e165ec0e-19ed-45d7-b4a7-25cbd1e28e9b}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_ContentType := Guid("{d590dc20-07bc-436c-9cf7-f3bbfbf1a4dc}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_PixelAspectRatio := Guid("{1b1ee554-f9ea-4bc8-821a-376b74e4c4b8}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_SampleDuration := Guid("{c6bd9450-867f-4907-83a3-c77921b733ad}")

/**
 * @type {Guid}
 */
export global WM_SampleExtensionGUID_SampleProtectionSalt := Guid("{5403deee-b9ee-438f-aa83-3804997e569d}")

/**
 * @type {Guid}
 */
export global CLSID_WMMUTEX_Language := Guid("{d6e22a00-35da-11d1-9034-00a0c90349be}")

/**
 * @type {Guid}
 */
export global CLSID_WMMUTEX_Bitrate := Guid("{d6e22a01-35da-11d1-9034-00a0c90349be}")

/**
 * @type {Guid}
 */
export global CLSID_WMMUTEX_Presentation := Guid("{d6e22a02-35da-11d1-9034-00a0c90349be}")

/**
 * @type {Guid}
 */
export global CLSID_WMMUTEX_Unknown := Guid("{d6e22a03-35da-11d1-9034-00a0c90349be}")

/**
 * @type {Guid}
 */
export global CLSID_WMBandwidthSharing_Exclusive := Guid("{af6060aa-5197-11d2-b6af-00c04fd908e9}")

/**
 * @type {Guid}
 */
export global CLSID_WMBandwidthSharing_Partial := Guid("{af6060ab-5197-11d2-b6af-00c04fd908e9}")

/**
 * @type {Guid}
 */
export global WMT_DMOCATEGORY_AUDIO_WATERMARK := Guid("{65221c5a-fa75-4b39-b50c-06c336b6a3ef}")

/**
 * @type {Guid}
 */
export global WMT_DMOCATEGORY_VIDEO_WATERMARK := Guid("{187cc922-8efc-4404-9daf-63f4830df1bc}")

/**
 * @type {Guid}
 */
export global CLSID_ClientNetManager := Guid("{cd12a3ce-9c42-11d2-beed-0060082f2054}")
;@endregion Constants
