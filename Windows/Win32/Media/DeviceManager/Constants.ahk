#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DeviceManager
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MTP_CUSTOM_COMMAND := 827348045

/**
 * @type {Integer (UInt32)}
 */
export global MTP_NEXTPHASE_READ_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global MTP_NEXTPHASE_WRITE_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global MTP_NEXTPHASE_NO_DATA := 3

/**
 * @type {Integer (UInt32)}
 */
export global RSA_KEY_LEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global SAC_SESSION_KEYLEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global SAC_PROTOCOL_WMDM := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAC_PROTOCOL_V1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAC_CERT_X509 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAC_CERT_V1 := 2

/**
 * @type {Guid}
 */
export global WMDM_DEVICE_PROTOCOL_MTP := Guid("{979e54e5-0afc-4604-8d93-dc798a4bcf45}")

/**
 * @type {Guid}
 */
export global WMDM_DEVICE_PROTOCOL_RAPI := Guid("{2a11ed91-8c8f-41e4-82d1-8386e003561c}")

/**
 * @type {Guid}
 */
export global WMDM_DEVICE_PROTOCOL_MSC := Guid("{a4d2c26c-a881-44bb-bd5d-1f703c71f7a9}")

/**
 * @type {Guid}
 */
export global WMDM_SERVICE_PROVIDER_VENDOR_MICROSOFT := Guid("{7de8686d-78ee-43ea-a496-c625ac91cc5d}")

/**
 * @type {Integer (UInt32)}
 */
export global WMDMID_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MAC_LENGTH := 8

/**
 * @type {Integer (Int32)}
 */
export global WMDM_S_NOT_ALL_PROPERTIES_APPLIED := 282625

/**
 * @type {Integer (Int32)}
 */
export global WMDM_S_NOT_ALL_PROPERTIES_RETRIEVED := 282626

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_BUSY := -2147201024

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_INTERFACEDEAD := -2147201023

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_INVALIDTYPE := -2147201022

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_PROCESSFAILED := -2147201021

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_NOTSUPPORTED := -2147201020

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_NOTCERTIFIED := -2147201019

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_NORIGHTS := -2147201018

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_CALL_OUT_OF_SEQUENCE := -2147201017

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_BUFFERTOOSMALL := -2147201016

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_MOREDATA := -2147201015

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_MAC_CHECK_FAILED := -2147201014

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_USER_CANCELLED := -2147201013

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_SDMI_TRIGGER := -2147201012

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_SDMI_NOMORECOPIES := -2147201011

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_REVOKED := -2147201010

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_LICENSE_NOTEXIST := -2147201009

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_INCORRECT_APPSEC := -2147201008

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_INCORRECT_RIGHTS := -2147201007

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_LICENSE_EXPIRED := -2147201006

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_CANTOPEN_PMSN_SERVICE_PIPE := -2147201005

/**
 * @type {Integer (Int32)}
 */
export global WMDM_E_TOO_MANY_SESSIONS := -2147201005

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_WMDM_REVOKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_APP_REVOKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SP_REVOKED := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SCP_REVOKED := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_GET_FORMAT_SUPPORT_AUDIO := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_GET_FORMAT_SUPPORT_VIDEO := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_GET_FORMAT_SUPPORT_FILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_PLAYBACKCOUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_EXPIRATIONDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_GROUPID := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_FREESERIALIDS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_NAMEDSERIALIDS := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_PLAYBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_RECORD := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_DECODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_ENCODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_STORAGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_VIRTUAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_SDMI := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_NONSDMI := 128

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_NONREENTRANT := 256

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_FILELISTRESYNC := 512

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICE_TYPE_VIEW_PREF_METADATAVIEW := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_POWER_CAP_BATTERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_POWER_CAP_EXTERNAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_POWER_IS_BATTERY := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_POWER_IS_EXTERNAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_POWER_PERCENT_AVAILABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_READY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_BUSY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_DEVICE_NOTPRESENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_DEVICECONTROL_PLAYING := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_DEVICECONTROL_RECORDING := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_DEVICECONTROL_PAUSED := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_DEVICECONTROL_REMOTE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_DEVICECONTROL_STREAM := 128

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGE_NOTPRESENT := 256

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGE_INITIALIZING := 512

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGE_BROKEN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGE_NOTSUPPORTED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGE_UNFORMATTED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGECONTROL_INSERTING := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGECONTROL_DELETING := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGECONTROL_APPENDING := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGECONTROL_MOVING := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STATUS_STORAGECONTROL_READING := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANPLAY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANSTREAMPLAY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANRECORD := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANSTREAMRECORD := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANPAUSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANRESUME := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANSTOP := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_CANSEEK := 128

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_DEVICECAP_HASSECURECLOCK := 256

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SEEK_REMOTECONTROL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SEEK_STREAMINGAUDIO := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_FILESYSTEM := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_REMOVABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_NONREMOVABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_FOLDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_LINK := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_FILE := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_VIDEO := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_CANEDITMETADATA := 128

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_FOLDERS := 256

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_AUDIO := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_DATA := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_CANPLAY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_CANDELETE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_CANMOVE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_CANRENAME := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_CANREAD := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_MUSIC := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_CREATE_OVERWRITE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_AUDIOBOOK := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_HIDDEN := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_SYSTEM := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_FILE_ATTR_READONLY := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_HAS_FOLDERS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_HAS_FILES := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_IS_DEFAULT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_CONTAINS_DEFAULT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGE_ATTR_VIRTUAL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_FOLDERSINROOT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_FILESINROOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_FOLDERSINFOLDERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_FILESINFOLDERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_FOLDERLIMITEXISTS := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_FILELIMITEXISTS := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECAP_NOT_INITIALIZABLE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_BLOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_THREAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_CONTENT_FILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_CONTENT_FOLDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_CONTENT_OPERATIONINTERFACE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_QUERY := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_PROGRESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_TRANSFER_PROTECTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_TRANSFER_UNPROTECTED := 256

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECONTROL_INSERTBEFORE := 512

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECONTROL_INSERTAFTER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_STORAGECONTROL_INSERTINTO := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_MODE_RECURSIVE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_PLAY_ON_PC := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_COPY_TO_NON_SDMI_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_COPY_TO_CD := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_RIGHTS_COPY_TO_SDMI_DEVICE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SEEK_BEGIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SEEK_CURRENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_SEEK_END := 8

