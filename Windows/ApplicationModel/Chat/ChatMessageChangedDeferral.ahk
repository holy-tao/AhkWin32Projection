#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageChangedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a deferred asynchronous change request.
 * @remarks
 * Obtain an instance of this class by calling [GetDeferral](chatmessagechangedeventargs_getdeferral_254836512.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangeddeferral
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageChangedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageChangedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageChangedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Fires to indicate that the deferred change request has completed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangeddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IChatMessageChangedDeferral")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangedDeferral := IChatMessageChangedDeferral(outPtr)
        }

        return this.__IChatMessageChangedDeferral.Complete()
    }

;@endregion Instance Methods
}
