#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a set of property flags that are part of a phone line changed trigger. Multiple properties can be set at one time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonelineproperties
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneLineProperties extends Win32BitflagEnum{

    /**
     * No property.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The branding options for the phone line.
     * @type {Integer (UInt32)}
     */
    static BrandingOptions => 1

    /**
     * The ability to dial outgoing calls on the phone line.
     * @type {Integer (UInt32)}
     */
    static CanDial => 2

    /**
     * The cellular details for the phone line.
     * @type {Integer (UInt32)}
     */
    static CellularDetails => 4

    /**
     * The preferred display color for the phone line.
     * @type {Integer (UInt32)}
     */
    static DisplayColor => 8

    /**
     * The user assigned friendly name of the phone line.
     * @type {Integer (UInt32)}
     */
    static DisplayName => 16

    /**
     * The name of the current network that is being used by the phone line.
     * @type {Integer (UInt32)}
     */
    static NetworkName => 32

    /**
     * The current network status of the phone line.
     * @type {Integer (UInt32)}
     */
    static NetworkState => 64

    /**
     * The transport (cellular or voice over IP) for the phone line.
     * @type {Integer (UInt32)}
     */
    static Transport => 128

    /**
     * The voice mail account associated with the phone line.
     * @type {Integer (UInt32)}
     */
    static Voicemail => 256
}
