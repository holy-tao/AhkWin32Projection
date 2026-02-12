#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandUiccAppsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Reports results of a call to [MobileBroadbandUicc.GetUiccAppsAsync](mobilebroadbanduicc_getuiccappsasync_1099934605.md).
 * @remarks
 * Your code does not instantiate this class directly. Instead, use the instance returned by the [MobileBroadbandUicc.GetUiccAppsAsync](mobilebroadbanduicc_getuiccappsasync_1099934605.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappsresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandUiccAppsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandUiccAppsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandUiccAppsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the completed [MobileBroadbandUicc.GetUiccAppsAsync](mobilebroadbanduicc_getuiccappsasync_1099934605.md) operation. If this value is not **Success**, then other properties may not be valid.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * A list of UICC applications retrieved using [MobileBroadbandUicc.GetUiccAppsAsync](mobilebroadbanduicc_getuiccappsasync_1099934605.md). Note that this is only valid when *Status* is **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappsresult.uiccapps
     * @type {IVectorView<MobileBroadbandUiccApp>} 
     */
    UiccApps {
        get => this.get_UiccApps()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMobileBroadbandUiccAppsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppsResult := IMobileBroadbandUiccAppsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppsResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandUiccApp>} 
     */
    get_UiccApps() {
        if (!this.HasProp("__IMobileBroadbandUiccAppsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppsResult := IMobileBroadbandUiccAppsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppsResult.get_UiccApps()
    }

;@endregion Instance Methods
}
