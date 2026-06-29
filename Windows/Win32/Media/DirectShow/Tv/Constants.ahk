#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DTV_CardStatus_Inserted := 0

/**
 * @type {Integer (UInt32)}
 */
export global DTV_CardStatus_Removed := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTV_CardStatus_Error := 2

/**
 * @type {Integer (UInt32)}
 */
export global DTV_CardStatus_FirmwareDownload := 3

/**
 * @type {Integer (UInt32)}
 */
export global OCUR_PAIRING_PROTOCOL_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PBDA_PAIRING_PROTOCOL_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global DTV_MMIMessage_Open := 0

/**
 * @type {Integer (UInt32)}
 */
export global DTV_MMIMessage_Close := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTV_Entitlement_CanDecrypt := 0

/**
 * @type {Integer (UInt32)}
 */
export global DTV_Entitlement_NotEntitled := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTV_Entitlement_TechnicalFailure := 2

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Standard := 0

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Music_And_Effects := 1

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Visually_Impaired := 2

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Hearing_Impaired := 3

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Dialogue := 4

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Commentary := 5

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Emergency := 6

/**
 * @type {Integer (UInt32)}
 */
export global AudioType_Voiceover := 7

/**
 * @type {Integer (Int32)}
 */
export global AudioType_Reserved := -1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COUNTRY_CODE_STRING := 3

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_TIME_RANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global REQUIRED_PARENTAL_CONTROL_TIME_RANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_CONTENT_RATING := 256

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_ATTRIB_VIOLENCE := 512

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_ATTRIB_LANGUAGE := 513

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_ATTRIB_SEXUAL := 514

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_ATTRIB_DIALOGUE := 515

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_ATTRIB_FANTASY := 516

/**
 * @type {Integer (UInt32)}
 */
export global PARENTAL_CONTROL_VALUE_UNDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global MPEG2_FILTER_VERSION_1_SIZE := 124

/**
 * @type {Integer (UInt32)}
 */
export global MPEG2_FILTER_VERSION_2_SIZE := 133

/**
 * @type {Guid}
 */
export global SID_MSVidCtl_CurrentAudioEndpoint := Guid("{cf9a88f4-abcf-4ed8-9b74-7db33445459e}")

/**
 * @type {Integer (UInt32)}
 */
export global STREAMBUFFER_EC_BASE := 806

/**
 * @type {Guid}
 */
export global EVENTID_SBE2RecControlStarted := Guid("{8966a89e-f83e-4c0e-bc3b-bfa7649e04cb}")

/**
 * @type {Guid}
 */
export global EVENTID_SBE2RecControlStopped := Guid("{454b1ec8-0c9b-4caa-b1a1-1e7a2666f6c3}")

/**
 * @type {Guid}
 */
export global SBE2_STREAM_DESC_EVENT := Guid("{2313a4ed-bf2d-454f-ad8a-d95ba7f91fee}")

/**
 * @type {Guid}
 */
export global SBE2_V1_STREAMS_CREATION_EVENT := Guid("{000fcf09-97f5-46ac-9769-7a83b35384fb}")

/**
 * @type {Guid}
 */
export global SBE2_V2_STREAMS_CREATION_EVENT := Guid("{a72530a3-0344-4cab-a2d0-fe937dbdcab3}")

/**
 * @type {Integer (UInt32)}
 */
export global SBE2_STREAM_DESC_VERSION := 1

/**
 * @type {Guid}
 */
