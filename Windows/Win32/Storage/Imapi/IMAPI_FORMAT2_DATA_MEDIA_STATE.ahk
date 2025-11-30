#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the possible media states.
 * @remarks
 * 
 * This enumeration should be treated as a bitmask. Nearly all of the values set one bit set to one and the other bits to  zero.  Three exceptions to this rule were added: unknown, unsupported media mask, and informational mask.  For example, to test for unsupported media, check the value against IMAPI_FORMAT2_DATA_MEDIA_STATE_UNSUPPORTED_MASK.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_format2_data_media_state
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_FORMAT2_DATA_MEDIA_STATE extends Win32Enum{

    /**
     * Indicates that the interface does not know the media state.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_UNKNOWN => 0

    /**
     * Reports information (but not errors) about the media state.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_INFORMATIONAL_MASK => 15

    /**
     * Reports an unsupported media state.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_UNSUPPORTED_MASK => 64512

    /**
     * Write operations can occur on used portions of the disc.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_OVERWRITE_ONLY => 1

    /**
     * Media is randomly writable.  This indicates that a single session can be written to this disc.
     * 
     * <div class="alert"><b>Note</b>  This value is deprecated and superseded by <b>IMAPI_FORMAT2_DATA_MEDIA_STATE_OVERWRITE_ONLY</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_RANDOMLY_WRITABLE => 1

    /**
     * Media has never been used, or has been erased.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_BLANK => 2

    /**
     * Media is appendable (supports multiple sessions).
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_APPENDABLE => 4

    /**
     * Media can have only one additional session added to it, or the media does not support multiple sessions.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_FINAL_SESSION => 8

    /**
     * Media is not usable by this interface.  The media might require an erase or other recovery.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_DAMAGED => 1024

    /**
     * Media must be erased prior to use by this interface.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_ERASE_REQUIRED => 2048

    /**
     * Media has a partially written last session, which is not supported by this interface.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_NON_EMPTY_SESSION => 4096

    /**
     * Media or drive is write-protected.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_WRITE_PROTECTED => 8192

    /**
     * Media cannot be written to (finalized).
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_FINALIZED => 16384

    /**
     * Media is not supported by this interface.
     * @type {Integer (Int32)}
     */
    static IMAPI_FORMAT2_DATA_MEDIA_STATE_UNSUPPORTED_MEDIA => 32768
}
