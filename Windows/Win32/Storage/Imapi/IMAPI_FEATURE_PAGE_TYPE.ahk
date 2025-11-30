#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the feature that are supported by the logical unit (CD and DVD device).
 * @remarks
 * 
 * Note that the range of feature type values is 0x0000 to 0xFFFF. This enumeration contains those features defined in the Multmedia Commands - 5 (MMC) specification. For a complete definition of each feature, see Feature Definitions in the latest release of the MMC specification at ftp://ftp.t10.org/t10/drafts/mmc5.
 * 
 * Other values not defined here may exist. Consumers of this enumeration should not presume this list to be the only set of valid values.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_feature_page_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_FEATURE_PAGE_TYPE extends Win32Enum{

    /**
     * Identifies profiles supported by the logical unit.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_PROFILE_LIST => 0

    /**
     * Identifies a logical unit that supports functionality common to all devices.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CORE => 1

    /**
     * Identifies the ability of the logical unit to notify an initiator about operational changes 
     * and accept initiator requests to prevent operational changes.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_MORPHING => 2

    /**
     * Identifies a logical unit that has a medium that is removable.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_REMOVABLE_MEDIUM => 3

    /**
     * Identifies reporting capability and changing capability for write protection status of the 
     * logical unit.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_WRITE_PROTECT => 4

    /**
     * Identifies a logical unit that is able to read data from logical blocks specified by Logical 
     * Block Addresses.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_RANDOMLY_READABLE => 16

    /**
     * Identifies a logical unit that conforms to the OSTA Multi-Read specification 1.00, with the exception of CD 
     * Play capability (the CD Audio Feature is not required).
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CD_MULTIREAD => 29

    /**
     * Identifies a logical unit that is able to read CD specific information from the media and 
     * is able to read user data from all types of CD blocks.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CD_READ => 30

    /**
     * Identifies a logical unit that is able to read DVD specific information from the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_READ => 31

    /**
     * Identifies a logical unit that is able to write data to logical blocks specified by Logical 
     * Block Addresses.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_RANDOMLY_WRITABLE => 32

    /**
     * Identifies a logical unit that is able to write data to a contiguous region, and is able to 
     * append data to a limited number of locations on the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_INCREMENTAL_STREAMING_WRITABLE => 33

    /**
     * Identifies a logical unit that supports erasable media and media that requires an erase 
     * pass before overwrite, such as some magneto-optical technologies.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_SECTOR_ERASABLE => 34

    /**
     * Identifies a logical unit that can format media into logical blocks.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_FORMATTABLE => 35

    /**
     * Identifies a logical unit that has defect management available to provide a 
     * defect-free contiguous address space.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_HARDWARE_DEFECT_MANAGEMENT => 36

    /**
     * Identifies a logical unit that has the ability to record to any previously unrecorded 
     * logical block.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_WRITE_ONCE => 37

    /**
     * Identifies a logical unit that has the ability to overwrite logical blocks only in fixed 
     * sets at a time.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_RESTRICTED_OVERWRITE => 38

    /**
     * Identifies a logical unit that has the ability to write CD-RW media that is designed for 
     * CAV recording.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CDRW_CAV_WRITE => 39

    /**
     * Indicates that the logical unit is capable of reading a disc with the 
     * MRW format.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_MRW => 40

    /**
     * Identifies a logical unit that has the ability to perform media 
     * certification and recovered error reporting for logical unit assisted software defect 
     * management.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_ENHANCED_DEFECT_REPORTING => 41

    /**
     * Indicates that the logical unit is capable of reading a 
     * recorded DVD+RW disc.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_PLUS_RW => 42

    /**
     * Indicates that the logical unit is capable of reading a recorded 
     * DVD+R disc.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_PLUS_R => 43

    /**
     * Identifies a logical unit that has the ability to perform writing only on Blocking 
     * boundaries.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_RIGID_RESTRICTED_OVERWRITE => 44

    /**
     * Identifies a logical unit that is able to write data to a CD track.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CD_TRACK_AT_ONCE => 45

    /**
     * Identifies a logical unit that is able to write a CD in Session at Once mode or Raw mode.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CD_MASTERING => 46

    /**
     * Identifies a logical unit that has the ability to write data to DVD-R/-RW in Disc at Once 
     * mode.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_DASH_WRITE => 47

    /**
     * Identifies a logical unit that has the ability to read double density CD specific information from the media.
     * 
     * <div class="alert"><b>Note</b>  This value has been deprecated.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DOUBLE_DENSITY_CD_READ => 48

    /**
     * Identifies a logical unit that has the ability to write to double density CD  media.
     * 
     * <div class="alert"><b>Note</b>  This value has been deprecated.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DOUBLE_DENSITY_CD_R_WRITE => 49

    /**
     * Identifies a logical unit that has the ability to write to double density CD-RW  media.
     * 
     * <div class="alert"><b>Note</b>  This value has been deprecated.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DOUBLE_DENSITY_CD_RW_WRITE => 50

    /**
     * Identifies a drive that is able to write data to contiguous regions that are allocated on multiple
     * layers, and is able to append data to a limited number of locations on the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_LAYER_JUMP_RECORDING => 51

    /**
     * Identifies a logical unit that has the ability to perform writing CD-RW media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CD_RW_MEDIA_WRITE_SUPPORT => 55

    /**
     * Identifies a drive that provides Logical Block overwrite service on BD-R discs that are
     * formatted as SRM+POW.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_BD_PSEUDO_OVERWRITE => 56

    /**
     * Indicates that the drive is capable of reading a 
     * recorded DVD+R Double Layer disc
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_PLUS_R_DUAL_LAYER => 59

    /**
     * Identifies a logical unit that is able to read control structures and user data from the Blu-ray 
     * disc.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_BD_READ => 64

    /**
     * Identifies a drive that is able to write control structures and user data to writeable Blu-ray discs.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_BD_WRITE => 65

    /**
     * Identifies a drive that is able to read HD DVD specific information from the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_HD_DVD_READ => 80

    /**
     * Indicates the ability to write to HD DVD-R/-RW media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_HD_DVD_WRITE => 81

    /**
     * Identifies a logical unit that is able to perform initiator and logical unit directed power 
     * management.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_POWER_MANAGEMENT => 256

    /**
     * Identifies a logical unit that is able to perform Self-Monitoring Analysis and Reporting 
     * Technology (S.M.A.R.T.).
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_SMART => 257

    /**
     * Identifies a logical unit that is able to move media from a storage area to a mechanism 
     * and back.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_EMBEDDED_CHANGER => 258

    /**
     * Identifies a logical unit that is able to play CD Audio data directly to an external output.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_CD_ANALOG_PLAY => 259

    /**
     * Identifies a logical unit that is able to upgrade its internal microcode via the interface.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_MICROCODE_UPDATE => 260

    /**
     * Identifies a logical unit that is able to always respond to commands within a set time 
     * period.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_TIMEOUT => 261

    /**
     * Identifies a logical unit that is able to perform DVD CSS/CPPM authentication and key 
     * management. This feature also indicates that the logical unit supports CSS for DVD-Video and CPPM for 
     * DVD-Audio.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_CSS => 262

    /**
     * Identifies a logical unit that is able to perform reading and writing within initiator 
     * specified (and logical unit verified) performance ranges.  This Feature also indicates whether the 
     * logical unit supports the stream playback operation.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_REAL_TIME_STREAMING => 263

    /**
     * Identifies a logical unit that has a unique serial number.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_LOGICAL_UNIT_SERIAL_NUMBER => 264

    /**
     * Identifies a logical unit that is capable of reading a media serial number of the currently 
     * installed media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_MEDIA_SERIAL_NUMBER => 265

    /**
     * Identifies a logical unit that is able to read and/or write Disc Control Blocks from or to 
     * the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DISC_CONTROL_BLOCKS => 266

    /**
     * Identifies a logical unit that is able to perform DVD CPRM and is able to perform CPRM 
     * authentication and key management.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_DVD_CPRM => 267

    /**
     * Indicates that the logical unit provides the date and time of the creation of the 
     * current firmware revision loaded on the device.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_FIRMWARE_INFORMATION => 268

    /**
     * Identifies a drive that supports AACS and is able to perform AACS authentication process.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_AACS => 269

    /**
     * Identifies a Drive that is able to process disc data structures that are specified in the
     * VCPS.
     * @type {Integer (Int32)}
     */
    static IMAPI_FEATURE_PAGE_TYPE_VCPS => 272
}