/**
 * @type {Integer (UInt32)}
 */
export global DO_NOT_VIRTUALIZE_STORAGES_AS_DEVICES := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALLOW_OUTOFBAND_NOTIFICATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDSP_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDSP_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDSP_SEEK_BOF := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDSP_SEEK_CUR := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDSP_SEEK_EOF := 4

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_EXAMINE_EXTENSION := 1

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_EXAMINE_DATA := 2

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_DECIDE_DATA := 8

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_PROTECTED_OUTPUT := 16

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_UNPROTECTED_OUTPUT := 32

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_RIGHTS_DATA := 64

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_TRANSFER_OBJECTDATA := 32

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_NO_MORE_CHANGES := 64

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_DRMINFO_NOT_DRMPROTECTED := 0

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_DRMINFO_V1HEADER := 1

/**
 * @type {Integer (Int32)}
 */
export global WMDM_SCP_DRMINFO_V2HEADER := 2

/**
 * @type {Guid}
 */
export global SCP_EVENTID_ACQSECURECLOCK := Guid("{86248cc9-4a59-43e2-9146-48a7f3f4140c}")

/**
 * @type {Guid}
 */
export global SCP_EVENTID_NEEDTOINDIV := Guid("{87a507c7-b469-4386-b976-d5d1ce538a6f}")

/**
 * @type {Guid}
 */
export global SCP_EVENTID_DRMINFO := Guid("{213dd287-41d2-432b-9e3f-3b4f7b3581dd}")

/**
 * @type {Guid}
 */
export global SCP_PARAMID_DRMVERSION := Guid("{41d0155d-7cc7-4217-ada9-005074624da4}")

/**
 * @type {Integer (UInt32)}
 */
export global SAC_MAC_LEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_LOG_SEV_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_LOG_SEV_WARN := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_LOG_SEV_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMDM_LOG_NOTIMESTAMP := 16

/**
 * @type {String}
 */
export global g_wszWMDMFileName := "WMDM/FileName"

/**
 * @type {String}
 */
export global g_wszWMDMFormatCode := "WMDM/FormatCode"

/**
 * @type {String}
 */
export global g_wszWMDMLastModifiedDate := "WMDM/LastModifiedDate"

/**
 * @type {String}
 */
export global g_wszWMDMFileCreationDate := "WMDM/FileCreationDate"

/**
 * @type {String}
 */
export global g_wszWMDMFileSize := "WMDM/FileSize"

/**
 * @type {String}
 */
export global g_wszWMDMFileAttributes := "WMDM/FileAttributes"

/**
 * @type {String}
 */
export global g_wszAudioWAVECodec := "WMDM/AudioWAVECodec"

/**
 * @type {String}
 */
export global g_wszVideoFourCCCodec := "WMDM/VideoFourCCCodec"

/**
 * @type {String}
 */
export global g_wszWMDMTitle := "WMDM/Title"

/**
 * @type {String}
 */
export global g_wszWMDMAuthor := "WMDM/Author"

/**
 * @type {String}
 */
