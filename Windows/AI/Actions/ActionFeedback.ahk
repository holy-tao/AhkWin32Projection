#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionFeedback.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about user feedback for an action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionfeedback
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionFeedback extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionFeedback

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionFeedback.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying the kind of user feedback represented by the [ActionFeedback](actionfeedback.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionfeedback.feedbackkind
     * @type {Integer} 
     */
    FeedbackKind {
        get => this.get_FeedbackKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FeedbackKind() {
        if (!this.HasProp("__IActionFeedback")) {
            if ((queryResult := this.QueryInterface(IActionFeedback.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionFeedback := IActionFeedback(outPtr)
        }

        return this.__IActionFeedback.get_FeedbackKind()
    }

    /**
     * Closes and releases any resources used by this **ActionFeedback**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionfeedback.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
