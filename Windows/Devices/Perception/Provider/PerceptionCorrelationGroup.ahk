#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionCorrelationGroup.ahk
#Include .\IPerceptionCorrelationGroupFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of PerceptionCorrelations describing multiple unique providers in a common coordinate frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelationgroup
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionCorrelationGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionCorrelationGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionCorrelationGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new PerceptionCorrelationGroup from a collection of one or more PerceptionCorrelation objects describing multiple providers in a common coordinate frame.
     * @param {IIterable<PerceptionCorrelation>} relativeLocations The collection of PerceptionCorrelations describing multiple providers in a common coordinate frame.
     * @returns {PerceptionCorrelationGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelationgroup.#ctor
     */
    static Create(relativeLocations) {
        if (!PerceptionCorrelationGroup.HasProp("__IPerceptionCorrelationGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionCorrelationGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionCorrelationGroupFactory.IID)
            PerceptionCorrelationGroup.__IPerceptionCorrelationGroupFactory := IPerceptionCorrelationGroupFactory(factoryPtr)
        }

        return PerceptionCorrelationGroup.__IPerceptionCorrelationGroupFactory.Create(relativeLocations)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The collection of PerceptionCorrelations describing multiple unique providers in a common coordinate frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelationgroup.relativelocations
     * @type {IVectorView<PerceptionCorrelation>} 
     */
    RelativeLocations {
        get => this.get_RelativeLocations()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<PerceptionCorrelation>} 
     */
    get_RelativeLocations() {
        if (!this.HasProp("__IPerceptionCorrelationGroup")) {
            if ((queryResult := this.QueryInterface(IPerceptionCorrelationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionCorrelationGroup := IPerceptionCorrelationGroup(outPtr)
        }

        return this.__IPerceptionCorrelationGroup.get_RelativeLocations()
    }

;@endregion Instance Methods
}
