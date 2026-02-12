#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardTriggerDetails.ahk
#Include .\ISmartCardTriggerDetails2.ahk
#Include .\ISmartCardTriggerDetails3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about a smart card trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the smart card trigger type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.triggertype
     * @type {Integer} 
     */
    TriggerType {
        get => this.get_TriggerType()
    }

    /**
     * Gets the applet ID of the source of the smart card trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.sourceappletid
     * @type {IBuffer} 
     */
    SourceAppletId {
        get => this.get_SourceAppletId()
    }

    /**
     * Gets the smart card trigger data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.triggerdata
     * @type {IBuffer} 
     */
    TriggerData {
        get => this.get_TriggerData()
    }

    /**
     * Gets the smart card emulator that caused the event to trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.emulator
     * @type {SmartCardEmulator} 
     */
    Emulator {
        get => this.get_Emulator()
    }

    /**
     * Gets the smart card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.smartcard
     * @type {SmartCard} 
     */
    SmartCard {
        get => this.get_SmartCard()
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
        if (!this.HasProp("__ISmartCardTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails := ISmartCardTriggerDetails(outPtr)
        }

        return this.__ISmartCardTriggerDetails.get_TriggerType()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SourceAppletId() {
        if (!this.HasProp("__ISmartCardTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails := ISmartCardTriggerDetails(outPtr)
        }

        return this.__ISmartCardTriggerDetails.get_SourceAppletId()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_TriggerData() {
        if (!this.HasProp("__ISmartCardTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails := ISmartCardTriggerDetails(outPtr)
        }

        return this.__ISmartCardTriggerDetails.get_TriggerData()
    }

    /**
     * 
     * @returns {SmartCardEmulator} 
     */
    get_Emulator() {
        if (!this.HasProp("__ISmartCardTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails2 := ISmartCardTriggerDetails2(outPtr)
        }

        return this.__ISmartCardTriggerDetails2.get_Emulator()
    }

    /**
     * Asynchronously attempts to launch the current smart card app using the specified behavior, passing the specified arguments.
     * @param {HSTRING} arguments A string specifying the arguments to pass to the smart card app at launch.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.trylaunchcurrentappasync
     */
    TryLaunchCurrentAppAsync(arguments) {
        if (!this.HasProp("__ISmartCardTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails2 := ISmartCardTriggerDetails2(outPtr)
        }

        return this.__ISmartCardTriggerDetails2.TryLaunchCurrentAppAsync(arguments)
    }

    /**
     * Asynchronously attempts to launch the current smart card app, passing the specified arguments.
     * @param {HSTRING} arguments A string specifying the arguments to pass to the smart card app at launch.
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggerdetails.trylaunchcurrentappasync
     */
    TryLaunchCurrentAppWithBehaviorAsync(arguments, behavior) {
        if (!this.HasProp("__ISmartCardTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails2 := ISmartCardTriggerDetails2(outPtr)
        }

        return this.__ISmartCardTriggerDetails2.TryLaunchCurrentAppWithBehaviorAsync(arguments, behavior)
    }

    /**
     * 
     * @returns {SmartCard} 
     */
    get_SmartCard() {
        if (!this.HasProp("__ISmartCardTriggerDetails3")) {
            if ((queryResult := this.QueryInterface(ISmartCardTriggerDetails3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardTriggerDetails3 := ISmartCardTriggerDetails3(outPtr)
        }

        return this.__ISmartCardTriggerDetails3.get_SmartCard()
    }

;@endregion Instance Methods
}
