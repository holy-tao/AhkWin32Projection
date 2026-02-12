#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneTrigger.ahk
#Include .\IPhoneTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a phone event that triggers a background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.phonetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class PhoneTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [PhoneTrigger](phonetrigger.md) class.
     * @param {Integer} type Specifies the type of phone event.
     * @param {Boolean} oneShot Indicates if the trigger is a one-shot notification. If you weren't subscribed when a one-shot notification was sent, you get nothing. If you weren't connected when you fired a one-shot notification, nothing happens.
     * @returns {PhoneTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.phonetrigger.#ctor
     */
    static Create(type, oneShot) {
        if (!PhoneTrigger.HasProp("__IPhoneTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.PhoneTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneTriggerFactory.IID)
            PhoneTrigger.__IPhoneTriggerFactory := IPhoneTriggerFactory(factoryPtr)
        }

        return PhoneTrigger.__IPhoneTriggerFactory.Create(type, oneShot)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a Boolean value indicating if the trigger is a one-shot notification.
     * @remarks
     * If you weren't subscribed when a one-shot notification was sent, you get nothing. If you weren't connected when you fired a one-shot notification, nothing happens.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.phonetrigger.oneshot
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

    /**
     * Gets the type of phone event indicated by the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.phonetrigger.triggertype
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
     * @returns {Boolean} 
     */
    get_OneShot() {
        if (!this.HasProp("__IPhoneTrigger")) {
            if ((queryResult := this.QueryInterface(IPhoneTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneTrigger := IPhoneTrigger(outPtr)
        }

        return this.__IPhoneTrigger.get_OneShot()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriggerType() {
        if (!this.HasProp("__IPhoneTrigger")) {
            if ((queryResult := this.QueryInterface(IPhoneTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneTrigger := IPhoneTrigger(outPtr)
        }

        return this.__IPhoneTrigger.get_TriggerType()
    }

;@endregion Instance Methods
}
