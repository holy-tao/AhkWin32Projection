#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionFaceAuthenticationGroup.ahk
#Include .\IPerceptionFaceAuthenticationGroupFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A group of unique identifiers specifying IPerceptionFrameProviders that share handlers for entering and exiting Face Authentication mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionfaceauthenticationgroup
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionFaceAuthenticationGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionFaceAuthenticationGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionFaceAuthenticationGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new PerceptionFaceAuthenticationGroup instance.
     * @remarks
     * Creates a PerceptionFaceAuthenticationGroup from a collection of unique identifiers specifying IPerceptionFrameProviders, a handler for the start of Face Authentication, and a handler for the end of Face Authentication.
     * @param {IIterable<HSTRING>} ids The collection of unique identifiers which maps to IPerceptionFrameProviders via PerceptionFrameProviderInfo::Id.
     * @param {PerceptionStartFaceAuthenticationHandler} startHandler The handler to invoke when this group is requested to enter Face Authentication mode returning if it's ready.
     * @param {PerceptionStopFaceAuthenticationHandler} stopHandler The handler to invoke when this group is leaving Face Authentication mode after startHandler is called and returned true.
     * @returns {PerceptionFaceAuthenticationGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionfaceauthenticationgroup.#ctor
     */
    static Create(ids, startHandler, stopHandler) {
        if (!PerceptionFaceAuthenticationGroup.HasProp("__IPerceptionFaceAuthenticationGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFaceAuthenticationGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFaceAuthenticationGroupFactory.IID)
            PerceptionFaceAuthenticationGroup.__IPerceptionFaceAuthenticationGroupFactory := IPerceptionFaceAuthenticationGroupFactory(factoryPtr)
        }

        return PerceptionFaceAuthenticationGroup.__IPerceptionFaceAuthenticationGroupFactory.Create(ids, startHandler, stopHandler)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The id(s) of the IPerceptionFrameProvider(s) referenced by this group.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionfaceauthenticationgroup.frameproviderids
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
        if (!this.HasProp("__IPerceptionFaceAuthenticationGroup")) {
            if ((queryResult := this.QueryInterface(IPerceptionFaceAuthenticationGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFaceAuthenticationGroup := IPerceptionFaceAuthenticationGroup(outPtr)
        }

        return this.__IPerceptionFaceAuthenticationGroup.get_FrameProviderIds()
    }

;@endregion Instance Methods
}
