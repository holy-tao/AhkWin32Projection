#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The possible locations for displaying network operator information to the user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinenetworkoperatordisplaytextlocation
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineNetworkOperatorDisplayTextLocation extends Win32Enum{

    /**
     * The default value.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The phone tile.
     * @type {Integer (Int32)}
     */
    static Tile => 1

    /**
     * The dialer UI.
     * @type {Integer (Int32)}
     */
    static Dialer => 2

    /**
     * The UI when the user as actively in a call.
     * @type {Integer (Int32)}
     */
    static InCallUI => 3
}