export global g_wszWMDMDescription := "WMDM/Description"

/**
 * @type {String}
 */
export global g_wszWMDMIsProtected := "WMDM/IsProtected"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumTitle := "WMDM/AlbumTitle"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumArtist := "WMDM/AlbumArtist"

/**
 * @type {String}
 */
export global g_wszWMDMTrack := "WMDM/Track"

/**
 * @type {String}
 */
export global g_wszWMDMGenre := "WMDM/Genre"

/**
 * @type {String}
 */
export global g_wszWMDMTrackMood := "WMDM/TrackMood"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumCoverFormat := "WMDM/AlbumCoverFormat"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumCoverSize := "WMDM/AlbumCoverSize"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumCoverHeight := "WMDM/AlbumCoverHeight"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumCoverWidth := "WMDM/AlbumCoverWidth"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumCoverDuration := "WMDM/AlbumCoverDuration"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumCoverData := "WMDM/AlbumCoverData"

/**
 * @type {String}
 */
export global g_wszWMDMYear := "WMDM/Year"

/**
 * @type {String}
 */
export global g_wszWMDMComposer := "WMDM/Composer"

/**
 * @type {String}
 */
export global g_wszWMDMCodec := "WMDM/Codec"

/**
 * @type {String}
 */
export global g_wszWMDMDRMId := "WMDM/DRMId"

/**
 * @type {String}
 */
export global g_wszWMDMBitrate := "WMDM/Bitrate"

/**
 * @type {String}
 */
export global g_wszWMDMBitRateType := "WMDM/BitRateType"

/**
 * @type {String}
 */
export global g_wszWMDMSampleRate := "WMDM/SampleRate"

/**
 * @type {String}
 */
export global g_wszWMDMNumChannels := "WMDM/NumChannels"

/**
 * @type {String}
 */
export global g_wszWMDMBlockAlignment := "WMDM/BlockAlignment"

/**
 * @type {String}
 */
export global g_wszWMDMAudioBitDepth := "WMDM/AudioBitDepth"

/**
 * @type {String}
 */
export global g_wszWMDMTotalBitrate := "WMDM/TotalBitrate"

/**
 * @type {String}
 */
export global g_wszWMDMVideoBitrate := "WMDM/VideoBitrate"

/**
 * @type {String}
 */
export global g_wszWMDMFrameRate := "WMDM/FrameRate"

/**
 * @type {String}
 */
export global g_wszWMDMScanType := "WMDM/ScanType"

/**
 * @type {String}
 */
export global g_wszWMDMKeyFrameDistance := "WMDM/KeyFrameDistance"

/**
 * @type {String}
 */
export global g_wszWMDMBufferSize := "WMDM/BufferSize"

/**
 * @type {String}
 */
export global g_wszWMDMQualitySetting := "WMDM/QualitySetting"

/**
 * @type {String}
 */
export global g_wszWMDMEncodingProfile := "WMDM/EncodingProfile"

/**
 * @type {String}
 */
export global g_wszWMDMDuration := "WMDM/Duration"

/**
 * @type {String}
 */
export global g_wszWMDMAlbumArt := "WMDM/AlbumArt"

/**
 * @type {String}
 */
export global g_wszWMDMBuyNow := "WMDM/BuyNow"

/**
 * @type {String}
 */
export global g_wszWMDMNonConsumable := "WMDM/NonConsumable"

/**
 * @type {String}
 */
export global g_wszWMDMediaClassPrimaryID := "WMDM/MediaClassPrimaryID"

/**
 * @type {String}
 */
export global g_wszWMDMMediaClassSecondaryID := "WMDM/MediaClassSecondaryID"

/**
 * @type {String}
 */
export global g_wszWMDMUserEffectiveRating := "WMDM/UserEffectiveRating"

/**
 * @type {String}
 */
export global g_wszWMDMUserRating := "WMDM/UserRating"

/**
 * @type {String}
 */
export global g_wszWMDMUserRatingOnDevice := "WMDM/UserRatingOnDevice"

/**
 * @type {String}
 */
export global g_wszWMDMPlayCount := "WMDM/PlayCount"

/**
 * @type {String}
 */
export global g_wszWMDMDevicePlayCount := "WMDM/DevicePlayCount"

/**
 * @type {String}
 */
export global g_wszWMDMAuthorDate := "WMDM/AuthorDate"

/**
 * @type {String}
 */
export global g_wszWMDMUserLastPlayTime := "WMDM/UserLastPlayTime"

/**
 * @type {String}
 */
export global g_wszWMDMSubTitle := "WMDM/SubTitle"

/**
 * @type {String}
 */
export global g_wszWMDMSubTitleDescription := "WMDM/SubTitleDescription"

/**
 * @type {String}
 */
export global g_wszWMDMMediaCredits := "WMDM/MediaCredits"

