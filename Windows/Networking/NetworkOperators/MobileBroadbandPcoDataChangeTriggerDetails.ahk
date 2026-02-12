#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPcoDataChangeTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class providing details about a Protocol Configuration Options (PCO) data change notification.
 * @remarks
 * When your background task is triggered by a PCO data change notification, it is passed an instance of this class in the [IBackgroundTaskInstance.TriggerDetails](/uwp/api/Windows.ApplicationModel.Background.IBackgroundTaskInstance.TriggerDetails) property.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpcodatachangetriggerdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPcoDataChangeTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPcoDataChangeTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPcoDataChangeTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets details about a Protocol Configuration Options (PCO) data change notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpcodatachangetriggerdetails.updateddata
     * @type {MobileBroadbandPco} 
     */
    UpdatedData {
        get => this.get_UpdatedData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MobileBroadbandPco} 
     */
    get_UpdatedData() {
        if (!this.HasProp("__IMobileBroadbandPcoDataChangeTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPcoDataChangeTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPcoDataChangeTriggerDetails := IMobileBroadbandPcoDataChangeTriggerDetails(outPtr)
        }

        return this.__IMobileBroadbandPcoDataChangeTriggerDetails.get_UpdatedData()
    }

;@endregion Instance Methods
}
