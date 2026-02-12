#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsEndUserMessageManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RcsEndUserMessageManager.ahk
#Include .\RcsEndUserMessageAvailableEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides functionality for handling message events.
 * @remarks
 * Call the [RcsManager.GetEndUserMessageManager](rcsmanager_getendusermessagemanager_1380387568.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessagemanager
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsEndUserMessageManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsEndUserMessageManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsEndUserMessageManager.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageAvailableChangedToken")) {
            this.remove_MessageAvailableChanged(this.__OnMessageAvailableChangedToken)
            this.__OnMessageAvailableChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<RcsEndUserMessageManager, RcsEndUserMessageAvailableEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageAvailableChanged(handler) {
        if (!this.HasProp("__IRcsEndUserMessageManager")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageManager := IRcsEndUserMessageManager(outPtr)
        }

        return this.__IRcsEndUserMessageManager.add_MessageAvailableChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MessageAvailableChanged(token) {
        if (!this.HasProp("__IRcsEndUserMessageManager")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageManager := IRcsEndUserMessageManager(outPtr)
        }

        return this.__IRcsEndUserMessageManager.remove_MessageAvailableChanged(token)
    }

;@endregion Instance Methods
}
