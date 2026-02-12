#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentAction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the [TargetedContentValue](targetedcontentvalue.md) of the [TargetedContentValueKind](targetedcontentvaluekind.md) of type Action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentaction
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentAction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentAction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentAction.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Invokes the action.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentaction.invokeasync
     */
    InvokeAsync() {
        if (!this.HasProp("__ITargetedContentAction")) {
            if ((queryResult := this.QueryInterface(ITargetedContentAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentAction := ITargetedContentAction(outPtr)
        }

        return this.__ITargetedContentAction.InvokeAsync()
    }

;@endregion Instance Methods
}
