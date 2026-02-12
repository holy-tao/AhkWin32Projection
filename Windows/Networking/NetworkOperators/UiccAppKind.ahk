#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the kinds of UICC applications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.uiccappkind
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UiccAppKind extends Win32Enum{

    /**
     * An unknown kind.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Master File application.
     * @type {Integer (Int32)}
     */
    static MF => 1

    /**
     * A GSM application.
     * @type {Integer (Int32)}
     */
    static MFSim => 2

    /**
     * Removable user identity card application.
     * @type {Integer (Int32)}
     */
    static MFRuim => 3

    /**
     * UMTS application.
     * @type {Integer (Int32)}
     */
    static USim => 4

    /**
     * CDMA application.
     * @type {Integer (Int32)}
     */
    static CSim => 5

    /**
     * IP multimedia services application.
     * @type {Integer (Int32)}
     */
    static ISim => 6
}
