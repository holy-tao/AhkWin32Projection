#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandUiccApp.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a UICC (SIM card) application.
 * @remarks
 * Your code does not instantiate this class directly. To get instances of this class, first call the [MobileBroadbandUicc.GetUiccAppsAsync](mobilebroadbanduicc_getuiccappsasync_1099934605.md) method. Then, from the [MobileBroadbandUiccAppsResult](mobilebroadbanduiccappsresult.md) instance returned by that method, get instances of this class from the list in the [MobileBroadbandUiccAppsResult.UiccApps](mobilebroadbanduiccappsresult.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapp
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandUiccApp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandUiccApp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandUiccApp.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of this UICC application.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapp.id
     * @type {IBuffer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets what kind of UICC application this instance represents.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapp.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Id() {
        if (!this.HasProp("__IMobileBroadbandUiccApp")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccApp := IMobileBroadbandUiccApp(outPtr)
        }

        return this.__IMobileBroadbandUiccApp.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IMobileBroadbandUiccApp")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccApp := IMobileBroadbandUiccApp(outPtr)
        }

        return this.__IMobileBroadbandUiccApp.get_Kind()
    }

    /**
     * Asynchronously retrieves details about a UICC application.
     * @param {IIterable<Integer>} uiccFilePath A sequence of characters specifying the UICC file path of the application. Use the [MobileBroadbandUiccApp.Id](mobilebroadbanduiccapp_id.md) property value of this instance, to get app record details for this application.
     * @returns {IAsyncOperation<MobileBroadbandUiccAppRecordDetailsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapp.getrecorddetailsasync
     */
    GetRecordDetailsAsync(uiccFilePath) {
        if (!this.HasProp("__IMobileBroadbandUiccApp")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccApp := IMobileBroadbandUiccApp(outPtr)
        }

        return this.__IMobileBroadbandUiccApp.GetRecordDetailsAsync(uiccFilePath)
    }

    /**
     * Asynchronously reads a UICC application record.
     * @param {IIterable<Integer>} uiccFilePath A sequence of characters specifying the path to the UICC application.
     * @param {Integer} recordIndex The record index within the UICC application's records.
     * @returns {IAsyncOperation<MobileBroadbandUiccAppReadRecordResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapp.readrecordasync
     */
    ReadRecordAsync(uiccFilePath, recordIndex) {
        if (!this.HasProp("__IMobileBroadbandUiccApp")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccApp := IMobileBroadbandUiccApp(outPtr)
        }

        return this.__IMobileBroadbandUiccApp.ReadRecordAsync(uiccFilePath, recordIndex)
    }

;@endregion Instance Methods
}
