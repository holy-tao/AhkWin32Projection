#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about contacting someone by using email.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_emailcontactevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_EMAILCONTACTEVENT extends Win32Enum{

    /**
     * The name of the application used for the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_APPNAME => 0

    /**
     * The version of the application used for the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_APPVERSION => 1

    /**
     * The previous name of the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_OLDNAME => 2

    /**
     * The previous ID of the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_OLDID => 3

    /**
     * The new name of the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_NEWNAME => 4

    /**
     * The new ID of the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_NEWID => 5

    /**
     * The reason given for the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_REASON => 6

    /**
     * The email account used for the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_EMAILACCOUNT => 7

    /**
     * The arguments for the email contact.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_EMAILCONTACTEVENT_CARGS => 8
}
