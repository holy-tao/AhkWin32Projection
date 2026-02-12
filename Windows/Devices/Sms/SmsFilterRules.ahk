#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsFilterRules.ahk
#Include .\ISmsFilterRulesFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A collection of [SmsFilterRule](smsfilterrule_smsfilterrule_2115813883.md) instances.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrules
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsFilterRules extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsFilterRules

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsFilterRules.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [SmsFilterRules](smsfilterrules.md).
     * @param {Integer} actionType An enumeration value that specifies which action type is to be associated with the rules for this instance. Action type determines the order in which rules are evaluated, as well as the action to be taken when a rule is matched.
     * @returns {SmsFilterRules} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrules.#ctor
     */
    static CreateFilterRules(actionType) {
        if (!SmsFilterRules.HasProp("__ISmsFilterRulesFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsFilterRules")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsFilterRulesFactory.IID)
            SmsFilterRules.__ISmsFilterRulesFactory := ISmsFilterRulesFactory(factoryPtr)
        }

        return SmsFilterRules.__ISmsFilterRulesFactory.CreateFilterRules(actionType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The [SmsFilterActionType](smsfilteractiontype.md) for this set of filter rules.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrules.actiontype
     * @type {Integer} 
     */
    ActionType {
        get => this.get_ActionType()
    }

    /**
     * Gets the list of rules in this [SmsFilterRules](smsfilterrules.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrules.rules
     * @type {IVector<SmsFilterRule>} 
     */
    Rules {
        get => this.get_Rules()
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
    get_ActionType() {
        if (!this.HasProp("__ISmsFilterRules")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRules.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRules := ISmsFilterRules(outPtr)
        }

        return this.__ISmsFilterRules.get_ActionType()
    }

    /**
     * 
     * @returns {IVector<SmsFilterRule>} 
     */
    get_Rules() {
        if (!this.HasProp("__ISmsFilterRules")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRules.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRules := ISmsFilterRules(outPtr)
        }

        return this.__ISmsFilterRules.get_Rules()
    }

;@endregion Instance Methods
}
