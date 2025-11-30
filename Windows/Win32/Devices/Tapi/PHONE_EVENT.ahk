#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PHONE_EVENT enum indicates a type of phone event.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-phone_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_EVENT extends Win32Enum{

    /**
     * Phone display has changed.
     * @type {Integer (Int32)}
     */
    static PE_DISPLAY => 0

    /**
     * Lamp mode has changed.
     * @type {Integer (Int32)}
     */
    static PE_LAMPMODE => 1

    /**
     * Ringing mode has changed.
     * @type {Integer (Int32)}
     */
    static PE_RINGMODE => 2

    /**
     * Ringing volume has changed.
     * @type {Integer (Int32)}
     */
    static PE_RINGVOLUME => 3

    /**
     * Hookswitch status has changed.
     * @type {Integer (Int32)}
     */
    static PE_HOOKSWITCH => 4

    /**
     * Phone capabilities have changed.
     * @type {Integer (Int32)}
     */
    static PE_CAPSCHANGE => 5

    /**
     * The phone button has changed.
     * @type {Integer (Int32)}
     */
    static PE_BUTTON => 6

    /**
     * The phone has been closed.
     * @type {Integer (Int32)}
     */
    static PE_CLOSE => 7

    /**
     * A dialed number has been gathered by the phone.
     * @type {Integer (Int32)}
     */
    static PE_NUMBERGATHERED => 8

    /**
     * The phone is dialing.
     * @type {Integer (Int32)}
     */
    static PE_DIALING => 9

    /**
     * The phone has been answered.
     * @type {Integer (Int32)}
     */
    static PE_ANSWER => 10

    /**
     * The phone has been disconnected.
     * @type {Integer (Int32)}
     */
    static PE_DISCONNECT => 11

    /**
     * Last item in enum. Allows device-specific additions to this enum.
     * @type {Integer (Int32)}
     */
    static PE_LASTITEM => 11
}
