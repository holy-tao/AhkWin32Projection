#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\ISmsMessageReceivedTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that is raised when an SMS message has arrived.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.smsmessagereceivedtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SmsMessageReceivedTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of an SMS message received trigger.
     * @param {SmsFilterRules} filterRules Filter rules to be applied to incoming SMS messages. Only messages that pass through the filter rules raise the trigger.
     * @returns {SmsMessageReceivedTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.smsmessagereceivedtrigger.#ctor
     */
    static Create(filterRules) {
        if (!SmsMessageReceivedTrigger.HasProp("__ISmsMessageReceivedTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SmsMessageReceivedTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsMessageReceivedTriggerFactory.IID)
            SmsMessageReceivedTrigger.__ISmsMessageReceivedTriggerFactory := ISmsMessageReceivedTriggerFactory(factoryPtr)
        }

        return SmsMessageReceivedTrigger.__ISmsMessageReceivedTriggerFactory.Create(filterRules)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
