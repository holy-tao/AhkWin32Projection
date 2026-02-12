#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISensorDataThresholdTrigger.ahk
#Include .\ISensorDataThresholdTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that responds when a threshold limit for a sensor is crossed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.sensordatathresholdtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SensorDataThresholdTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISensorDataThresholdTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISensorDataThresholdTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [SensorDataThresholdTrigger](sensordatathresholdtrigger.md) class.
     * @param {ISensorDataThreshold} threshold The threshold for a sensor that indicates when it should be triggered.
     * @returns {SensorDataThresholdTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.sensordatathresholdtrigger.#ctor
     */
    static Create(threshold) {
        if (!SensorDataThresholdTrigger.HasProp("__ISensorDataThresholdTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SensorDataThresholdTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISensorDataThresholdTriggerFactory.IID)
            SensorDataThresholdTrigger.__ISensorDataThresholdTriggerFactory := ISensorDataThresholdTriggerFactory(factoryPtr)
        }

        return SensorDataThresholdTrigger.__ISensorDataThresholdTriggerFactory.Create(threshold)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
