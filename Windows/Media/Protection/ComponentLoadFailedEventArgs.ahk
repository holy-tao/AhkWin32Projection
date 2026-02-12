#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IComponentLoadFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for a [MediaProtectionManager](mediaprotectionmanager_mediaprotectionmanager_1221375020.md) object when the load of binary data fails.
 * @remarks
 * This object is not instantiated directly. It is created by the [MediaProtectionManager.ComponentLoadFailed](mediaprotectionmanager_componentloadfailed.md) event and is returned as an argument to the [ComponentLoadFailedEventHandler](componentloadfailedeventhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.componentloadfailedeventargs
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class ComponentLoadFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComponentLoadFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComponentLoadFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns a list of components in the [RevocationAndRenewalInformation](revocationandrenewalinformation.md) object that need to be revoked and renewed with updated components.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.componentloadfailedeventargs.information
     * @type {RevocationAndRenewalInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * Returns an indication of the completion of the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.componentloadfailedeventargs.completion
     * @type {MediaProtectionServiceCompletion} 
     */
    Completion {
        get => this.get_Completion()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RevocationAndRenewalInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IComponentLoadFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IComponentLoadFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComponentLoadFailedEventArgs := IComponentLoadFailedEventArgs(outPtr)
        }

        return this.__IComponentLoadFailedEventArgs.get_Information()
    }

    /**
     * 
     * @returns {MediaProtectionServiceCompletion} 
     */
    get_Completion() {
        if (!this.HasProp("__IComponentLoadFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IComponentLoadFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComponentLoadFailedEventArgs := IComponentLoadFailedEventArgs(outPtr)
        }

        return this.__IComponentLoadFailedEventArgs.get_Completion()
    }

;@endregion Instance Methods
}
