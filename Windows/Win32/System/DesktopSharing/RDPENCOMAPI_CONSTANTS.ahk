#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for some of the constants used in this API.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/ne-rdpencomapi-rdpencomapi_constants
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPENCOMAPI_CONSTANTS{

    /**
     * Maximum message size, in bytes.
     * @type {Integer (Int32)}
     */
    static CONST_MAX_CHANNEL_MESSAGE_SIZE => 1024

    /**
     * Maximum length (including the null terminator) of a channel name, in characters.
 * 
 * Note that the legacy channel names are limited to 32 characters.
     * @type {Integer (Int32)}
     */
    static CONST_MAX_CHANNEL_NAME_LEN => 8

    /**
     * Maximum message size for a legacy channel, in bytes.
 * 
 * Use this constant if <b>CHANNEL_FLAGS_LEGACY</b> is set.
     * @type {Integer (Int32)}
     */
    static CONST_MAX_LEGACY_CHANNEL_MESSAGE_SIZE => 409600

    /**
     * Indicates all attendees.
     * @type {Integer (Int32)}
     */
    static CONST_ATTENDEE_ID_EVERYONE => -1

    /**
     * Identifies the host. Used to send a virtual channel message to the host.
     * @type {Integer (Int32)}
     */
    static CONST_ATTENDEE_ID_HOST => 0

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static CONST_CONN_INTERVAL => 50

    /**
     * The default value for the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapiattendee">IRDPSRAPIAttendee</a>::<a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_id">Id</a> property.
 * 
 * <b>Windows Server 2012 R2, Windows 8.1, Windows Server 2012, Windows 8, Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This enumeration value is not supported before Windows 10 and Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CONST_ATTENDEE_ID_DEFAULT => -1
}
