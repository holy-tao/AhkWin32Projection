#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values that describe the geographical scope of a cell broadcast message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsgeographicalscope
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsGeographicalScope extends Win32Enum{

    /**
     * An undefined or unknown geographical scope.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Scope is a single cell tower, with immediate display.
     * @type {Integer (Int32)}
     */
    static CellWithImmediateDisplay => 1

    /**
     * Scope is a Location Area.
     * @type {Integer (Int32)}
     */
    static LocationArea => 2

    /**
     * Scope is the entire Public Land Mobile Network (PLMN).
     * @type {Integer (Int32)}
     */
    static Plmn => 3

    /**
     * Scope is a single cell tower.
     * @type {Integer (Int32)}
     */
    static Cell => 4
}
