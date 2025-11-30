#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PHONECAPS_LONG enum is used by methods that set or get phone capabilities described by a long value.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-phonecaps_long
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONECAPS_LONG extends Win32Enum{

    /**
     * Specifies the hookswitch devices available using one or more members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_device">PHONE_HOOK_SWITCH_DEVICE</a> enum.
     * @type {Integer (Int32)}
     */
    static PCL_HOOKSWITCHES => 0

    /**
     * Specifies the handset hook switch modes.
     * @type {Integer (Int32)}
     */
    static PCL_HANDSETHOOKSWITCHMODES => 1

    /**
     * Specifies the headset hook switch modes.
     * @type {Integer (Int32)}
     */
    static PCL_HEADSETHOOKSWITCHMODES => 2

    /**
     * Specifies the speakerphone hook switch modes.
     * @type {Integer (Int32)}
     */
    static PCL_SPEAKERPHONEHOOKSWITCHMODES => 3

    /**
     * Specifies the number of rows in a phone display device.
     * @type {Integer (Int32)}
     */
    static PCL_DISPLAYNUMROWS => 4

    /**
     * Specifies the number of columns in a phone display device.
     * @type {Integer (Int32)}
     */
    static PCL_DISPLAYNUMCOLUMNS => 5

    /**
     * Specifies the number of ring modes. 
     * 
     * 
     * 
     * 
     * If a USB phone returns zero for this value, the phone typically does not have a ringer device. The ringing sound plays on the default audio device for the system; for example, on sound card speakers.
     * @type {Integer (Int32)}
     */
    static PCL_NUMRINGMODES => 6

    /**
     * Specifies the number of button lamps.
     * @type {Integer (Int32)}
     */
    static PCL_NUMBUTTONLAMPS => 7

    /**
     * Specifies whether the phone is generic: a value of one indicates it is, a value of zero indicates it is not. 
     * 
     * 
     * 
     * 
     * A generic phone is a phone device that declares itself as available on all addresses that support audio terminals. For example, a USB phone is generic, because it is not tied to a specific TAPI address.
     * @type {Integer (Int32)}
     */
    static PCL_GENERICPHONE => 8
}
