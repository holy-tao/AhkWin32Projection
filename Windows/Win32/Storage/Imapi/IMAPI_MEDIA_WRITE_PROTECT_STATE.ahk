#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that indicate the media write protect status. One or more write protect values can be set on a given drive.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_media_write_protect_state
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_MEDIA_WRITE_PROTECT_STATE{

    /**
     * Power to the drive needs to be cycled before allowing writes to the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_WRITEPROTECTED_UNTIL_POWERDOWN => 1

    /**
     * The media is in a cartridge with the write protect tab set.
     * @type {Integer (Int32)}
     */
    static IMAPI_WRITEPROTECTED_BY_CARTRIDGE => 2

    /**
     * The drive is disallowing writes for a media-specific reason. For example:  <ul>
 * <li>The media was originally in a cartridge and was set to disallow writes when the media is not in a cartridge.</li>
 * <li>The media has used all available spare areas for defect management and is preventing writes to protect the existing data.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IMAPI_WRITEPROTECTED_BY_MEDIA_SPECIFIC_REASON => 4

    /**
     * A write-protect flag on the media is set. Various media types, such as DVD-RAM and DVD-RW, support a special area on the media to indicate the disc's write protect status.
     * @type {Integer (Int32)}
     */
    static IMAPI_WRITEPROTECTED_BY_SOFTWARE_WRITE_PROTECT => 8

    /**
     * A write-protect flag in the disc control block of a DVD+RW disc is set. DVD+RW media can persistently alter the write protect state of media by writing a device control block (DCB) to the media.  
 * 
 * This value has limited usefulness because some DVD+RW drives do not recognize or honor this setting.
     * @type {Integer (Int32)}
     */
    static IMAPI_WRITEPROTECTED_BY_DISC_CONTROL_BLOCK => 16

    /**
     * The drive does not recognize write capability of the media.
     * @type {Integer (Int32)}
     */
    static IMAPI_WRITEPROTECTED_READ_ONLY_MEDIA => 16384
}
