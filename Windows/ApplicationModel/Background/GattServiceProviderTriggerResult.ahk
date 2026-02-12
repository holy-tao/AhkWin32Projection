#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProviderTriggerResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains the trigger created by [GattServiceProviderTrigger.CreateAsync()](gattserviceprovidertrigger_createasync_776293710.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertriggerresult
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderTriggerResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProviderTriggerResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProviderTriggerResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Trigger created by [GattServiceProviderTrigger.CreateAsync](gattserviceprovidertrigger_createasync_776293710.md)
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertriggerresult.trigger
     * @type {GattServiceProviderTrigger} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * Get the status of creating the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertriggerresult.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattServiceProviderTrigger} 
     */
    get_Trigger() {
        if (!this.HasProp("__IGattServiceProviderTriggerResult")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTriggerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTriggerResult := IGattServiceProviderTriggerResult(outPtr)
        }

        return this.__IGattServiceProviderTriggerResult.get_Trigger()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IGattServiceProviderTriggerResult")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTriggerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTriggerResult := IGattServiceProviderTriggerResult(outPtr)
        }

        return this.__IGattServiceProviderTriggerResult.get_Error()
    }

;@endregion Instance Methods
}
