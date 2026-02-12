#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible formats for a mobile broadband PIN.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpinformat
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinFormat extends Win32Enum{

    /**
     * No PIN format has been defined. This is normally not used.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The PIN is numeric.
     * @type {Integer (Int32)}
     */
    static Numeric => 1

    /**
     * The PIN is alphanumeric.
     * @type {Integer (Int32)}
     */
    static Alphanumeric => 2
}
