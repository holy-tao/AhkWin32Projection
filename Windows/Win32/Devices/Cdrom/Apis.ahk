#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class Cdrom {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static IOCTL_CDROM_BASE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_UNLOAD_DRIVER => 151560

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_READ_TOC => 147456

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_SEEK_AUDIO_MSF => 147460

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_STOP_AUDIO => 147464

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_PAUSE_AUDIO => 147468

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_RESUME_AUDIO => 147472

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_VOLUME => 147476

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_PLAY_AUDIO_MSF => 147480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_SET_VOLUME => 147496

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_READ_Q_CHANNEL => 147500

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_CONTROL => 147508

    /**
     * @type {Integer (UInt32)}
     */
    static OBSOLETE_IOCTL_CDROM_GET_CONTROL => 147508

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_LAST_SESSION => 147512

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_RAW_READ => 147518

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_DISK_TYPE => 131136

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_DRIVE_GEOMETRY => 147532

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_DRIVE_GEOMETRY_EX => 147536

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_READ_TOC_EX => 147540

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_CONFIGURATION => 147544

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_EXCLUSIVE_ACCESS => 180316

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_SET_SPEED => 147552

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_INQUIRY_DATA => 147556

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_ENABLE_STREAMING => 147560

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_SEND_OPC_INFORMATION => 180332

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_GET_PERFORMANCE => 147568

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_CHECK_VERIFY => 149504

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_MEDIA_REMOVAL => 149508

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_EJECT_MEDIA => 149512

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_LOAD_MEDIA => 149516

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_RESERVE => 149520

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_RELEASE => 149524

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_FIND_NEW_DEVICES => 149528

    /**
     * @type {Integer (UInt32)}
     */
    static MINIMUM_CDROM_INQUIRY_SIZE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_CDROM_INQUIRY_SIZE => 260

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_SIMBAD => 147468

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_NUMBER_TRACKS => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_CDROM_SIZE => 804

    /**
     * @type {Integer (UInt32)}
     */
    static MINIMUM_CDROM_READ_TOC_EX_SIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_READ_TOC_EX_FORMAT_TOC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_READ_TOC_EX_FORMAT_SESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_READ_TOC_EX_FORMAT_FULL_TOC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_READ_TOC_EX_FORMAT_PMA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_READ_TOC_EX_FORMAT_ATIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_READ_TOC_EX_FORMAT_CDTEXT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_ALBUM_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_PERFORMER => 129

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_SONGWRITER => 130

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_COMPOSER => 131

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_ARRANGER => 132

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_MESSAGES => 133

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_DISC_ID => 134

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_GENRE => 135

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_TOC_INFO => 136

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_TOC_INFO2 => 137

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_UPC_EAN => 142

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_CD_TEXT_PACK_SIZE_INFO => 143

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_DISK_AUDIO_TRACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_DISK_DATA_TRACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_SUB_Q_CHANNEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_CURRENT_POSITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_MEDIA_CATALOG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CDROM_TRACK_ISRC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_STATUS_NOT_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_STATUS_IN_PROGRESS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_STATUS_PAUSED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_STATUS_PLAY_COMPLETE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_STATUS_PLAY_ERROR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_STATUS_NO_STATUS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ADR_NO_MODE_INFORMATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ADR_ENCODES_CURRENT_POSITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADR_ENCODES_MEDIA_CATALOG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ADR_ENCODES_ISRC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_WITH_PREEMPHASIS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIGITAL_COPY_PERMITTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIO_DATA_TRACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TWO_FOUR_CHANNEL_AUDIO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CD_RAW_READ_C2_SIZE => 296

    /**
     * @type {Integer (UInt32)}
     */
    static CD_RAW_READ_SUBCODE_SIZE => 96

    /**
     * @type {Integer (UInt32)}
     */
    static CD_RAW_SECTOR_WITH_C2_SIZE => 2648

    /**
     * @type {Integer (UInt32)}
     */
    static CD_RAW_SECTOR_WITH_SUBCODE_SIZE => 2448

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_EXCLUSIVE_CALLER_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_LOCK_IGNORE_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_NO_MEDIA_NOTIFICATIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_NOT_IN_EXCLUSIVE_MODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CDROM_IN_EXCLUSIVE_MODE => 1
;@endregion Constants

;@region Methods
;@endregion Methods
}
