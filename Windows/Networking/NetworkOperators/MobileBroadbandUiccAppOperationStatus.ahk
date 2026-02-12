#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of an operation on a UICC application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappoperationstatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandUiccAppOperationStatus extends Win32Enum{

    /**
     * Successful completion.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Operation failed due to an invalid UICC file path being specified.
     * @type {Integer (Int32)}
     */
    static InvalidUiccFilePath => 1

    /**
     * Operation failed due to an access condition not being met.
     * @type {Integer (Int32)}
     */
    static AccessConditionNotHeld => 2

    /**
     * Operation failed because the UICC was busy.
     * @type {Integer (Int32)}
     */
    static UiccBusy => 3
}
