#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionCorrelation.ahk
#Include .\IPerceptionCorrelationFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A description of the physical position and orientation of a device specified by the IPerceptionFrameProvider's unique identifier (PerceptionFrameProviderInfo::Id) sharing a common coordinate frame of other PerceptionCorrelations that will be combined into a PerceptionCorrelationGroup.
 * @remarks
 * The origin of this coordinate frame can be the position of one of the cameras in the PerceptionCorrelationGroup such that one camera will have a Windows::Foundation::Numerics::Vector3::Zero Position and all others will not.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelation
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionCorrelation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionCorrelation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionCorrelation.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new PerceptionCorrelation instance.
     * @remarks
     * Creates a PerceptionCorrelation associating a position and orientation with the unique identifier of an IPerceptionFrameProvider (via its PerceptionFrameProviderInfo::Id). When combined into an PerceptionCorrelationGroup, relative positions and orientations can be obtained to correlate resulting frames from each IPerceptionFrameProvider in the group.
     * @param {HSTRING} targetId The unique identifier of the IPerceptionFrameProvider being described.
     * @param {Vector3} position The position of the device in a common coordinate frame of all members of a PerceptionCorrelationGroup.
     * @param {Quaternion} orientation_ The orientation of the device in a common coordinate frame of all members of a PerceptionCorrelationGroup.
     * @returns {PerceptionCorrelation} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelation.#ctor
     */
    static Create(targetId, position, orientation_) {
        if (!PerceptionCorrelation.HasProp("__IPerceptionCorrelationFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionCorrelation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionCorrelationFactory.IID)
            PerceptionCorrelation.__IPerceptionCorrelationFactory := IPerceptionCorrelationFactory(factoryPtr)
        }

        return PerceptionCorrelation.__IPerceptionCorrelationFactory.Create(targetId, position, orientation_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The unique identifier of the described device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelation.targetid
     * @type {HSTRING} 
     */
    TargetId {
        get => this.get_TargetId()
    }

    /**
     * The position of the device in the common coordinate frame shared by other PerceptionCorrelations in the PerceptionCorrelationGroup.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelation.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The orientation of the device in the common coordinate frame shared by other PerceptionCorrelations in the PerceptionCorrelationGroup.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptioncorrelation.orientation
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetId() {
        if (!this.HasProp("__IPerceptionCorrelation")) {
            if ((queryResult := this.QueryInterface(IPerceptionCorrelation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionCorrelation := IPerceptionCorrelation(outPtr)
        }

        return this.__IPerceptionCorrelation.get_TargetId()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IPerceptionCorrelation")) {
            if ((queryResult := this.QueryInterface(IPerceptionCorrelation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionCorrelation := IPerceptionCorrelation(outPtr)
        }

        return this.__IPerceptionCorrelation.get_Position()
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        if (!this.HasProp("__IPerceptionCorrelation")) {
            if ((queryResult := this.QueryInterface(IPerceptionCorrelation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionCorrelation := IPerceptionCorrelation(outPtr)
        }

        return this.__IPerceptionCorrelation.get_Orientation()
    }

;@endregion Instance Methods
}
