#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardTrigger.ahk
#Include .\ISmartCardTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event triggered by a smart card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.smartcardtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SmartCardTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a SmartCardTrigger
     * @param {Integer} triggerType The trigger type.
     * @returns {SmartCardTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.smartcardtrigger.#ctor
     */
    static Create(triggerType) {
        if (!SmartCardTrigger.HasProp("__ISmartCardTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SmartCardTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardTriggerFactory.IID)
            SmartCardTrigger.__ISmartCardTriggerFactory := ISmartCardTriggerFactory(factoryPtr)
        }

        return SmartCardTrigger.__ISmartCardTriggerFactory.Create(triggerType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the trigger type of a smart card trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.smartcardtrigger.triggertype
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
        if (!this.HasProp("__ISmartCardTrigger")) {
            if ((queryResult := this.QueryInterface(ISmartCardTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTrigger := ISmartCardTrigger(outPtr)
        }

        return this.__ISmartCardTrigger.get_TriggerType()
    }

;@endregion Instance Methods
}
