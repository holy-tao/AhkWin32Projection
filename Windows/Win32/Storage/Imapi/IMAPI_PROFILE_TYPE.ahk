#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the possible profiles of a CD and DVD device. A profile defines the type of media and features that the device supports.
 * @remarks
 * 
 * Note that the range of feature type values is 0x0000 to 0xFFFF. This enumeration contains those features defined in the Multmedia Commands - 5 (MMC) specification. For a complete definition of each profile, see Profile Definitions in the latest release of the MMC specification at ftp://ftp.t10.org/t10/drafts/mmc5.
 * 
 * Other values not defined here may exist. Consumers of this enumeration should not presume this list to be the only set of valid values.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_profile_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_PROFILE_TYPE{

    /**
     * The profile is not valid.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_INVALID => 0

    /**
     * The hard disk it not removable.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_NON_REMOVABLE_DISK => 1

    /**
     * The hard disk is removable.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_REMOVABLE_DISK => 2

    /**
     * An Magneto-Optical Erasable drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_MO_ERASABLE => 3

    /**
     * A write once optical drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_MO_WRITE_ONCE => 4

    /**
     * An advance storage Magneto-Optical drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_AS_MO => 5

    /**
     * A CD-ROM drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_CDROM => 8

    /**
     * A CD-R drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_CD_RECORDABLE => 9

    /**
     * A CD-RW or CD+RW drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_CD_REWRITABLE => 10

    /**
     * A DVD-ROM drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVDROM => 16

    /**
     * A DVD-R sequential recording drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_DASH_RECORDABLE => 17

    /**
     * A DVD-RAM drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_RAM => 18

    /**
     * A DVD-RW restricted overwrite drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_DASH_REWRITABLE => 19

    /**
     * A DVD-RW sequential recording drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_DASH_RW_SEQUENTIAL => 20

    /**
     * A DVD-R dual layer sequential recording drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_DASH_R_DUAL_SEQUENTIAL => 21

    /**
     * A DVD-R dual layer jump recording drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_DASH_R_DUAL_LAYER_JUMP => 22

    /**
     * A DVD+RW drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_PLUS_RW => 26

    /**
     * A DVD+R drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_PLUS_R => 27

    /**
     * A double density CD drive.
 * 
 * <div class="alert"><b>Note</b>  This profile has been deprecated.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DDCDROM => 32

    /**
     * A double density CD-R drive.
 * 
 * <div class="alert"><b>Note</b>  This profile has been deprecated.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DDCD_RECORDABLE => 33

    /**
     * A double density CD-RW drive.
 * 
 * <div class="alert"><b>Note</b>  This profile has been deprecated.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DDCD_REWRITABLE => 34

    /**
     * A DVD+RW dual layer drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_PLUS_RW_DUAL => 42

    /**
     * A DVD+R dual layer drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_DVD_PLUS_R_DUAL => 43

    /**
     * A Blu-ray read only drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_BD_ROM => 64

    /**
     * A write once Blu-ray drive with sequential recording.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_BD_R_SEQUENTIAL => 65

    /**
     * A write once Blu-ray drive with random-access recording capability.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_BD_R_RANDOM_RECORDING => 66

    /**
     * A rewritable Blu-ray drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_BD_REWRITABLE => 67

    /**
     * A read only high density DVD drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_HD_DVD_ROM => 80

    /**
     * A write once high density DVD drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_HD_DVD_RECORDABLE => 81

    /**
     * A high density DVD drive with random access positioning.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_HD_DVD_RAM => 82

    /**
     * Nonstandard drive.
     * @type {Integer (Int32)}
     */
    static IMAPI_PROFILE_TYPE_NON_STANDARD => 65535
}
