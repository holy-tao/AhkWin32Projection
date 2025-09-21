#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class PictureAcquisition {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static PROGRESS_INDETERMINATE => -1

    /**
     * @type {Integer (Int32)}
     */
    static PHOTOACQ_ERROR_RESTART_REQUIRED => -2147180543

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_RUN_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_NO_GALLERY_LAUNCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_AUTO_ROTATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_PLUGINS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_GROUP_TAG_PROMPT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_DB_INTEGRATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DELETE_AFTER_ACQUIRE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_DUPLICATE_DETECTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_ENABLE_THUMBNAIL_CACHING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_METADATA_WRITE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_THUMBNAIL_PROGRESS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_DISABLE_SETTINGS_LINK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_ABORT_ON_SETTINGS_UPDATE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PHOTOACQ_IMPORT_VIDEO_AS_MULTIPLE_FILES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_WPD_DEVICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_WIA_CAMERAS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_WIA_SCANNERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_STI_DEVICES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_TWAIN_DEVICES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_FS_DEVICES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_DV_DEVICES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_ALL_DEVICES => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_CPL_MODE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DSF_SHOW_OFFLINE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PAPS_PRESAVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PAPS_POSTSAVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PAPS_CLEANUP => 2
;@endregion Constants

;@region Methods
;@endregion Methods
}
