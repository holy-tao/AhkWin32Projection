#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentItemState.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a state of a TargetedContentItem object: AppInstallationState, ShouldDisplay.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitemstate
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentItemState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentItemState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentItemState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the boolean for the ShouldDisplay state for the item.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitemstate.shoulddisplay
     * @type {Boolean} 
     */
    ShouldDisplay {
        get => this.get_ShouldDisplay()
    }

    /**
     * Gets [TargetedContentAppInstallationState](targetedcontentappinstallationstate.md) for the item.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitemstate.appinstallationstate
     * @type {Integer} 
     */
    AppInstallationState {
        get => this.get_AppInstallationState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldDisplay() {
        if (!this.HasProp("__ITargetedContentItemState")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItemState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItemState := ITargetedContentItemState(outPtr)
        }

        return this.__ITargetedContentItemState.get_ShouldDisplay()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppInstallationState() {
        if (!this.HasProp("__ITargetedContentItemState")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItemState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItemState := ITargetedContentItemState(outPtr)
        }

        return this.__ITargetedContentItemState.get_AppInstallationState()
    }

;@endregion Instance Methods
}
