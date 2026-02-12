#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocationTrigger.ahk
#Include .\ILocationTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a location event that triggers a background task. This is used for Geofencing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.locationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class LocationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocationTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a location event trigger.
     * @param {Integer} triggerType The type of location event for this trigger.
     * @returns {LocationTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.locationtrigger.#ctor
     */
    static Create(triggerType) {
        if (!LocationTrigger.HasProp("__ILocationTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.LocationTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocationTriggerFactory.IID)
            LocationTrigger.__ILocationTriggerFactory := ILocationTriggerFactory(factoryPtr)
        }

        return LocationTrigger.__ILocationTriggerFactory.Create(triggerType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The type of location event for this trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.locationtrigger.triggertype
     * @type {Integer} 
     */
    TriggerType {
        get => this.get_TriggerType()
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
    get_TriggerType() {
        if (!this.HasProp("__ILocationTrigger")) {
            if ((queryResult := this.QueryInterface(ILocationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocationTrigger := ILocationTrigger(outPtr)
        }

        return this.__ILocationTrigger.get_TriggerType()
    }

;@endregion Instance Methods
}
