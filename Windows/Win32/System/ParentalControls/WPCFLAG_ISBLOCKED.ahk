#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about what events are blocked from use and what controls are in place.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpcflag_isblocked
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_ISBLOCKED extends Win32Enum{

    /**
     * No events are blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_NOTBLOCKED => 0

    /**
     * Instant messaging is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_IMBLOCKED => 1

    /**
     * Email access is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_EMAILBLOCKED => 2

    /**
     * Playing of media files is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_MEDIAPLAYBACKBLOCKED => 4

    /**
     * Internet access is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_WEBBLOCKED => 8

    /**
     * Games are blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_GAMESBLOCKED => 16

    /**
     * The contacts list is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_CONTACTBLOCKED => 32

    /**
     * Features are blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_FEATUREBLOCKED => 64

    /**
     * The ability to download files is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_DOWNLOADBLOCKED => 128

    /**
     * Content with a specified rating is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_RATINGBLOCKED => 256

    /**
     * The description of the content is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_DESCRIPTORBLOCKED => 512

    /**
     * Explicit content is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_EXPLICITBLOCK => 1024

    /**
     * The user has entered a password that is not valid.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_BADPASS => 2048

    /**
     * The user has reached the maximum number of hours allowed for computer access.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_MAXHOURS => 4096

    /**
     * The user is blocked from computer access because the time is outside of the specified hours allowed for this user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_SPECHOURS => 8192

    /**
     * The user is blocked from changing any computer settings.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_SETTINGSCHANGEBLOCKED => 16384

    /**
     * An attachment is blocked from the user.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_ATTACHMENTBLOCKED => 32768

    /**
     * The user is blocked from sending any information to the specified account.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_SENDERBLOCKED => 65536

    /**
     * The user is blocked from receiving any information from the specified account.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_RECEIVERBLOCKED => 131072

    /**
     * The user is blocked because the feature is not explicitly allowed.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_NOTEXPLICITLYALLOWED => 262144

    /**
     * The user is blocked because the feature is not listed as accessible.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_NOTINLIST => 524288

    /**
     * The user is blocked from accessing the entire category of activity.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_CATEGORYBLOCKED => 1048576

    /**
     * The user is blocked because the category is not listed as accessible.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_CATEGORYNOTINLIST => 2097152

    /**
     * The user is blocked because the rating specifies that the content is not suitable for children.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_NOTKIDS => 4194304

    /**
     * The user is blocked because the content is not rated.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_UNRATED => 8388608

    /**
     * The user is blocked from any access.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_NOACCESS => 16777216

    /**
     * The user is blocked by an internal error.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_ISBLOCKED_INTERNALERROR => -1
}