export global SID_DRMSecureServiceChannel := Guid("{c4c4c4c4-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_ETFilterEncProperties := Guid("{c4c4c481-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_ETFilterTagProperties := Guid("{c4c4c491-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_PTFilter := Guid("{9cd31617-b303-4f96-8330-2eb173ea4dc6}")

/**
 * @type {Guid}
 */
export global CLSID_DTFilterEncProperties := Guid("{c4c4c482-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_DTFilterTagProperties := Guid("{c4c4c492-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_XDSCodecProperties := Guid("{c4c4c483-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_XDSCodecTagProperties := Guid("{c4c4c493-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global CLSID_CPCAFiltersCategory := Guid("{c4c4c4fc-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_XDSCodecNewXDSRating := Guid("{c4c4c4e0-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_XDSCodecDuplicateXDSRating := Guid("{c4c4c4df-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_XDSCodecNewXDSPacket := Guid("{c4c4c4e1-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterRatingChange := Guid("{c4c4c4e2-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterRatingsBlock := Guid("{c4c4c4e3-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterRatingsUnblock := Guid("{c4c4c4e4-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterXDSPacket := Guid("{c4c4c4e5-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_ETFilterEncryptionOn := Guid("{c4c4c4e6-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_ETFilterEncryptionOff := Guid("{c4c4c4e7-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterCOPPUnblock := Guid("{c4c4c4e8-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_EncDecFilterError := Guid("{c4c4c4e9-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterCOPPBlock := Guid("{c4c4c4ea-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_ETFilterCopyOnce := Guid("{c4c4c4eb-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_ETFilterCopyNever := Guid("{c4c4c4f0-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterDataFormatOK := Guid("{c4c4c4ec-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_DTFilterDataFormatFailure := Guid("{c4c4c4ed-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_ETDTFilterLicenseOK := Guid("{c4c4c4ee-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global EVENTID_ETDTFilterLicenseFailure := Guid("{c4c4c4ef-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global MEDIASUBTYPE_ETDTFilter_Tagged := Guid("{c4c4c4d0-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global FORMATTYPE_ETDTFilter_Tagged := Guid("{c4c4c4d1-0049-4e2b-98fb-9537f6ce516d}")

/**
 * @type {Guid}
 */
export global MEDIASUBTYPE_CPFilters_Processed := Guid("{46adbd28-6fd0-4796-93b2-155c51dc048d}")

/**
 * @type {Guid}
 */
export global FORMATTYPE_CPFilters_Processed := Guid("{6739b36f-1d5f-4ac2-8192-28bb0e73d16a}")

/**
 * @type {Guid}
 */
export global EVENTID_EncDecFilterEvent := Guid("{4a1b465b-0fb9-4159-afbd-e33006a0f9f4}")

/**
 * @type {Guid}
 */
export global EVENTID_FormatNotSupportedEvent := Guid("{24b2280a-b2aa-4777-bf65-63f35e7b024a}")

/**
 * @type {Guid}
 */
export global EVENTID_DemultiplexerFilterDiscontinuity := Guid("{16155770-aed5-475c-bb98-95a33070df0c}")

/**
 * @type {Guid}
 */
export global DSATTRIB_WMDRMProtectionInfo := Guid("{40749583-6b9d-4eec-b43c-67a1801e1a9b}")

/**
 * @type {Guid}
 */
export global DSATTRIB_BadSampleInfo := Guid("{e4846dda-5838-42b4-b897-6f7e5faa2f2f}")

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_PAT_PID := 0

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_PAT_TID := 0

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_CAT_PID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_CAT_TID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_PMT_TID := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_TSDT_PID := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPEG_TSDT_TID := 3

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_MGT_PID := 8187

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_MGT_TID := 199

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_VCT_PID := 8187

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_VCT_TERR_TID := 200

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_VCT_CABL_TID := 201

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_EIT_TID := 203

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_ETT_TID := 204

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_RRT_TID := 202

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_RRT_PID := 8187

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_STT_PID := 8187

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_STT_TID := 205

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_PIT_TID := 208

/**
 * @type {Integer (UInt32)}
 */
export global DVB_NIT_PID := 16

/**
 * @type {Integer (UInt32)}
 */
export global DVB_NIT_ACTUAL_TID := 64

/**
 * @type {Integer (UInt32)}
 */
export global DVB_NIT_OTHER_TID := 65

/**
 * @type {Integer (UInt32)}
 */
export global DVB_SDT_PID := 17

/**
 * @type {Integer (UInt32)}
 */
export global DVB_SDT_ACTUAL_TID := 66

/**
 * @type {Integer (UInt32)}
 */
export global DVB_SDT_OTHER_TID := 70

/**
 * @type {Integer (UInt32)}
 */
export global DVB_BAT_PID := 17

/**
 * @type {Integer (UInt32)}
 */
export global DVB_BAT_TID := 74

/**
 * @type {Integer (UInt32)}
 */
export global DVB_EIT_PID := 18

/**
 * @type {Integer (UInt32)}
 */
export global DVB_EIT_ACTUAL_TID := 78

/**
 * @type {Integer (UInt32)}
 */
export global DVB_EIT_OTHER_TID := 79

/**
 * @type {Integer (UInt32)}
 */
export global DVB_RST_PID := 19

/**
 * @type {Integer (UInt32)}
 */
export global DVB_RST_TID := 113

/**
 * @type {Integer (UInt32)}
 */
export global DVB_TDT_PID := 20

/**
 * @type {Integer (UInt32)}
 */
export global DVB_TDT_TID := 112

/**
 * @type {Integer (UInt32)}
 */
export global DVB_ST_PID_16 := 16

/**
 * @type {Integer (UInt32)}
 */
export global DVB_ST_PID_17 := 17

/**
 * @type {Integer (UInt32)}
 */
export global DVB_ST_PID_18 := 18

/**
 * @type {Integer (UInt32)}
 */
export global DVB_ST_PID_19 := 19

/**
 * @type {Integer (UInt32)}
 */
export global DVB_ST_PID_20 := 20

/**
 * @type {Integer (UInt32)}
 */
export global DVB_ST_TID := 114

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_ST_TID := 114

/**
 * @type {Integer (UInt32)}
 */
export global DVB_TOT_PID := 20

/**
 * @type {Integer (UInt32)}
 */
export global DVB_TOT_TID := 115

/**
 * @type {Integer (UInt32)}
 */
export global DVB_DIT_PID := 30

/**
 * @type {Integer (UInt32)}
 */
export global DVB_DIT_TID := 126

/**
 * @type {Integer (UInt32)}
 */
export global DVB_SIT_PID := 31

/**
 * @type {Integer (UInt32)}
 */
export global DVB_SIT_TID := 127

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_EMM_TID := 133

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_BIT_PID := 36

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_BIT_TID := 196

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_NBIT_PID := 37

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_NBIT_MSG_TID := 197

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_NBIT_REF_TID := 198

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_LDT_PID := 37

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_LDT_TID := 199

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_SDTT_PID := 35

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_SDTT_ALT_PID := 40

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_SDTT_TID := 195

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_CDT_PID := 41

/**
 * @type {Integer (UInt32)}
 */
export global ISDB_CDT_TID := 200

/**
 * @type {Integer (UInt32)}
 */
export global SCTE_EAS_TID := 216

/**
 * @type {Integer (UInt32)}
 */
export global SCTE_EAS_IB_PID := 8187

/**
 * @type {Integer (UInt32)}
 */
export global SCTE_EAS_OOB_PID := 8188

/**
 * @type {Guid}
 */
export global CLSID_Mpeg2TableFilter := Guid("{752845f1-758f-4c83-a043-4270c593308e}")

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_ETM_LOCATION_NOT_PRESENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_ETM_LOCATION_IN_PTC_FOR_PSIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_ETM_LOCATION_IN_PTC_FOR_EVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATSC_ETM_LOCATION_RESERVED := 3

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_SEQUENCE_HEADER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_GOP_HEADER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_PICTURE_HEADER := 3

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_SEQUENCE_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_SEEK_POINT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_FRAME_START := 3

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_I_FRAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_P_FRAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_B_FRAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_STANDALONE_FRAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_REF_FRAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAMPLE_SEQ_CONTENT_NONREF_FRAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_TAG_CAPTION_MIN := 48

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_TAG_CAPTION_MAX := 55

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_TAG_SUPERIMPOSE_MIN := 56

/**
 * @type {Integer (UInt32)}
 */
export global COMPONENT_TAG_SUPERIMPOSE_MAX := 63

/**
 * @type {Integer (UInt32)}
 */
export global DVBS_SCAN_TABLE_MAX_SIZE := 400

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingDuration := "Duration"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingBitrate := "Bitrate"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingSeekable := "Seekable"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingStridable := "Stridable"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingBroadcast := "Broadcast"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingProtected := "Is_Protected"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingTrusted := "Is_Trusted"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingSignature_Name := "Signature_Name"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasAudio := "HasAudio"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasImage := "HasImage"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasScript := "HasScript"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasVideo := "HasVideo"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingCurrentBitrate := "CurrentBitrate"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingOptimalBitrate := "OptimalBitrate"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasAttachedImages := "HasAttachedImages"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingSkipBackward := "Can_Skip_Backward"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingSkipForward := "Can_Skip_Forward"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingNumberOfFrames := "NumberOfFrames"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingFileSize := "FileSize"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasArbitraryDataStream := "HasArbitraryDataStream"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingHasFileTransferStream := "HasFileTransferStream"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingTitle := "Title"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingAuthor := "Author"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingDescription := "Description"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingRating := "Rating"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingCopyright := "Copyright"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingUse_DRM := "Use_DRM"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingDRM_Flags := "DRM_Flags"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingDRM_Level := "DRM_Level"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingAlbumTitle := "WM/AlbumTitle"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingTrack := "WM/Track"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingPromotionURL := "WM/PromotionURL"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingAlbumCoverURL := "WM/AlbumCoverURL"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingGenre := "WM/Genre"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingYear := "WM/Year"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingGenreID := "WM/GenreID"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingMCDI := "WM/MCDI"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingComposer := "WM/Composer"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingLyrics := "WM/Lyrics"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingTrackNumber := "WM/TrackNumber"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingToolName := "WM/ToolName"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingToolVersion := "WM/ToolVersion"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingIsVBR := "IsVBR"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingAlbumArtist := "WM/AlbumArtist"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingBannerImageType := "BannerImageType"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingBannerImageData := "BannerImageData"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingBannerImageURL := "BannerImageURL"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingCopyrightURL := "CopyrightURL"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingAspectRatioX := "AspectRatioX"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingAspectRatioY := "AspectRatioY"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingNSCName := "NSC_Name"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingNSCAddress := "NSC_Address"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingNSCPhone := "NSC_Phone"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingNSCEmail := "NSC_Email"

/**
 * @type {String}
 */
export global g_wszStreamBufferRecordingNSCDescription := "NSC_Description"

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_TIMEHOLE := 806

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_STALE_DATA_READ := 807

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_STALE_FILE_DELETED := 808

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_CONTENT_BECOMING_STALE := 809

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_WRITE_FAILURE := 810

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_WRITE_FAILURE_CLEAR := 811

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_READ_FAILURE := 812

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_RATE_CHANGED := 813

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_PRIMARY_AUDIO := 814

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_RATE_CHANGING_FOR_SETPOSITIONS := 815

/**
 * @type {Integer (Int32)}
 */
export global STREAMBUFFER_EC_SETPOSITIONS_EVENTS_DONE := 816
;@endregion Constants
