#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the kinds of UICC application record.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.uiccapprecordkind
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UiccAppRecordKind extends Win32Enum{

    /**
     * An unknown app record kind. For example, a UICC app that is enumerable by the modem, but is not an app used for cellular registration, would be reported as **Unknown**.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A transparent file - a sequence of bytes without further structure .
     * @type {Integer (Int32)}
     */
    static Transparent => 1

    /**
     * A file that consists of a sequence of records.
     * @type {Integer (Int32)}
     */
    static RecordOriented => 2
}
