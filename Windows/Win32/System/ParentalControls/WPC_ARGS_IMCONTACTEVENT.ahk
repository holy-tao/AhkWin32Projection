#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about contacting someone by using an instant messaging application.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_imcontactevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_IMCONTACTEVENT extends Win32Enum {

    /**
     * The name of the application used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The account name used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_ACCOUNTNAME
     * @type {Integer (Int32)}
     */
    static ACCOUNTNAME => 2

    /**
     * The previous name of the contact used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_OLDNAME
     * @type {Integer (Int32)}
     */
    static OLDNAME => 3

    /**
     * The previous ID of the contact used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_OLDID
     * @type {Integer (Int32)}
     */
    static OLDID => 4

    /**
     * The new name of the contact used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_NEWNAME
     * @type {Integer (Int32)}
     */
    static NEWNAME => 5

    /**
     * The new ID of the contact used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_NEWID
     * @type {Integer (Int32)}
     */
    static NEWID => 6

    /**
     * The reason used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 7

    /**
     * The arguments used for the instant message.
     * Native name: WPC_ARGS_IMCONTACTEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 8
}
