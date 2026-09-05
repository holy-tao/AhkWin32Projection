#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about contacting someone by using email.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_emailcontactevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_EMAILCONTACTEVENT extends Win32Enum {

    /**
     * The name of the application used for the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used for the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The previous name of the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_OLDNAME
     * @type {Integer (Int32)}
     */
    static OLDNAME => 2

    /**
     * The previous ID of the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_OLDID
     * @type {Integer (Int32)}
     */
    static OLDID => 3

    /**
     * The new name of the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_NEWNAME
     * @type {Integer (Int32)}
     */
    static NEWNAME => 4

    /**
     * The new ID of the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_NEWID
     * @type {Integer (Int32)}
     */
    static NEWID => 5

    /**
     * The reason given for the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 6

    /**
     * The email account used for the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_EMAILACCOUNT
     * @type {Integer (Int32)}
     */
    static EMAILACCOUNT => 7

    /**
     * The arguments for the email contact.
     * Native name: WPC_ARGS_EMAILCONTACTEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 8
}
