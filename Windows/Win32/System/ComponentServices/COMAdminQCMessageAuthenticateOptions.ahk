#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminQCMessageAuthenticateOptions extends Win32Enum {

    /**
     * Native name: COMAdminQCMessageAuthenticateSecureApps
     * @type {Integer (Int32)}
     */
    static SecureApps => 0

    /**
     * Native name: COMAdminQCMessageAuthenticateOff
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Native name: COMAdminQCMessageAuthenticateOn
     * @type {Integer (Int32)}
     */
    static On => 2
}
