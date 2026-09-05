#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about what events are blocked from use and what controls are in place.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpcflag_isblocked
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPCFLAG_ISBLOCKED extends Win32Enum {

    /**
     * No events are blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_NOTBLOCKED
     * @type {Integer (Int32)}
     */
    static NOTBLOCKED => 0

    /**
     * Instant messaging is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_IMBLOCKED
     * @type {Integer (Int32)}
     */
    static IMBLOCKED => 1

    /**
     * Email access is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_EMAILBLOCKED
     * @type {Integer (Int32)}
     */
    static EMAILBLOCKED => 2

    /**
     * Playing of media files is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_MEDIAPLAYBACKBLOCKED
     * @type {Integer (Int32)}
     */
    static MEDIAPLAYBACKBLOCKED => 4

    /**
     * Internet access is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_WEBBLOCKED
     * @type {Integer (Int32)}
     */
    static WEBBLOCKED => 8

    /**
     * Games are blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_GAMESBLOCKED
     * @type {Integer (Int32)}
     */
    static GAMESBLOCKED => 16

    /**
     * The contacts list is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_CONTACTBLOCKED
     * @type {Integer (Int32)}
     */
    static CONTACTBLOCKED => 32

    /**
     * Features are blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_FEATUREBLOCKED
     * @type {Integer (Int32)}
     */
    static FEATUREBLOCKED => 64

    /**
     * The ability to download files is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_DOWNLOADBLOCKED
     * @type {Integer (Int32)}
     */
    static DOWNLOADBLOCKED => 128

    /**
     * Content with a specified rating is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_RATINGBLOCKED
     * @type {Integer (Int32)}
     */
    static RATINGBLOCKED => 256

    /**
     * The description of the content is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_DESCRIPTORBLOCKED
     * @type {Integer (Int32)}
     */
    static DESCRIPTORBLOCKED => 512

    /**
     * Explicit content is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_EXPLICITBLOCK
     * @type {Integer (Int32)}
     */
    static EXPLICITBLOCK => 1024

    /**
     * The user has entered a password that is not valid.
     * Native name: WPCFLAG_ISBLOCKED_BADPASS
     * @type {Integer (Int32)}
     */
    static BADPASS => 2048

    /**
     * The user has reached the maximum number of hours allowed for computer access.
     * Native name: WPCFLAG_ISBLOCKED_MAXHOURS
     * @type {Integer (Int32)}
     */
    static MAXHOURS => 4096

    /**
     * The user is blocked from computer access because the time is outside of the specified hours allowed for this user.
     * Native name: WPCFLAG_ISBLOCKED_SPECHOURS
     * @type {Integer (Int32)}
     */
    static SPECHOURS => 8192

    /**
     * The user is blocked from changing any computer settings.
     * Native name: WPCFLAG_ISBLOCKED_SETTINGSCHANGEBLOCKED
     * @type {Integer (Int32)}
     */
    static SETTINGSCHANGEBLOCKED => 16384

    /**
     * An attachment is blocked from the user.
     * Native name: WPCFLAG_ISBLOCKED_ATTACHMENTBLOCKED
     * @type {Integer (Int32)}
     */
    static ATTACHMENTBLOCKED => 32768

    /**
     * The user is blocked from sending any information to the specified account.
     * Native name: WPCFLAG_ISBLOCKED_SENDERBLOCKED
     * @type {Integer (Int32)}
     */
    static SENDERBLOCKED => 65536

    /**
     * The user is blocked from receiving any information from the specified account.
     * Native name: WPCFLAG_ISBLOCKED_RECEIVERBLOCKED
     * @type {Integer (Int32)}
     */
    static RECEIVERBLOCKED => 131072

    /**
     * The user is blocked because the feature is not explicitly allowed.
     * Native name: WPCFLAG_ISBLOCKED_NOTEXPLICITLYALLOWED
     * @type {Integer (Int32)}
     */
    static NOTEXPLICITLYALLOWED => 262144

    /**
     * The user is blocked because the feature is not listed as accessible.
     * Native name: WPCFLAG_ISBLOCKED_NOTINLIST
     * @type {Integer (Int32)}
     */
    static NOTINLIST => 524288

    /**
     * The user is blocked from accessing the entire category of activity.
     * Native name: WPCFLAG_ISBLOCKED_CATEGORYBLOCKED
     * @type {Integer (Int32)}
     */
    static CATEGORYBLOCKED => 1048576

    /**
     * The user is blocked because the category is not listed as accessible.
     * Native name: WPCFLAG_ISBLOCKED_CATEGORYNOTINLIST
     * @type {Integer (Int32)}
     */
    static CATEGORYNOTINLIST => 2097152

    /**
     * The user is blocked because the rating specifies that the content is not suitable for children.
     * Native name: WPCFLAG_ISBLOCKED_NOTKIDS
     * @type {Integer (Int32)}
     */
    static NOTKIDS => 4194304

    /**
     * The user is blocked because the content is not rated.
     * Native name: WPCFLAG_ISBLOCKED_UNRATED
     * @type {Integer (Int32)}
     */
    static UNRATED => 8388608

    /**
     * The user is blocked from any access.
     * Native name: WPCFLAG_ISBLOCKED_NOACCESS
     * @type {Integer (Int32)}
     */
    static NOACCESS => 16777216

    /**
     * The user is blocked by an internal error.
     * Native name: WPCFLAG_ISBLOCKED_INTERNALERROR
     * @type {Integer (Int32)}
     */
    static INTERNALERROR => -1
}
