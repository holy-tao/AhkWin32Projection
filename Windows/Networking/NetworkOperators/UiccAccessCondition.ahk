#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the conditions placed on operations using a UICC application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.uiccaccesscondition
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UiccAccessCondition extends Win32Enum{

    /**
     * Access is always allowed.
     * @type {Integer (Int32)}
     */
    static AlwaysAllowed => 0

    /**
     * Access requires PIN 1.
     * @type {Integer (Int32)}
     */
    static Pin1 => 1

    /**
     * Access requires PIN 2.
     * @type {Integer (Int32)}
     */
    static Pin2 => 2

    /**
     * Access requires PIN 3.
     * @type {Integer (Int32)}
     */
    static Pin3 => 3

    /**
     * Access requires PIN 4.
     * @type {Integer (Int32)}
     */
    static Pin4 => 4

    /**
     * Access requires Administrative 5.
     * @type {Integer (Int32)}
     */
    static Administrative5 => 5

    /**
     * Access requires Administrative 6.
     * @type {Integer (Int32)}
     */
    static Administrative6 => 6

    /**
     * Access is never allowed.
     * @type {Integer (Int32)}
     */
    static NeverAllowed => 7
}