/**
 * @type {String}
 */
export global g_wszWMDMMediaStationName := "WMDM/MediaStationName"

/**
 * @type {String}
 */
export global g_wszWMDMMediaOriginalChannel := "WMDM/MediaOriginalChannel"

/**
 * @type {String}
 */
export global g_wszWMDMMediaOriginalBroadcastDateTime := "WMDM/MediaOriginalBroadcastDateTime"

/**
 * @type {String}
 */
export global g_wszWMDMProviderCopyright := "WMDM/ProviderCopyright"

/**
 * @type {String}
 */
export global g_wszWMDMSyncID := "WMDM/SyncID"

/**
 * @type {String}
 */
export global g_wszWMDMPersistentUniqueID := "WMDM/PersistentUniqueID"

/**
 * @type {String}
 */
export global g_wszWMDMWidth := "WMDM/Width"

/**
 * @type {String}
 */
export global g_wszWMDMHeight := "WMDM/Height"

/**
 * @type {String}
 */
export global g_wszWMDMSyncTime := "WMDM/SyncTime"

/**
 * @type {String}
 */
export global g_wszWMDMParentalRating := "WMDM/ParentalRating"

/**
 * @type {String}
 */
export global g_wszWMDMMetaGenre := "WMDM/MetaGenre"

/**
 * @type {String}
 */
export global g_wszWMDMIsRepeat := "WMDM/IsRepeat"

/**
 * @type {String}
 */
export global g_wszWMDMSupportedDeviceProperties := "WMDM/SupportedDeviceProperties"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceFriendlyName := "WMDM/DeviceFriendlyName"

/**
 * @type {String}
 */
export global g_wszWMDMFormatsSupported := "WMDM/FormatsSupported"

/**
 * @type {String}
 */
export global g_wszWMDMFormatsSupportedAreOrdered := "WMDM/FormatsSupportedAreOrdered"

/**
 * @type {String}
 */
export global g_wszWMDMSyncRelationshipID := "WMDM/SyncRelationshipID"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceModelName := "WMDM/DeviceModelName"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceFirmwareVersion := "WMDM/DeviceFirmwareVersion"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceVendorExtension := "WMDM/DeviceVendorExtension"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceProtocol := "WMDM/DeviceProtocol"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceServiceProviderVendor := "WMDM/DeviceServiceProviderVendor"

/**
 * @type {String}
 */
export global g_wszWMDMDeviceRevocationInfo := "WMDM/DeviceRevocationInfo"

/**
 * @type {String}
 */
export global g_wszWMDMCollectionID := "WMDM/CollectionID"

/**
 * @type {String}
 */
export global g_wszWMDMOwner := "WMDM/Owner"

/**
 * @type {String}
 */
export global g_wszWMDMEditor := "WMDM/Editor"

/**
 * @type {String}
 */
export global g_wszWMDMWebmaster := "WMDM/Webmaster"

/**
 * @type {String}
 */
export global g_wszWMDMSourceURL := "WMDM/SourceURL"

/**
 * @type {String}
 */
export global g_wszWMDMDestinationURL := "WMDM/DestinationURL"

/**
 * @type {String}
 */
export global g_wszWMDMCategory := "WMDM/Category"

/**
 * @type {String}
 */
export global g_wszWMDMTimeBookmark := "WMDM/TimeBookmark"

/**
 * @type {String}
 */
export global g_wszWMDMObjectBookmark := "WMDM/ObjectBookmark"

/**
 * @type {String}
 */
export global g_wszWMDMByteBookmark := "WMDM/ByteBookmark"

/**
 * @type {String}
 */
export global g_wszWMDMDataOffset := "WMDM/DataOffset"

/**
 * @type {String}
 */
export global g_wszWMDMDataLength := "WMDM/DataLength"

/**
 * @type {String}
 */
export global g_wszWMDMDataUnits := "WMDM/DataUnits"

/**
 * @type {String}
 */
export global g_wszWMDMTimeToLive := "WMDM/TimeToLive"

/**
 * @type {String}
 */
export global g_wszWMDMMediaGuid := "WMDM/MediaGuid"

/**
 * @type {String}
 */
export global g_wszWPDPassthroughPropertyValues := "WPD/PassthroughPropertyValues"

/**
 * @type {Guid}
 */
export global EVENT_WMDM_CONTENT_TRANSFER := Guid("{339c9bf4-bcfe-4ed8-94df-eaf8c26ab61b}")

/**
 * @type {Integer (UInt32)}
 */
export global MTP_COMMAND_MAX_PARAMS := 5

/**
 * @type {Integer (UInt32)}
 */
export global MTP_RESPONSE_MAX_PARAMS := 5

/**
 * @type {Integer (UInt16)}
 */
export global MTP_RESPONSE_OK := 8193
;@endregion Constants
