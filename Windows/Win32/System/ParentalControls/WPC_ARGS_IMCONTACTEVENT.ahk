#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about contacting someone by using an instant messaging application.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_imcontactevent
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_IMCONTACTEVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The name of the application used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_APPNAME => 0

    /**
     * The version of the application used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_APPVERSION => 1

    /**
     * The account name used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_ACCOUNTNAME => 2

    /**
     * The previous name of the contact used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_OLDNAME => 3

    /**
     * The previous ID of the contact used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_OLDID => 4

    /**
     * The new name of the contact used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_NEWNAME => 5

    /**
     * The new ID of the contact used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_NEWID => 6

    /**
     * The reason used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_REASON => 7

    /**
     * The arguments used for the instant message.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_IMCONTACTEVENT_CARGS => 8
}
