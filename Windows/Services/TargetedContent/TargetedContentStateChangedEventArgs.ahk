#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the arguments for the State Changed event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentstatechangedeventargs
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the deferral. Required for async handlers. The caller is responsible for calling Complete when the event is handled.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentstatechangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ITargetedContentStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITargetedContentStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentStateChangedEventArgs := ITargetedContentStateChangedEventArgs(outPtr)
        }

        return this.__ITargetedContentStateChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
