#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionControlGroup.ahk
#Include .\IPerceptionControlGroupFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A group of IPerceptionFrameProvider identifiers to be controlled together.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncontrolgroup
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionControlGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionControlGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionControlGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a PerceptionControlGroup containing the IPerceptionFrameProviders with the ids specified.
     * @param {IIterable<HSTRING>} ids A list of the unique identifiers associated with the grouped IPerceptionFrameProviders. To be controllable, the id must match the associated PerceptionFrameProviderInfo::Id property.
     * @returns {PerceptionControlGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncontrolgroup.#ctor
     */
    static Create(ids) {
        if (!PerceptionControlGroup.HasProp("__IPerceptionControlGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionControlGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionControlGroupFactory.IID)
            PerceptionControlGroup.__IPerceptionControlGroupFactory := IPerceptionControlGroupFactory(factoryPtr)
        }

        return PerceptionControlGroup.__IPerceptionControlGroupFactory.Create(ids)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The id(s) of the IPerceptionFrameProvider(s) controlled by this group.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncontrolgroup.frameproviderids
     * @type {IVectorView<HSTRING>} 
     */
    FrameProviderIds {
        get => this.get_FrameProviderIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_FrameProviderIds() {
        if (!this.HasProp("__IPerceptionControlGroup")) {
            if ((queryResult := this.QueryInterface(IPerceptionControlGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionControlGroup := IPerceptionControlGroup(outPtr)
        }

        return this.__IPerceptionControlGroup.get_FrameProviderIds()
    }

;@endregion Instance Methods
}
