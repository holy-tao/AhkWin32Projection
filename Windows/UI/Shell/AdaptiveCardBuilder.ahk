#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveCardBuilderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Builds Adaptive Cards that can be used in Windows.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.adaptivecardbuilder
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class AdaptiveCardBuilder extends IInspectable {
;@region Static Methods
    /**
     * Creates a new instance of [IAdaptiveCard](iadaptivecard.md) using the specified Adaptive Card JSON. For more information, see [Get Started with Adaptive Cards](https://adaptivecards.io/documentation/#create-GettingStarted).
     * @param {HSTRING} value A String representation of the JSON that describes the Adaptive Card to create.
     * @returns {IAdaptiveCard} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.adaptivecardbuilder.createadaptivecardfromjson
     */
    static CreateAdaptiveCardFromJson(value) {
        if (!AdaptiveCardBuilder.HasProp("__IAdaptiveCardBuilderStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.AdaptiveCardBuilder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveCardBuilderStatics.IID)
            AdaptiveCardBuilder.__IAdaptiveCardBuilderStatics := IAdaptiveCardBuilderStatics(factoryPtr)
        }

        return AdaptiveCardBuilder.__IAdaptiveCardBuilderStatics.CreateAdaptiveCardFromJson(value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
