#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomSystemEventTrigger.ahk
#Include .\ICustomSystemEventTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class allows you to specify a custom system trigger so that you can register it and respond when it is triggered by the system.
 * @remarks
 * Use this class to define a trigger when the OS doesn't provide a system trigger that you need. Such as when a hardware driver and the UWP app both belong to 3rd party, and the hardware driver needs to raise a custom event that its app handles. For example, an audio card that needs to notify a user when an audio jack is plugged in.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.customsystemeventtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class CustomSystemEventTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomSystemEventTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomSystemEventTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of a **CustomSystemEventTrigger**, with the specified identifier and recurrence.
     * @param {HSTRING} triggerId The identifier for the created **CustomSystemEventTrigger**.
     * @param {Integer} recurrence When the trigger may be activated.
     * @returns {CustomSystemEventTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.customsystemeventtrigger.#ctor
     */
    static Create(triggerId, recurrence) {
        if (!CustomSystemEventTrigger.HasProp("__ICustomSystemEventTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.CustomSystemEventTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomSystemEventTriggerFactory.IID)
            CustomSystemEventTrigger.__ICustomSystemEventTriggerFactory := ICustomSystemEventTriggerFactory(factoryPtr)
        }

        return CustomSystemEventTrigger.__ICustomSystemEventTriggerFactory.Create(triggerId, recurrence)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The trigger identifier that uniquely identifies the background task that needs to be started by this trigger.
     * @remarks
     * Consider using a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in string form.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.customsystemeventtrigger.triggerid
     * @type {HSTRING} 
     */
    TriggerId {
        get => this.get_TriggerId()
    }

    /**
     * Gets when this custom system event trigger may be activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.customsystemeventtrigger.recurrence
     * @type {Integer} 
     */
    Recurrence {
        get => this.get_Recurrence()
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
    get_TriggerId() {
        if (!this.HasProp("__ICustomSystemEventTrigger")) {
            if ((queryResult := this.QueryInterface(ICustomSystemEventTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSystemEventTrigger := ICustomSystemEventTrigger(outPtr)
        }

        return this.__ICustomSystemEventTrigger.get_TriggerId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Recurrence() {
        if (!this.HasProp("__ICustomSystemEventTrigger")) {
            if ((queryResult := this.QueryInterface(ICustomSystemEventTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSystemEventTrigger := ICustomSystemEventTrigger(outPtr)
        }

        return this.__ICustomSystemEventTrigger.get_Recurrence()
    }

;@endregion Instance Methods
}
