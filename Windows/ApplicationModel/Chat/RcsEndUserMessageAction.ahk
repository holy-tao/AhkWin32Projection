#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsEndUserMessageAction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the actions to which the user can respond.
 * @remarks
 * Call [RcsEndUserMessage.Actions](rcsendusermessage_actions.md) to instantiate this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageaction
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsEndUserMessageAction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsEndUserMessageAction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsEndUserMessageAction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the label of the action.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageaction.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
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
    get_Label() {
        if (!this.HasProp("__IRcsEndUserMessageAction")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageAction := IRcsEndUserMessageAction(outPtr)
        }

        return this.__IRcsEndUserMessageAction.get_Label()
    }

;@endregion Instance Methods
}
