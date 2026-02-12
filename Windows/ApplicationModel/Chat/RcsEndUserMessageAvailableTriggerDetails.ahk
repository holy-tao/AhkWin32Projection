#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsEndUserMessageAvailableTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data to the background task about a new message.
 * @remarks
 * An instance of this class is created by the system.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageavailabletriggerdetails
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsEndUserMessageAvailableTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsEndUserMessageAvailableTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsEndUserMessageAvailableTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the title of the new message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageavailabletriggerdetails.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the text of the new message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageavailabletriggerdetails.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
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
    get_Title() {
        if (!this.HasProp("__IRcsEndUserMessageAvailableTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageAvailableTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageAvailableTriggerDetails := IRcsEndUserMessageAvailableTriggerDetails(outPtr)
        }

        return this.__IRcsEndUserMessageAvailableTriggerDetails.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IRcsEndUserMessageAvailableTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageAvailableTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageAvailableTriggerDetails := IRcsEndUserMessageAvailableTriggerDetails(outPtr)
        }

        return this.__IRcsEndUserMessageAvailableTriggerDetails.get_Text()
    }

;@endregion Instance Methods
}
